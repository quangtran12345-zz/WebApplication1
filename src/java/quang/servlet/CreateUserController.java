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
import quang.dao.UserDAO;
import quang.dto.UserDTO;
import quang.services.Validate;

/**
 *
 * @author Admin
 */
public class CreateUserController extends HttpServlet {

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
        String url = CommonFinalString.LIST_USER_CONTROLLER;
        boolean result = false;
        HttpSession session = request.getSession();
        try {
            UserDAO dao = new UserDAO();
            String username = request.getParameter("usernameCreate");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirm");
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            int role = (request.getParameter("role") != null) ? Integer.parseInt(request.getParameter("role")) : 0;

            UserDTO user = new UserDTO(firstName, lastName, username, password, confirmPassword, role);

            username = (String) session.getAttribute("username");
            if (username == null) {
                url = CommonFinalString.REGISTER_PAGE;
            } else {
                UserDAO userDAO = new UserDAO();
                UserDTO userCheck = userDAO.getDetailUser(username);
                if (userCheck.getRole() == 0) {
                    url = CommonFinalString.LIST_PRODUCT_CONTROLLER;
                }
            }

            Validate validate = new Validate();
            validate.validateCreateUser(user);
            UserDTO _user = dao.getDetailUser(request.getParameter("usernameCreate"));
            if (_user != null) {
                throw new Exception("existed");
            }
            result = dao.createUser(user) > 0;

        } catch (Exception ex) {
//            Logger.getLogger(CreateUserController.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("errorMessage", ex.getMessage());
            if (ex.getMessage().equals("existed")) {
                request.setAttribute("errorMessage", "Username already exists.");
            }
        } finally {
            if (result) {
                if (session.getAttribute("username") == null) {
                    session.setAttribute("username", request.getParameter("usernameCreate"));
                    url = CommonFinalString.LIST_PRODUCT_CONTROLLER;
                }
                response.sendRedirect(url);
            } else {
                request.getRequestDispatcher(url).forward(request, response);
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
