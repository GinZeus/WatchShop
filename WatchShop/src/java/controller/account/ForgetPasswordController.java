/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.account;

import dal.AccountDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import model.Account;

/**
 *
 * @author Warspite
 */
public class ForgetPasswordController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ForgetPasswordController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ForgetPasswordController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
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
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String mess1;
        String mess2;
        String email =request.getParameter("email");
        AccountDAO dao = new AccountDAO();
        if(dao.getAccountByMail(email) == null){
            mess1 = "Email does not belong to any account!";
            request.setAttribute("mess1", mess1);
        }else{
            Account account = dao.getAccountByMail(email);
            String link = "http://localhost:8080/WatchShop/ResetPasswordController?email="+email;
            mess2 = "Email send successfully, please check your mail inbox to reset password!";
            dao.sendMail(email, "Reset password - WatchShop"
                    , "<h2>Hi <span style=\"color:blue;\">"+account.getUsername()+"</span>,</h2>\n"
                    + "<h2>There was a request to change your password! </h2>\n"
                    + "<h3>If you did not make this request then please ignore this email.</h3>\n"
                    + "<p style=\"color:blue;\">Otherwise, please click this link to change your password: \n"
                    + "<a href=\""+link+"\" style=\"background-color:cyan; color:black; border:1px solid black; text-decoration: none; padding: 10px; font-weight: bolder;\">Reset password</a>\n"
                    + "</p>\n"
                    + "\n"
                    + "<br> \n"
                    + "<h4 style=\"text-align: center;\">----------WatchShop - Group 5----------</h4>");
            request.setAttribute("mess2", mess2);
        }
        
        request.getRequestDispatcher("ForgetPassword.jsp").forward(request, response);
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
