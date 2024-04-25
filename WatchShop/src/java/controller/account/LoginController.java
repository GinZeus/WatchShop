/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.account;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import utility.Encode;

/**
 *
 * @author DELL
 */
public class LoginController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        AccountDAO acd = new AccountDAO();
        Account a = acd.getAccountByName(username);
        if(a == null){
            request.setAttribute("mess1","Account does not exist!");           
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }else{
            password= Encode.toSHA1(password);  
            Account ac= acd.getAccountToAccess(username, password);
            if(ac == null ){
                request.setAttribute("mess2","Password is incorrect!");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            }else if(ac.getStatus()==0){
                request.setAttribute("mess2","Account has been banned!");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            }else if(ac.getStatus()==1){
                request.setAttribute("mess2","Account has not verified!");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            }else if(ac.getRole_id()==4){
                HttpSession session = request.getSession();
                session.setAttribute("acc_id", ac.getAcc_id());
                session.setAttribute("username", ac.getUsername());
                session.setAttribute("account", ac);
                session.setMaxInactiveInterval(60*60*24);
                response.sendRedirect("HomeController");
            }else if(ac.getRole_id()==3){
                HttpSession session = request.getSession();
                session.setAttribute("acc_id", ac.getAcc_id());
                session.setAttribute("username", ac.getUsername());
                session.setAttribute("account", ac);
                session.setMaxInactiveInterval(60*60*24);
                response.sendRedirect("SaleDashboardController");
            }else if(ac.getRole_id()==2){
                HttpSession session = request.getSession();
                session.setAttribute("acc_id", ac.getAcc_id());
                session.setAttribute("username", ac.getUsername());
                session.setAttribute("account", ac);
                session.setMaxInactiveInterval(60*60*24);
                response.sendRedirect("SaleDashboardController");
            }else if(ac.getRole_id()==1){
                HttpSession session = request.getSession();
                session.setAttribute("acc_id", ac.getAcc_id());
                session.setAttribute("username", ac.getUsername());
                session.setAttribute("account", ac);
                session.setMaxInactiveInterval(60*60*24);
                response.sendRedirect("AdminDashboardController");
            }
        }
        
    } 
    public static void main(String[] args) {
        AccountDAO acd = new AccountDAO();
        Account a = acd.getAccountToAccess("admin","admin");
        System.out.println(a);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
