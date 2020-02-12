/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package quang.dto;

import java.io.Serializable;
import java.util.List;

/**
 *
 * @author Admin
 */
public class BillDTO implements Serializable{
    private int productID;
    private String productName;
    private int quantity;
    private float subTotal;
    private int userID;
    private int id;
    private String userName;
    private List<ProductDTO> listProducts;
    
    public BillDTO(float subTotal, int userID) {
        this.subTotal = subTotal;
        this.userID = userID;
    }

    public BillDTO(int productID, int quantity, int id) {
        this.productID = productID;
        this.quantity = quantity;
        this.id = id;
    }

    public BillDTO(float subTotal, int id, String userName) {
        this.subTotal = subTotal;
        this.id = id;
        this.userName = userName;
    }

    public BillDTO(float subTotal, int id, String userName, List<ProductDTO> listProducts) {
        this.subTotal = subTotal;
        this.id = id;
        this.userName = userName;
        this.listProducts = listProducts;
    }
    
    public List<ProductDTO> getListProducts() {
        return listProducts;
    }

    public void setListProducts(List<ProductDTO> listProducts) {
        this.listProducts = listProducts;
    }
    
    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(float subTotal) {
        this.subTotal = subTotal;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
    
    
}
