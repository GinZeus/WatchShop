/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.category;

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
import model.Product;

/**
 *
 * @author DELL
 */
public class AjaxCategoryController extends HttpServlet {

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
            out.println("<title>Servlet AjaxCategoryController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AjaxCategoryController at " + request.getContextPath() + "</h1>");
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
        PrintWriter out = response.getWriter();
        String cate_id = request.getParameter("cate_id");
        String sort_raw = request.getParameter("sort_by");
        String range_raw = request.getParameter("range");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        String var = "p_id";
        String sort = "asc";
        int sort_num = 0;
        int range_num = 0;

        if (sort_raw != null) {
            sort_num = Integer.parseInt(sort_raw);
            switch (sort_raw) {
                case "1": {
                    var = "sale_price";
                    sort = "asc";
                    break;
                }
                case "2": {
                    var = "sale_price";
                    sort = "desc";
                    break;
                }
                case "3": {
                    var = "create_time";
                    sort = "desc";
                    break;
                }
                case "4": {
                    var = "create_time";
                    sort = "asc";
                    break;
                }
            }
        }
        String min = "0";
        String max = "100000";
        if (range_raw != null) {
            range_num = Integer.parseInt(range_raw);
            switch (range_raw) {
                case "1": {
                    min = "0";
                    max = "200";
                    break;
                }
                case "2": {
                    min = "201";
                    max = "600";
                    break;
                }
                case "3": {
                    min = "601";
                    max = "1000";
                    break;
                }
                case "4": {
                    min = "1001";
                    max = "100000";
                    break;
                }
            }
        }

        String index_raw = request.getParameter("index");
        ProductDAO pd = new ProductDAO();
        int index = 1;
        if (index_raw != null) {
            index = Integer.parseInt(index_raw);
        }

        ArrayList<Product> list = pd.getProductByCategory(cate_id, index, var, sort, min, max);
        ArrayList<Product> listC = pd.getAllProductByCategory(cate_id, var, sort, min, max);
        int count = listC.size();
        int endP = count / 6;
        if (count % 6 != 0) {
            endP++;
        }

        out.println("<div class=\"box info-bar\">\n"
                + "                                <div class=\"row\">\n"
                + "\n"
                + "<div class=\"col-md-12 col-lg-4 products-number-sort\">\n"
                + "                                        <form class=\"form-inline d-block d-lg-flex justify-content-between flex-column flex-md-row\">\n"
                + "                                            <div class=\"products-sort-by mt-2 mt-lg-0\"><strong>Sort by</strong>\n"
                + "                                                <select id=\"sort_by\" onchange=\"cateController(" + cate_id + ", 1)\" class=\"form-control\" >\n"
                + "                                                    <option value=\"0\" " + (sort_num == 0 ? " selected" : "") + ">Default</option>"
                + "                                                    <option value=\"1\"" + (sort_num == 1 ? " selected" : "") + ">Lowest price</option>\n"
                + "                                                    <option value=\"2\"" + (sort_num == 2 ? " selected" : "") + " >Highest price</option>\n"
                + "                                                    <option value=\"3\"" + (sort_num == 3 ? " selected" : "") + " >Newest</option>\n"
                + "                                                    <option value=\"4\"" + (sort_num == 4 ? " selected" : "") + " >Oldest</option>\n"
                + "\n"
                + "                                                </select>\n"
                + "                                            </div>\n"
                + "                                        </form>\n"
                + "                                    </div>"
                + "<div class=\"col-md-12 col-lg-4 products-number-sort\">\n"
                + "                                        <form class=\"form-inline d-block d-lg-flex justify-content-between flex-column flex-md-row\">\n"
                + "                                            <div class=\"products-sort-by mt-2 mt-lg-0\"><strong>Range</strong>\n"
                + "                                                <select id=\"range\" onchange=\"cateController(" + cate_id + ", 1)\" class=\"form-control\">\n"
                + "                                                    <option value=\"0\" " + (range_num == 0 ? " selected" : "") + ">All price</option>"
                + "                                                    <option value=\"1\" " + (range_num == 1 ? " selected" : "") + ">Under 200$</option>\n"
                + "                                                    <option value=\"2\"" + (range_num == 2 ? " selected" : "") + ">200$ to 600$ </option>\n"
                + "                                                    <option value=\"3\" " + (range_num == 3 ? " selected" : "") + ">601$ to 1000$</option>\n"
                + "                                                    <option value=\"4\" " + (range_num == 4 ? " selected" : "") + ">Above 1000$</option>\n"
                + "\n"
                + "                                                </select>\n"
                + "                                            </div>\n"
                + "                                        </form>\n"
                + "                                    </div>  "
                + "<div class=\"col-md-12 col-lg-4 products-number-sort\">\n"
                + "                                        <form class=\"form-inline d-block d-lg-flex justify-content-between flex-column flex-md-row\">\n"
                + "                                            <div class=\"products-sort-by mt-2 mt-lg-0\">Including <strong>" + count + "</strong> products<!-- comment -->\n"
                + "                                                \n"
                + "                                            </div></form>\n"
                + "                                    </div>   "
                + "                                </div>\n"
                + "                            </div>");
        out.println("<div class=\"row products\">");
        for (Product o : list) {
            out.println("                                    <div class=\"col-lg-4 col-md-6\">\n"
                    + "                                        <div class=\"product\">\n"
                    + "                                            <div class=\"flip-container\">\n"
                    + "                                                <div class=\"flipper\">\n"
                    + "                                                    <div class=\"front\"><a href=\"DetailController?pid=" + o.getP_id() + "\"><img src=\"" + o.getThumbnail() + "\" alt=\"\" class=\"img-fluid img-square\"></a></div>\n"
                    + "                                                    <div class=\"back\"><a href=\"DetailController?pid=" + o.getP_id() + "\"><img src=\"" + o.getThumbnail() + "\" alt=\"\" class=\"img-fluid img-square\"></a></div>\n"
                    + "                                                </div>\n"
                    + "                                            </div><a href=\"DetailController?pid=" + o.getP_id() + "\" class=\"invisible\"><img src=\"" + o.getThumbnail() + "\" alt=\"\" class=\"img-fluid img-square\"></a>\n"
                    + "                                            <div class=\"text\">\n"
                    + "                                                <h3><a href=\"DetailController?pid=" + o.getP_id() + "\">" + o.getProduct_name() + "</a></h3>\n"
                    + "                                                <p class=\"price\"> \n"
                    + "                                                    <del></del>$" + o.getSale_price() + "  \n"
                    + "                                                </p>\n"
                    + "                                                <p class=\"buttons\"><a href=\"DetailController?pid=" + o.getP_id() + "\" class=\"btn btn-outline-secondary\">View detail</a>");
            if (o.getStatus() == 1 && account == null) {
                out.println("<a href=\"#\" data-toggle=\"modal\" data-target=\"#checkModal\" class=\"btn btn-primary\"><i class=\"fa fa-shopping-cart\"></i>Add to cart</a></p>");
            } else if (o.getStatus() == 1 && account.getRole_id() == 4) {
                out.println("<a href=\"#\" onclick=\"addToCart(" + o.getP_id() + ", 1)\" data-toggle=\"modal\" data-target=\"#checkModal\" class=\"btn btn-primary\"><i class=\"fa fa-shopping-cart\"></i>Add to cart</a></p>\n");
            } else if (o.getStatus() == 1 && account.getRole_id() != 4) {
                out.println("<a href=\"#\" data-toggle=\"modal\" data-target=\"#checkModal\" class=\"btn btn-primary\"><i class=\"fa fa-shopping-cart\"></i>Add to cart</a></p>");
            } else {
                out.println("</p>\n");
            }

            out.println("</div>\n"
                    + "<div class=\"ribbon sale\">\n"
                    + "<div class=\"theribbon\" style=\"background-color: red; font-size: 20px\">-" + o.getDiscount() + "%</div>\n"
                    + "<div class=\"ribbon-background\"></div>\n"
                    + "</div>\n");
            if (o.getStatus() == 2) {
                out.println("<div class=\"ribbon new\">\n"
                        + "<div class=\"theribbon\" style=\"font-size: 12px\">SOLD OUT</div>\n"
                        + "<div class=\"ribbon-background\"></div>\n"
                        + "</div>");
            }
            out.println("</div>\n"
                    + "</div>");
        }
        out.println("</div>");

        out.println("<div class=\"pages\">\n"
                + "\n"
                + "                                <nav aria-label=\"Page navigation example\" class=\"d-flex justify-content-center\">\n"
                + "                                    <ul class=\"pagination\">");

        for (int i = 1; i <= endP; i++) {
            out.println("<li class=\"page-item " + (i == index ? "active" : "") + "\"><a href=\"#\" onclick=\"cateController(" + cate_id + "," + i + ")\" class=\"page-link\">" + i + "</a></li>");
        }
        out.println("</ul>\n"
                + "\n"
                + "\n"
                + "                                </nav>\n"
                + "                            </div>");

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
