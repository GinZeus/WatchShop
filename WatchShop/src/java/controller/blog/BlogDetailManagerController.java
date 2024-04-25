/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.blog;

import dal.BlogDetailDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.PrintWriter;
import model.Account;
import model.BlogDetail;
import utility.Base64_image;
import utility.uploadImage;

/**
 *
 * @author Warspite
 */
@MultipartConfig
public class BlogDetailManagerController extends HttpServlet {

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
            out.println("<title>Servlet BlogDetailManagerController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BlogDetailManagerController at " + request.getContextPath() + "</h1>");
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
         // get account id from session
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if(account==null){
            request.setAttribute("needLogin", "You need to login to proceed!");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }else{
            if(account.getRole_id()!=2){ // check if acc is manager
                response.sendRedirect("Error.jsp");
            }else{
               // get specific blog detail
                String blog_id = request.getParameter("blog_id");
                BlogDetailDAO dao = new BlogDetailDAO();
                BlogDetail blogDetail = dao.BlogDetails(blog_id);
                
                request.setAttribute("BlogDetail", blogDetail);
                // to blog detail page
                request.getRequestDispatcher("Manage_BlogDetail.jsp").forward(request, response);
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
        //edit specific blog detail
        
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account == null) {
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else {
            if(account.getRole_id()!=2){ // check if acc is manager
                response.sendRedirect("Error.jsp");
            }else{
                BlogDetailDAO dao = new BlogDetailDAO();
                String bdetail_id = request.getParameter("bdetail_id");
                String header1 = request.getParameter("header1");
                String cont1 = request.getParameter("cont1");
                String header2 = request.getParameter("header2");
                String cont2 = request.getParameter("cont2");
                String conclusion = request.getParameter("conclusion");
                String status = request.getParameter("status");
                String message = request.getParameter("message");
            
                Part image_file = request.getPart("image");
                if(image_file.getSubmittedFileName().equalsIgnoreCase("")){
                    // edit blog details
                    dao.UpdateBlogDetailWithoutImage(bdetail_id, header1, cont1, header2, cont2, conclusion, status);
                }else{
                    uploadImage ui = new uploadImage();
                    String image = ui.uploadImagePath(image_file, "Blog");

                    // edit blog details
                    dao.UpdateBlogDetail(bdetail_id, header1, cont1, image, header2, cont2, conclusion, status);

                }
                
                //send success message
                if (!message.isEmpty()) {
                    // get specific blog detail
                    BlogDetail newDetail = dao.BlogDetails(bdetail_id);
                    request.setAttribute("message", message);
                    request.setAttribute("BlogDetail", newDetail);
                    // to blog detail page
                    request.getRequestDispatcher("Manage_BlogDetail.jsp").forward(request, response);
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
