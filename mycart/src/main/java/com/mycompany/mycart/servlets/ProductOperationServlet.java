package com.mycompany.mycart.servlets;

import com.mycompany.mycart.dao.CategoryDao;
import com.mycompany.mycart.dao.ProductDao;
import com.mycompany.mycart.entities.Category;
import com.mycompany.mycart.entities.Product;
import com.mycompany.mycart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
// import javax.servlet.http.Part;

public class ProductOperationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            
            String op = request.getParameter("operation");
            
            if(op.trim().equals("addcategory")) {
                // add category
                String title = request.getParameter("catTitle");
                String description = request.getParameter("catDescription");
                
                Category category = new Category();
                category.setCategoryTitle(title);
                category.setCategoryDescription(description);
                
                
                // category database save
                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                int catId = categoryDao.saveCategory(category);
                
//                out.println("Category Saved "+catId);
//                System.out.println(catId);
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Category added Succesfully with Category Id :-"+catId);
                response.sendRedirect("admin.jsp");
                return;
                
            } else if(op.trim().equals("addproduct")) {
                // add product
                System.out.println("Product addition start :-");
                String pName = request.getParameter("productTitle");
                String pDescription = request.getParameter("productDescription");
                int pPrice = Integer.parseInt(request.getParameter("productPrice").trim());
                int pDiscount = Integer.parseInt(request.getParameter("productDiscount").trim());
                int pQuantity = Integer.parseInt(request.getParameter("productQuantity").trim());
                int productCategoryId = Integer.parseInt(request.getParameter("productCategoryID").trim());
                System.out.println(pName);
//                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
//                Category productCategory = categoryDao.getCategorybyId(productCategoryId);
//                Part part = request.getPart("productPhoto");
//                String photoName = part.getSubmittedFileName();
//                System.out.println(photoName+" "+productCategory);
//                String productCategory = (Category)request.getParameter("productCategory");
                Product product = new Product(pName,pDescription,"hbb",pPrice,pDiscount,pQuantity,null);
                
                ProductDao productDao = new ProductDao(FactoryProvider.getFactory());
                int pId = productDao.saveProduct(product);
                
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Product added Succesfully with Product Id :-"+pId);
                response.sendRedirect("admin.jsp");
                return;
            }
            
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
