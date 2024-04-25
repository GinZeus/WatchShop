/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.blog;

import dal.BlogDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.PrintWriter;
import model.Account;
import model.Blog;
import utility.uploadImage;

/**
 *
 * @author Warspite
 */
@WebServlet(name = "EditBlogInfoController", urlPatterns = {"/EditBlogInfoController"})
@MultipartConfig
public class EditBlogInfoController extends HttpServlet {

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
            out.println("<title>Servlet EditBlogInfoController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditBlogInfoController at " + request.getContextPath() + "</h1>");
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
        //edit specific blog detail
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account == null) {
            request.setAttribute("needLogin", "You need to login to proceed!");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else {
            if (account.getRole_id() != 2) { // check if acc is manager
                response.sendRedirect("Error.jsp");
            } else {
                BlogDAO dao = new BlogDAO();
                String blog_id = request.getParameter("id");
                String blog_title = request.getParameter("title");
                String blog_intro = request.getParameter("intro");
                String blog_author = request.getParameter("author");
                String blog_status = request.getParameter("status");
                
                uploadImage ui = new uploadImage();
                Part blog_thumbnail_file = request.getPart("thumbnail");
                if(blog_thumbnail_file.getSubmittedFileName().equalsIgnoreCase("")){
                    dao.editBlogInfoWithoutThumbail(blog_id, blog_title, blog_intro, blog_author, blog_status);
                }else{
                    String blog_thumbnail = ui.uploadImagePath(blog_thumbnail_file, "Blog");
                    dao.editBlogInfo(blog_id, blog_title, blog_thumbnail, blog_intro, blog_author, blog_status);
                }
                
                // go back to list
                response.sendRedirect("BlogListTableController");
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
