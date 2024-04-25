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
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import model.Account;
import utility.Encode;

/**
 *
 * @author Warspite
 */
public class PasswordControllerV2 extends HttpServlet {

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
            out.println("<title>Servlet PasswordControllerV2</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PasswordControllerV2 at " + request.getContextPath() + "</h1>");
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
        // get account from session
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account == null) {
            //rediret back to login
            request.setAttribute("needLogin", "You need to login to proceed!");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else {
            if (account.getRole_id() == 4) {
                response.sendRedirect("Error.jsp");
            } else {
                // send account info
                request.setAttribute("acc", account);
                // redirect to jsp
                request.getRequestDispatcher("ChangePassword(Seller,Manager,Admin).jsp").forward(request, response);
            }
        }
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
        // get account from session
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account == null) {
            request.setAttribute("needLogin", "You need to login to proceed!");
            request.getRequestDispatcher("ChangePassword(Seller,Manager,Admin).jsp").forward(request, response);
        } else {
            if(account.getRole_id()==4){
                response.sendRedirect("Error.jsp");
            }else{
                String newPassword = request.getParameter("password_1");
                String oldPassword = request.getParameter("password_old");
                oldPassword = Encode.toSHA1(oldPassword);  // encode password entered

                String oldAccPassword = account.getPassword();
                if (oldPassword.equals(oldAccPassword)) {
                    AccountDAO dao = new AccountDAO();
                    // encode new password
                    newPassword = Encode.toSHA1(newPassword);
                    dao.changePassword(Integer.toString(account.getAcc_id()), newPassword);
                    // send account info
                    request.setAttribute("acc", account);
                    request.setAttribute("message2", "Change password successfully");
                    // redirect to jsp
                    request.getRequestDispatcher("ChangePassword(Seller,Manager,Admin).jsp").forward(request, response);
                } else {
                    request.setAttribute("message1", "Old password does not exist");
                    request.getRequestDispatcher("ChangePassword(Seller,Manager,Admin).jsp").forward(request, response);
                }
            }
        }
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
