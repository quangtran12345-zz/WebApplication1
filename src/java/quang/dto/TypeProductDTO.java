/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package quang.dto;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class TypeProductDTO implements Serializable{
    private String typeName;
    private int id;

    public TypeProductDTO(String typeName, int id) {
        this.typeName = typeName;
        this.id = id;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
}
