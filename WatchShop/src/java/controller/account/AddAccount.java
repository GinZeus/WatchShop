/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.account;

import dal.AccountDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import utility.Encode;

/**
 *
 * @author DELL
 */
public class AddAccount extends HttpServlet {

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
            out.println("<title>Servlet AddAccount</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddAccount at " + request.getContextPath() + "</h1>");
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
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");
        String role_id = request.getParameter("role_id");
        AccountDAO accountDAO = new AccountDAO();

        Account a = accountDAO.checkAccountExist(username);
        if (a != null) {

            request.setAttribute("mess", "Account already exists !");
            request.getRequestDispatcher("Add_NewAccount.jsp").forward(request, response);
            
        } else {
            Account g = accountDAO.checkEmailExist(email);
            if (g == null) {
                password = Encode.toSHA1(password);
                accountDAO.registerAccount(username, email, password,role_id);
                Account newAccount = accountDAO.getAccountByName(username);
                UserDAO userDAO = new UserDAO();
                userDAO.createNewUser(Integer.toString(newAccount.getAcc_id()));
                accountDAO.changeAccountStatus(Integer.toString(newAccount.getAcc_id()), "2");
                request.setAttribute("messdone", "Account has been created successfully !");
                request.getRequestDispatcher("Add_NewAccount.jsp").forward(request, response);

            } else {
                Account ac = new Account();
                ac.setUsername(username);
                request.setAttribute("acc", ac);
                request.setAttribute("mess", "Email already exists !");
                request.getRequestDispatcher("Add_NewAccount.jsp").forward(request, response);
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
