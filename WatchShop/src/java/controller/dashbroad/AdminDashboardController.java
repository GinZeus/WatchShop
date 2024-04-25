/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.dashbroad;

import dal.AccountDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import java.util.ArrayList;

import model.Account;

/**
 *
 * @author DELL
 */
public class AdminDashboardController extends HttpServlet {

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
            out.println("<title>Servlet AdminDashboardController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminDashboardController at " + request.getContextPath() + "</h1>");
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

        if (account != null) {
            if (account.getRole_id() == 1) {
                int totalAccount = acd.AccountList().size();
                int totalActive = acd.getAccountsByStatus("2").size();
                int totalBan = acd.getAccountsByStatus("0").size();
                ArrayList<Account> listA = acd.getAccountsByStatus("0");
                request.setAttribute("totalAccount", totalAccount);
                request.setAttribute("totalActive", totalActive);
                request.setAttribute("totalBan", totalBan);
                request.setAttribute("listA", listA);
                LocalDate today = LocalDate.now();
                ArrayList<String> dateList = new ArrayList<>();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM");
                for (int i = 6; i >= 0; i--) {
                    LocalDate date = today.minusDays(i);
                    String formattedDate = date.format(formatter);
                    dateList.add(formattedDate);
                }
                request.setAttribute("dateList", dateList);
                ArrayList<Integer> registation7days;

                registation7days = acd.getRegistrationsOfLast7Days();
                request.setAttribute("registation7days", registation7days);

                request.getRequestDispatcher("AdminDashboard.jsp").forward(request, response);
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
