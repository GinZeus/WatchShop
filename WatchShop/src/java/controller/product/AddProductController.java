/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.product;

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
import jakarta.servlet.http.Part;
import model.Product;
import utility.uploadImage;
@MultipartConfig

/**
 *
 * @author datng
 */
public class AddProductController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddProductController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProductController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
        //add product
        String product_name=request.getParameter("product_name");
        String brand = request.getParameter("brand");
        String quantity = request.getParameter("quantity");
        Part thumbnail1 = request.getPart("thumbnail");   
        String thumbnail_path = upload.uploadImagePath(thumbnail1,"product");
        String ori_price = request.getParameter("ori_price");
        String sale_price = request.getParameter("sale_price");        
        String discount = request.getParameter("discount");
        proDAO.insertProduct(product_name, brand, quantity, thumbnail_path, ori_price, sale_price, discount);
        
        //get the lastest product
        Product newPro = proDAO.getLastestProduct();
        int newProID= newPro.getP_id();
        
        //add product detail
        String des=request.getParameter("des");
        String material = request.getParameter("material");
        String width = request.getParameter("width");
        String duration = request.getParameter("duration");
        String shape= request.getParameter("shape");
        Part image1 = request.getPart("image1");      
        String image1_path = upload.uploadImagePath(image1,"product");
        Part image2 = request.getPart("image2");      
        String image2_path = upload.uploadImagePath(image2,"product");
        pdDAO.insertProductInfo(newProID, des, material, width, duration, shape, image1_path, image2_path);
        
        //add product category
        String[] cate = request.getParameterValues("cate");
        mDAO.addProductCate(newProID, cate);
        
        response.sendRedirect("ManageProductController");
    }
    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
