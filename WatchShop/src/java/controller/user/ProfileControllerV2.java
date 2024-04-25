    /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.IOException;
import model.Account;
import model.User;
import utility.uploadImage;

/**
 *
 * @author Warspite
 */
@MultipartConfig
public class ProfileControllerV2 extends HttpServlet {

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
        if (account == null) {
            request.setAttribute("needLogin", "You need to login to proceed!");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else {
            if (account.getRole_id() == 4) {
                response.sendRedirect("Error.jsp");
            } else {
                // get user info based on account id
                UserDAO userDAO = new UserDAO();
                User user = userDAO.getUserInfo(Integer.toString(account.getAcc_id()));
        
                // send info the forms in User Profile
                request.setAttribute("user", user);
                request.setAttribute("acc", account);
                request.getRequestDispatcher("UserProfile(Seller,Manager,Admin).jsp").forward(request, response);
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
            if (account.getRole_id() == 4) {
                response.sendRedirect("Error.jsp");
            }else{
                String accId = Integer.toString(account.getAcc_id());
                // user
                UserDAO userDAO = new UserDAO();
                String fullName = request.getParameter("fullName");
                String address = request.getParameter("address");
                String phoneNumber = request.getParameter("phoneNumber");
                String successMessage = request.getParameter("successMessage");

                // avatar upload
                uploadImage ui = new uploadImage();
                Part avatar_file = request.getPart("avatar");
                if(avatar_file.getSubmittedFileName().equalsIgnoreCase("")){
                    userDAO.editUserInfoWithoutAvatar(accId, fullName, address, phoneNumber);
                }else{
                    String avatar = ui.uploadImagePath(avatar_file, "ProfilePicture");
                    userDAO.editUserInfo(accId, fullName, address, phoneNumber, avatar);
                }
                
                // success mesaage
                if (!successMessage.isEmpty()) {
                    // get user info based on account id
                    User user = userDAO.getUserInfo(Integer.toString(account.getAcc_id()));

                    // send info the forms in User Profile
                    request.setAttribute("user", user);
                    request.setAttribute("acc", account);
                    request.setAttribute("successMessage", successMessage);
                    request.getRequestDispatcher("UserProfile(Seller,Manager,Admin).jsp").forward(request, response);
                } else {
                    response.sendRedirect("ProfileControllerV2");
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
