/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.product;

import dal.BrandDAO;
import dal.CategoryDAO;
import dal.MidDAO;
import dal.ProductDAO;
import dal.ProductDetailDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.util.ArrayList;
import model.Account;
import model.Brand;
import model.Category;
import model.Mid;
import model.Product;
import model.ProductDetail;
import utility.uploadImage;

@MultipartConfig

/**
 *
 * @author datng
 */
public class EditProductController extends HttpServlet {

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
            out.println("<title>Servlet EditProductController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditProductController at " + request.getContextPath() + "</h1>");
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
        if (account == null) {
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else {
            if (account.getRole_id() != 2) { // check if acc is manager
                request.getRequestDispatcher("Error.jsp").forward(request, response);
            } else {
                ProductDAO proDAO = new ProductDAO();
                ProductDetailDAO pdDAO = new ProductDetailDAO();
                BrandDAO brandDAO = new BrandDAO();
                CategoryDAO cateDAO = new CategoryDAO();
                MidDAO mDAO = new MidDAO();
                ArrayList<Brand> listBrand = brandDAO.BrandList();
                String p_id = request.getParameter("pid");
                Product pro = proDAO.getProductById(p_id);
                ProductDetail pd = pdDAO.getInfoByID(p_id);
                ArrayList<Category> listCate = cateDAO.CategoryList();
                ArrayList<Mid> listMid = mDAO.getCatePid(p_id);
                request.setAttribute("listBrand", listBrand);
                request.setAttribute("pro", pro);
                request.setAttribute("pd", pd);
                request.setAttribute("bid", pro.getBrand_id());
                request.setAttribute("listCate", listCate);
                request.setAttribute("listMid", listMid);
                request.getRequestDispatcher("Edit_product.jsp").forward(request, response);
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
        ProductDAO proDAO = new ProductDAO();
        ProductDetailDAO pdDAO = new ProductDetailDAO();
        MidDAO mDAO = new MidDAO();
        uploadImage upload = new uploadImage();

        String pid = request.getParameter("p_id");
        String product_name = request.getParameter("product_name");
        String brand = request.getParameter("brand");
        String quantity = request.getParameter("quantity");
        String thumbnailPath;
        Part thumbnail = request.getPart("thumbnail");
        if (thumbnail.getSubmittedFileName().isEmpty() || thumbnail.getSubmittedFileName() == null) {
            thumbnailPath = request.getParameter("thumnail_cur");
        } else {
            thumbnailPath = upload.uploadImagePath(thumbnail,"product");
        }
        String ori_price = request.getParameter("ori_price");
        String sale_price = request.getParameter("sale_price");
        String discount = request.getParameter("discount");
        String status = request.getParameter("status");
        proDAO.editProduct(product_name, brand, quantity, thumbnailPath, ori_price, sale_price, discount, status, pid);

        String des = request.getParameter("des");
        String material = request.getParameter("material");
        String width = request.getParameter("width");
        String duration = request.getParameter("duration");
        String shape = request.getParameter("shape");
        String image1Path, image2Path;
        Part image1 = request.getPart("image1");
        if (image1.getSubmittedFileName().isEmpty() || image1.getSubmittedFileName() == null) {
            image1Path = request.getParameter("image1_cur");
        } else {
            image1Path = upload.uploadImagePath(image1,"product");
        }
        Part image2 = request.getPart("image2");
        if (image2.getSubmittedFileName().isEmpty() || image2.getSubmittedFileName() == null) {
            image2Path = request.getParameter("image2_cur");
        } else {
            image2Path = upload.uploadImagePath(image2,"product");
        }
        pdDAO.editProductInfo(des, material, width, duration, shape, image1Path, image2Path, pid);

        mDAO.deleteProductCate(pid);
        String[] cate = request.getParameterValues("cate");
        mDAO.addProductCate(Integer.parseInt(pid), cate);
        response.sendRedirect("EditProductController?pid=" + pid);
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
