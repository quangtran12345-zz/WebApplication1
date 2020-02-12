/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package quang.dto;

import java.io.Serializable;
import java.text.DecimalFormat;

/**
 *
 * @author Admin
 */
public class ProductDTO implements Serializable{
    private String name;
    private int type;
    private float price;
    private String typeName;
    private String image;
    private int id;
    private int quantity;

    public ProductDTO(String name, float price, String typeName, String image, int id) {
        this.name = name;
        this.price = price;
        this.typeName = typeName;
        this.image = image;
        this.id = id;
    }

    public ProductDTO(String name, int type, float price, String image) {
        this.name = name;
        this.type = type;
        this.price = price;
        this.image = image;
    }

    public ProductDTO(String name, float price, String image, int quantity) {
        this.name = name;
        this.price = price;
        this.image = image;
        this.quantity = quantity;
    }
    
    

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }
    
    public String getPriceFormat() {
        String _price;
        DecimalFormat formatter = new DecimalFormat("###,###,###.###");
        _price = formatter.format(this.getPrice());
        return _price;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    public float getTotal() {
        return this.quantity * this.price;
    }
}
