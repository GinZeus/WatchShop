/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.cart;

import dal.ProductDAO;
import dal.UserDAO;
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
import model.Product;
import model.User;

/**
 *
 * @author DELL
 */
public class CartController extends HttpServlet {

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
        ProductDAO pd = new ProductDAO();
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("account");
        String user_id = "";
        UserDAO usd = new UserDAO();
        User u = new User();
        if (acc != null) {
            if (acc.getRole_id() == 4) {
                user_id = Integer.toString(acc.getAcc_id());
                u = usd.getUserInfo(user_id);
                if (u.getFullName()!=null) {
                    Cookie[] arr = request.getCookies();

                    String txt = "";
                    if (arr != null) {
                        for (Cookie o : arr) {
                            if (o.getName().equals("cart" + user_id)) {
                                txt += o.getValue();
                            }
                        }
                    }
                    ArrayList<Product> list = pd.getAllProduct();

                    Cart cart = new Cart(txt, list);
                    request.setAttribute("cart", cart);
                    int n;
                    ArrayList<Item> listItem = cart.getItems();
                    if (listItem != null) {
                        n = listItem.size();
                    } else {
                        n = 0;
                    }
                    request.setAttribute("size", n);
                    request.getRequestDispatcher("Cart.jsp").forward(request, response);
                } else {
                    request.setAttribute("needProfile", "You need to complete your profile to proceed!");
                    request.getRequestDispatcher("profileControl").forward(request, response);
                }
            } else {
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