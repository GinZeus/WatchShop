/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.cart;

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
import model.Product;

/**
 *
 * @author DELL
 */
public class deleteItem extends HttpServlet {

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
        ArrayList<Product> list = pd.getAllProduct();
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("account");
        String user_id = "";
        if (acc != null) {
            if (acc.getRole_id() == 4) {
                user_id = Integer.toString(acc.getAcc_id());

                String p_id = request.getParameter("p_id");

                Cookie[] arr = request.getCookies();
                String txt = "";
                if (arr != null) {
                    for (Cookie o : arr) {
                        if (o.getName().equals("cart" + user_id)) {
                            txt += o.getValue();
                            o.setMaxAge(0);
                            response.addCookie(o);
                        }
                    }
                }

                String[] ids = txt.split("-");
                String out = "";
                for (int i = 0; i < ids.length; i++) {
                    String s[] = ids[i].split(":");
                    if (!s[0].equals(p_id)) {
                        if (out.isEmpty()) {
                            out = ids[i];
                        } else {
                            out += "-" + ids[i];
                        }
                    }
                }
                if (!out.isEmpty()) {
                    Cookie c = new Cookie("cart" + user_id, out);
                    c.setMaxAge(30 * 24 * 60 * 60);
                    response.addCookie(c);

                }
                Cart cart = new Cart(out, list);
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
                response.sendRedirect("Error.jsp");
            }
        } else {
            response.sendRedirect("Login.jsp");
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
