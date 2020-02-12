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
public class UserDTO implements Serializable {

    private String firstName;
    private String lastName;
    private String fullName;
    private String username;
    private String password;
    private String confirm;
    private int role;
    private int id;

    public UserDTO(String fullName, String username, int role) {
        this.fullName = fullName;
        this.username = username;
        this.role = role;
    }

    public UserDTO(String fullName, String username, int role, int id) {
        this.fullName = fullName;
        this.username = username;
        this.role = role;
        this.id = id;
    }

    public UserDTO(String firstName, String lastName, String username, String password, String confirm, int role) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.username = username;
        this.password = password;
        this.role = role;
        this.confirm = confirm;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirm() {
        return confirm;
    }

    public void setConfirm(String confirm) {
        this.confirm = confirm;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

}
