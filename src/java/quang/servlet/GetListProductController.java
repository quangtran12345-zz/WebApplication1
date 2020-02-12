/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package quang.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
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
import quang.dto.TypeProductDTO;
import quang.dto.UserDTO;

/**
 *
 * @author Admin
 */
public class GetListProductController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String url = CommonFinalString.SHOP_PAGE;
        try {
            HttpSession session = request.getSession();
            String username = (String) session.getAttribute("username");
            if (username == null) {
                url = CommonFinalString.LOGIN_PAGE;
            } else {
                UserDAO userDAO = new UserDAO();
                UserDTO user = userDAO.getDetailUser(username);
                ProductDAO dao = new ProductDAO();
                if (user.getRole() == 1) {
                    url = CommonFinalString.LIST_PRODUCT_PAGE;
                }
                List<TypeProductDTO> listTypeProduct = dao.getListTypeProduct();
                request.setAttribute("listTypeProduct", listTypeProduct);
                String searchValue = (request.getParameter("searchValue") != null) ? request.getParameter("searchValue") : "";
                int typeId = request.getParameter("typeId") != null ? Integer.parseInt(request.getParameter("typeId")) : -1;
                List<ProductDTO> listProduct = dao.getListProduct(searchValue, typeId);
//                dao.getListProduct(searchValue);
                request.setAttribute("listProduct", listProduct);
            }

        } catch (SQLException ex) {
            Logger.getLogger(GetListUserController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(GetListProductController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
