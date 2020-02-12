/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package quang.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import quang.constant.CommonFinalString;

/**
 *
 * @author Admin
 */
public class ProcessController extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String url = CommonFinalString.LOGIN_PAGE;
        try {
            String action = request.getParameter("action");
            HttpSession session = request.getSession();
            String username = (String) session.getAttribute("username");
            if (action.equals("Login")) {
                url = CommonFinalString.LOGIN_CONTROLLER;
            } else if (action.equals("CreateUser")) {
                url = CommonFinalString.CREATE_USER_CONTROLLER;
            } else {
                if (username != null) {
                    if (action == null) {
                        url = CommonFinalString.LIST_PRODUCT_CONTROLLER;
                    } else if (action.equals("GetListUser")) {
                        url = CommonFinalString.LIST_USER_CONTROLLER;
                    } else if (action.equals("DeleteUser")) {
                        url = CommonFinalString.DELETE_USER_CONTROLLER;
                    } else if (action.equals("GetListProduct")) {
                        url = CommonFinalString.LIST_PRODUCT_CONTROLLER;
                    } else if (action.equals("CreateProduct")) {
                        url = CommonFinalString.CREATE_PRODUCT_CONTROLLER;
                    } else if (action.equals("CreateTypeProduct")) {
                        url = CommonFinalString.CREATE_TYPE_PRODUCT_CONTROLLER;
                    } else if (action.equals("GetListTypeProduct")) {
                        url = CommonFinalString.GET_LIST_TYPE_PRODUCT;
                    } else if (action.equals("GetDetailProduct")) {
                        url = CommonFinalString.DETAIL_PRODUCT_CONTROLLER;
                    } else if (action.equals("ShoppingCart")) {
                        url = CommonFinalString.SHOPPING_CART_CONTROLLER;
                    } else if (action.equals("UpdateProduct")) {
                        url = CommonFinalString.UPDATE_PRODUCT_CONTROLLER;
                    } else if (action.equals("DeleteProduct")) {
                        url = CommonFinalString.DELETE_PRODUCT_CONTROLLER;
                    } else if (action.equals("Logout")) {
                        url = CommonFinalString.LOGOUT_CONTROLLER;
                    } else if (action.equals("Order")) {
                        url = CommonFinalString.ORDER_CONTROLLER;
                    } else if (action.equals("GetListBill")) {
                        url = CommonFinalString.LIST_BILL_CONTROLLER;
                    } else if (action.equals("GetDetailBill")) {
                        url = CommonFinalString.DETAIL_BILL_CONTROLLER;
                    } else if (action.equals("DeleteTypeProduct")) {
                        url = CommonFinalString.DELETE_TYPE_PRODUCT_CONTROLLER;
                    } else {
                        request.setAttribute("ERROR", "Action not support !");
                    }
                }
            }
        } catch (Exception e) {
            log("ERROR at MainController: " + e.getMessage());
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
