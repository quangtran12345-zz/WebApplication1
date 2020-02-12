/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package quang.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
import quang.dto.CartDTO;
import quang.dto.ProductDTO;

/**
 *
 * @author Admin
 */
public class ShoppingCartController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String url = CommonFinalString.LIST_PRODUCT_CONTROLLER;
        List<CartDTO> listCartDTO = null;
        try {
            HttpSession session = request.getSession();
            String username = (String) session.getAttribute("username");

            if (username == null) {
                url = CommonFinalString.LOGIN_PAGE;
            } else {
                int id = Integer.parseInt(request.getParameter("id"));
                ProductDAO dao = new ProductDAO();
                ProductDTO product = dao.getDetailProduct(id);
                if (product == null) {
                    throw new Exception("Product not existed.");
                }
                listCartDTO = (ArrayList<CartDTO>) session.getAttribute("cart");
                CartDTO cartDTO = new CartDTO(id, product.getName(), product.getPrice(), 1, product.getImage());
                cartDTO.setTotal();
                boolean existed = false;
                if (listCartDTO != null) {
                    if (listCartDTO.size() > 0) {
                        for (CartDTO dto : listCartDTO) {
                            if (dto.getId() == id) {
                                dto.setQuantity(dto.getQuantity() + 1);
                                dto.setTotal();
                                existed = true;
                            }
                        }
                        
                        if (!existed) {
                            listCartDTO.add(cartDTO);
                        }
                    }
                } else {
                    listCartDTO = new ArrayList<>();
                    listCartDTO.add(cartDTO);
                }
                session.setAttribute("cart", listCartDTO);
            }

        } catch (Exception ex) {
            Logger.getLogger(ShoppingCartController.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("errorMessage", ex.getMessage());
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
