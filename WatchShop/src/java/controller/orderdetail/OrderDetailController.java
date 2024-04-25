package controller.orderdetail;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import dal.FeedbackDAO;
import dal.OrderDAO;
import dal.OrderDetailDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Account;
import model.Order;
import model.OrderDetail;

/**
 *
 * @author DELL
 */
public class OrderDetailController extends HttpServlet {

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
            out.println("<title>Servlet OrderDetailController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderDetailController at " + request.getContextPath() + "</h1>");
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
        Account acc = (Account) session.getAttribute("account");
        String o_id = request.getParameter("o_id");
        OrderDAO od = new OrderDAO();
        ProductDAO pd = new ProductDAO();
        OrderDetailDAO odd = new OrderDetailDAO();
        FeedbackDAO fbDAO = new FeedbackDAO();
        if (acc != null) {

            if (acc.getRole_id() == 4) {
                ArrayList<OrderDetail> o_details = odd.getOrderDetailsById(o_id);
                Order order = od.getOrderByOId(o_id);
                request.setAttribute("listOd", o_details);
                request.setAttribute("order", order);
                request.setAttribute("pd", pd);
                int user_id = acc.getAcc_id();
                request.setAttribute("user_id", user_id);
                request.setAttribute("fbDAO", fbDAO);
                request.getRequestDispatcher("Order_detail.jsp").forward(request, response);
            } 
            else if (acc.getRole_id() == 3) {
                ArrayList<OrderDetail> o_details = odd.getOrderDetailsById(o_id);
                Order order = od.getOrderByOId(o_id);
                request.setAttribute("listOd", o_details);
                request.setAttribute("pd", pd);
                request.setAttribute("order", order);
                request.getRequestDispatcher("Manage_OrderDetail.jsp").forward(request, response);
            }
            else {
                response.sendRedirect("Error.jsp");
            }

        } else {
            request.setAttribute("needLogin", "You need to login to proceed!");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
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
