/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.dashbroad;

import dal.AccountDAO;
import dal.BrandDAO;
import dal.CategoryDAO;
import dal.FeedbackDAO;
import dal.OrderDAO;
import dal.ProductDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Product;
import model.User;

/**
 *
 * @author datng
 */
public class SaleDashboardController extends HttpServlet {

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
            out.println("<title>Servlet SaleDashboardController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SaleDashboardController at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        OrderDAO oDAO = new OrderDAO();
        FeedbackDAO fbDAO = new FeedbackDAO();
        ProductDAO proDAO = new ProductDAO();
        CategoryDAO cateDAO = new CategoryDAO();
        BrandDAO brandDAO = new BrandDAO();
        AccountDAO accDAO= new AccountDAO();
        if (account == null) {
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else {
            if (account.getRole_id() == 2 || account.getRole_id() == 3) {
                int totalFb = fbDAO.getTotalFeedback();
                int totalOrderSuccess = oDAO.countOrderSuccess();
                int totalPro = proDAO.countProduct();
                int totalCate = cateDAO.countCate();
                int totalBrand = brandDAO.countBrand();
                ArrayList<Product> Top5BestSelling = proDAO.GetTop5BestSellingProducts();
                ArrayList<Product> Top5Rating = proDAO.getTop5RatingProducts();
                ArrayList<Float> revenue7Day;

                try {
                    revenue7Day = oDAO.getRevenueOfLast7Days();
                    request.setAttribute("revenue7Day", revenue7Day);
                } catch (SQLException ex) {
                    Logger.getLogger(SaleDashboardController.class.getName()).log(Level.SEVERE, null, ex);
                }
                Float balance = accDAO.getBalanceByAccId(account.getAcc_id());
                request.setAttribute("balance", balance);
                request.setAttribute("totalFb", totalFb);
                request.setAttribute("totalOrderSuccess", totalOrderSuccess);
                request.setAttribute("totalPro", totalPro);
                request.setAttribute("totalCate", totalCate);
                request.setAttribute("totalBrand", totalBrand);
                request.setAttribute("Top5BestSelling", Top5BestSelling);
                request.setAttribute("Top5Rating", Top5Rating);
                LocalDate today = LocalDate.now();
                ArrayList<String> dateList = new ArrayList<>();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM");
                for (int i = 6; i >= 0; i--) {
                    LocalDate date = today.minusDays(i);
                    String formattedDate = date.format(formatter);
                    dateList.add(formattedDate);
                }
                request.setAttribute("dateList", dateList);
                request.getRequestDispatcher("SaleDashboard.jsp").forward(request, response);
                
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
