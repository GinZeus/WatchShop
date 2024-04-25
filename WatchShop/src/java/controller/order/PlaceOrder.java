/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.order;

import dal.OrderDAO;
import dal.OrderDetailDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Account;
import model.Cart;
import model.Item;
import model.Order;
import model.OrderDetail;
import model.Product;

/**
 *
 * @author DELL
 */
public class PlaceOrder extends HttpServlet {

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
            out.println("<title>Servlet PlaceOrder</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PlaceOrder at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        ProductDAO pd = new ProductDAO();
        Account acc = (Account) session.getAttribute("account");
        if (acc != null) {
            if (acc.getRole_id() == 4) {
                int user_id = acc.getAcc_id();
                ProductDAO dp = new ProductDAO();
                ArrayList<Product> list = dp.getAllProduct();

                String u_id = "";

                u_id = Integer.toString(user_id);

                Cookie[] arr = request.getCookies();
                String txt = "";
                if (arr != null) {
                    for (Cookie z : arr) {
                        if (z.getName().equals("cart" + user_id)) {
                            txt += z.getValue();
                            z.setMaxAge(0);
                            response.addCookie(z);
                        }
                    }
                }
                Cart cart = new Cart(txt, list);
                ArrayList<Item> listItem = cart.getItems();

                //insert new order
                OrderDAO od = new OrderDAO();
                String fullname = request.getParameter("fullname");
                String address = request.getParameter("address");
                String note = request.getParameter("note");
                String email = request.getParameter("email");
                String phone_number = request.getParameter("phone_number");
                Float total = Float.parseFloat(request.getParameter("total"));
                Order o = new Order();
                o.setUser_id(user_id);
                o.setFullName(fullname);
                o.setAddress(address);
                o.setNote(note);
                o.setEmail(email);
                o.setStatus(1);
                o.setPhoneNumber(phone_number);
                o.setTotal(total);
                od.insertOrder(o);
                //insert order detail
                OrderDetail ode = new OrderDetail();
                OrderDetailDAO odd = new OrderDetailDAO();
                Order od1 = od.getOrderByUId(Integer.toString(user_id));
                int o_id = od1.getOrder_id();
                for (Item l : listItem) {
                    float salePrice = l.getProduct().getSale_price();
                    int quantity = l.getQuantity();
                    float discount = l.getProduct().getDiscount();
                    float sub = salePrice * quantity * (1 - discount / 100);
                    ode.setOrder_id(o_id);
                    ode.setP_id(l.getProduct().getP_id());
                    ode.setPrice(l.getSale_price());
                    ode.setQuantity(l.getQuantity());
                    ode.setI_total(sub);
                    odd.insertOrderDetails(ode);

                    pd.modifyProductQuantity(l.getProduct().getP_id(), -l.getQuantity());
                    if (pd.getProductById(Integer.toString(l.getProduct().getP_id())).getQuantity() == 0) {
                        pd.setStatusById(Integer.toString(l.getProduct().getP_id()), "2");
                    }
                }
                request.setAttribute("order", od1);
                request.getRequestDispatcher("Order_success.jsp").forward(request, response);
            } else {
                response.sendRedirect("Error.jsp");
            }
        } else {
            request.setAttribute("needLogin", "You need to login to proceed!");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
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
