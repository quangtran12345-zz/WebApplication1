/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package quang.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import quang.constant.CommonFinalString;
import quang.dao.ProductDAO;
import quang.dao.UserDAO;
import quang.dto.ProductDTO;
import quang.dto.UserDTO;
import quang.services.Validate;

/**
 *
 * @author Admin
 */
public class CreateProductController extends HttpServlet {

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
        PrintWriter out = response.getWriter();

        String url = CommonFinalString.LIST_PRODUCT_CONTROLLER;
        try {
            HttpSession session = request.getSession();
            String username = (String) session.getAttribute("username");
            UserDAO userDAO = new UserDAO();
            UserDTO admin = userDAO.getDetailUser(username);
            if (admin.getRole() == 0) {
                throw new Exception("Not Permission.");
            }

            String productName = request.getParameter("productName");
            if (productName.equals("")) {
                 throw new Exception("Product name is can't empty.");
            }
            if (request.getParameter("typeProduct") == null || request.getParameter("typeProduct").equals("")) {
                throw new Exception("Type's product is can't empty create type first then create product.");
            }
            ProductDAO dao = new ProductDAO();
            boolean checkExisted = dao.checkProductExisted(productName);
            if (checkExisted) {
                throw new Exception("existed");
            }
            
            float price = Float.parseFloat(request.getParameter("price"));
            String image = request.getParameter("image").trim().equals("") ? "img/Stack_Logo_Transparent_BG_1e71ce46-6894-4a00-bc00-7c4646dc63d5_600x@2x.webp" : request.getParameter("image");
            int type = Integer.parseInt(request.getParameter("typeProduct"));
            ProductDTO product = new ProductDTO(productName, type, price, image);

            Validate validate = new Validate();
            validate.validateCreateProduct(product);

            boolean result;
            result = dao.createProduct(product);
            if (!result) {
                request.setAttribute("errorMessage", "Create product failed.");
            }
        } catch (Exception ex) {
            Logger.getLogger(CreateProductController.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("errorMessage", ex.getMessage());
            if (ex.getMessage().equals("existed")) {
                request.setAttribute("errorMessage", "This product is existed.");
            }
        } finally {
            if (request.getAttribute("errorMessage") != null) {
                request.getRequestDispatcher(url).forward(request, response);
            } else {
                response.sendRedirect(url);
            }
            out.close();
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
