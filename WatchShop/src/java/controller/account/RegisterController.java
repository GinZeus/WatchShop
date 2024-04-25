/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.account;

import dal.AccountDAO;
import dal.UserDAO;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Random;
import model.Account;
import utility.Encode;

/**
 *
 * @author admin
 */
public class RegisterController extends HttpServlet {

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
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");
        Random random = new Random();
        int randomNumber = 100000 + random.nextInt(900000);
        String verifycode = Integer.toString(randomNumber);
        ServletContext context = getServletContext();        
        if (!password.equals(repassword)) {
            request.setAttribute("messpassword", "Password does not match!");
            request.getRequestDispatcher("Register.jsp").forward(request, response);
        } else {
            AccountDAO accountDAO = new AccountDAO();

            Account a = accountDAO.checkAccountExist(username);
            if (a != null) {
                request.setAttribute("messusername", "Account already exists !");
                request.getRequestDispatcher("Register.jsp").forward(request, response);
            } else {
                Account g = accountDAO.checkEmailExist(email);
                if (g == null) {
                    password = Encode.toSHA1(password);
                    accountDAO.registerAccount(username, email, password,"4");
                    Account newAccount = accountDAO.getAccountByName(username);
                    UserDAO userDAO = new UserDAO();
                    userDAO.createNewUser(Integer.toString(newAccount.getAcc_id()));
                    Account account = accountDAO.getAccountByMail(email);
                    request.setAttribute("messdone", "Account has been created successfully !Check your email and confirm");
                    request.getRequestDispatcher("Register.jsp").forward(request, response);
                    context.setAttribute("verifycode", verifycode);
                    context.setAttribute("checkemail", email);
                    String link = "http://localhost:8080/WatchShop/VerifyEmail.jsp";
                    accountDAO.sendMail(email, "Verify Account - WatchShop",
                            "<h2>Hi <span style=\"color:blue;\">" + account.getUsername() + "</span>,</h2>\n"
                            + "<h2>There was a request to create your account! </h2>\n"
                            + "<h3>Here's your verification code.</h3>\n"
                            + "<div style=\"background-color: #0074a7; color: white; padding: 10px;;\" class='verification-box'>" + verifycode + "</div>"
                            + "<p style=\"color:blue;\">Otherwise, please click this link to verify your account: \n"
                            + "<a href=\"" + link + "\" >Verify Page</a>\n"
                            + "</p>\n"
                            + "\n"
                            + "<br> \n"
                            + "<h4 style=\"text-align: center;\">----------WatchShop - Group 5----------</h4>");
                } else {
                    request.setAttribute("messemail", "Email already exists !");
                    request.getRequestDispatcher("Register.jsp").forward(request, response);
                }

            }
//            request.getRequestDispatcher("Login.jsp").forward(request, response);
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
        processRequest(request, response);
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
