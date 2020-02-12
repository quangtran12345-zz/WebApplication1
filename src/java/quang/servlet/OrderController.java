/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package quang.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import quang.constant.CommonFinalString;
import quang.dao.BillDAO;
import quang.dao.UserDAO;
import quang.dto.BillDTO;
import quang.dto.UserDTO;

/**
 *
 * @author Admin
 */
public class OrderController extends HttpServlet {

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
        String url = CommonFinalString.CART_PAGE;
        try {
            HttpSession session = request.getSession();
            String username = (String) session.getAttribute("username");
            UserDAO dao = new UserDAO();
            UserDTO dto = dao.getDetailUser(username);

            String[] listProductID = request.getParameterValues("id");
            String[] listQuantity = request.getParameterValues("quantity");
            float subTotal = Float.parseFloat(request.getParameter("subTotal"));
            int userID = dto.getId();
            BillDTO bill = new BillDTO(subTotal, userID);
            BillDAO prDAO = new BillDAO();
            int billId = prDAO.createBill(bill);
            boolean result = false;
            for (int i = 0; i < listProductID.length; i++) {
                result = prDAO.insertDetailBill(new BillDTO(Integer.parseInt(listProductID[i]), Integer.parseInt(listQuantity[i]), billId));
            }
            if (!result) {
                throw new Exception("An error occurred while processing this request. Please try again later.");
            }
            session.setAttribute("cart", null);
            url = CommonFinalString.ORDER_SUCCESS;
        } catch (SQLException ex) {
            Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("errorMessage", ex.getMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
