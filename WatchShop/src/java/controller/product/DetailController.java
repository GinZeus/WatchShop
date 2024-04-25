/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.product;

import dal.FeedbackDAO;
import dal.OrderDAO;
import dal.ProductDAO;
import dal.ProductDetailDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Account;
import model.Feedback;
import model.Product;
import model.ProductDetail;

/**
 *
 * @author datng
 */
public class DetailController extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        String pid = request.getParameter("pid");
        ProductDetailDAO pdDAO = new ProductDetailDAO();
        FeedbackDAO fbDAO = new FeedbackDAO();
        ProductDAO proDAO = new ProductDAO();
        OrderDAO oDAO = new OrderDAO();

        int total_fb = fbDAO.getTotalFeedbackOfProduct(pid);
        UserDAO userDAO = new UserDAO();
        proDAO.calculateRateStarPro(pid);
        Product pro = proDAO.getProductById(pid);
        ProductDetail pdetail = pdDAO.getInfoByID(pid);
        ArrayList<Feedback> flist = fbDAO.getFeedbackFromPid(pid);
        if (account != null) {
            int accID = account.getAcc_id();
            Feedback fb_uid = fbDAO.getFeedbackProFromUid(pid, accID);
            request.setAttribute("fb_uid", fb_uid);
            int user_id = account.getAcc_id();
            boolean checkBuy = oDAO.checkUserBuyPro(user_id, pid);
            request.setAttribute("checkBuy", checkBuy);
        }

        request.setAttribute("pro", pro);
        request.setAttribute("pdetail", pdetail);
        request.setAttribute("fb_list", flist);
        request.setAttribute("userDAO", userDAO);
        request.setAttribute("total_fb", total_fb);

        request.getRequestDispatcher("Product_detail.jsp").forward(request, response);

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
        FeedbackDAO fbDAO = new FeedbackDAO();
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        int accId = account.getAcc_id();
        String pid = request.getParameter("pid");
        String content = request.getParameter("content");
        String starValue = request.getParameter("starValue");
        request.setAttribute("starValue", starValue);
        fbDAO.postFeedback(accId, pid, content, starValue);
        request.setAttribute("acc", account);
        response.sendRedirect("DetailController?pid=" + pid);
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
