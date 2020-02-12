/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package quang.services;

import quang.dto.ProductDTO;
import quang.dto.UserDTO;

/**
 *
 * @author Admin
 */
public class Validate {

    public String validateLogin(String username, String password) {
        String error = null;
        if (username.trim().equals("")) {
            error = "Username can't empty.";
        } else if (password.trim().equals("")) {
            error = "Password can't empty.";
        }
        return error;
    }

    public void validateCreateUser(UserDTO user) throws Exception {
        if (user.getFirstName().trim().equals("")) {
            throw new Exception("First name can't empty.");
        } else if (user.getLastName().trim().equals("")) {
            throw new Exception("Last name can't empty.");
        } else if (user.getUsername().trim().length() < 8) {
            throw new Exception("Username can't be less than 8 characters.");
        } else if (user.getPassword().trim().length() < 8) {
            throw new Exception("Password can't be less than 8 characters.");
        } else if (user.getConfirm().trim().equals("")) {
            throw new Exception("Confirm password can't empty.");
        } else if (!user.getConfirm().equals(user.getPassword())) {
            throw new Exception("Password is not match.");
        }
    }

    public void validateCreateProduct(ProductDTO product) throws Exception {
        if (product.getName().trim().equals("")) {
            throw new Exception("First name can't empty.");
        } else if (product.getPrice() < 1) {
            throw new Exception("Last name can't empty.");
        } 
    }
}
