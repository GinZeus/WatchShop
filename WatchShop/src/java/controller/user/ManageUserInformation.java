/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import dal.AccountDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.Account;
import model.User;
import utility.uploadImage;

/**
 *
 * @author DELL
 */
@MultipartConfig
public class ManageUserInformation extends HttpServlet {

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
            out.println("<title>Servlet ManageUserInformation</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageUserInformation at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        AccountDAO acd = new AccountDAO();
        String id = request.getParameter("acc_id");
        if (account == null) {
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else {
            if (account.getRole_id() == 1) {
                // get user info based on account id
                UserDAO userDAO = new UserDAO();
                User user = userDAO.getUserInfo(id);
                Account acc = acd.getAccountInfo(id);
                // send info the forms in User Profile
                request.setAttribute("user", user);
                request.setAttribute("acc", acc);
                request.getRequestDispatcher("User_information.jsp").forward(request, response);

            } else {
                response.sendRedirect("Error.jsp");
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
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account == null) {
            request.setAttribute("needLogin", "You need to login to proceed!");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else {
            if (account.getRole_id() != 1) {
                response.sendRedirect("Error.jsp");
            } else {
                String accId = request.getParameter("acc_id");
                
                UserDAO userDAO = new UserDAO();
                String fullName = request.getParameter("fullName");
                String address = request.getParameter("address");
                String phoneNumber = request.getParameter("phoneNumber");
                uploadImage ui = new uploadImage();
                Part avatar_file = request.getPart("avatar");
                
                if (avatar_file.getSubmittedFileName().isEmpty() || avatar_file.getSubmittedFileName() == null  ) {
                    userDAO.editUserInfoWithoutAvatar(accId, fullName, address, phoneNumber);
                } else {
                    
                    String avatar = ui.uploadImagePath(avatar_file, "ProfilePicture");
                    userDAO.editUserInfo(accId, fullName, address, phoneNumber, avatar);
                }
                User user = userDAO.getUserInfo(accId);
                request.setAttribute("user", user);
                request.setAttribute("acc", account);
                request.setAttribute("successMessage", "Update successful !");
                request.getRequestDispatcher("User_information.jsp").forward(request, response);

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
