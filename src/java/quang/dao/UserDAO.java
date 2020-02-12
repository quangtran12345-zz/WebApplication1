/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package quang.dao;

import java.io.Serializable;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import quang.dto.UserDTO;
import quang.services.HashPasswrod;
import quang.utils.DBUtils;

/**
 *
 * @author Admin
 */
public class UserDAO implements Serializable {

    private Connection con = null;
    private PreparedStatement stm = null;
    private ResultSet rs = null;

    public boolean checkLogin(String username, String password) throws
            SQLException, ClassNotFoundException {

        try {

            String sql = "Select username from public.user where username = ? and password = ? and deleted = 0";
            con = DBUtils.makeConnection();

            stm = con.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            rs = stm.executeQuery();

            if (rs.next()) {
                return true;
            }
        } finally {
            closeConnection();
        }

        return false;
    }

    public int createUser(UserDTO user) throws SQLException, ClassNotFoundException, NoSuchAlgorithmException {
        int result = 0;
        try {
            String sql = "Insert into public.user (name, username, password, role) values (?,?,?,?)";
            con = DBUtils.makeConnection();

            stm = con.prepareStatement(sql);

            stm.setString(1, user.getFirstName() + " " + user.getLastName());
            stm.setString(2, user.getUsername());
            stm.setString(3, HashPasswrod.hashPassword(user.getPassword()));
            stm.setInt(4, user.getRole());

            result = stm.executeUpdate();

        } finally {
            closeConnection();
        }
        return result;
    }

    public List<UserDTO> searchUser(String searchValue) throws
            SQLException, ClassNotFoundException {
        String name = null;
        String username = null;
        int role;
        UserDTO dto = null;
        List<UserDTO> result = new ArrayList<>();
        try {
            String sql = "Select username, name, role from public.user where name like ? and role != 1 and deleted = 0";
            con = DBUtils.makeConnection();
            stm = con.prepareStatement(sql);
            stm.setString(1,'%' + searchValue + '%');
            rs = stm.executeQuery();
            while (rs.next()) {
                name = rs.getString("name");
                username = rs.getString("username");
                role = rs.getInt("role");
                dto = new UserDTO(name, username, role);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public UserDTO getDetailUser(String username) throws SQLException, ClassNotFoundException {
        String name = null;
        int role;
        int id;
        UserDTO user = null;
        try {
            String sql = "Select id, name, role from public.user where username = ? and deleted = 0";
            con = DBUtils.makeConnection();
            stm = con.prepareStatement(sql);
            stm.setString(1, username);
            rs = stm.executeQuery();
            if (rs.next()) {
                name = rs.getString("name");
                role = rs.getInt("role");
                id = rs.getInt("id");
                user = new UserDTO(name, username, role, id);  
            }
        } finally {
            closeConnection();
        }
        return user;
    }
    
    public boolean deleteUser(String username) throws SQLException, ClassNotFoundException {
        boolean result;
        try {
            String sql = "Update public.user set deleted = 1 where username = ?";
            con = DBUtils.makeConnection();
            stm = con.prepareStatement(sql);
            stm.setString(1, username);
            result = stm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }
    
//    public boolean updateUser(String username, String fullName, long birthday) throws SQLException {
//        boolean result;
//        try {
//            String sql = "Update from dbo.user set fullname = ?, birthday = ? where username = ?";
//            con = DBUtils.makeConnection();
//            stm = con.prepareStatement(sql);
//            stm.setString(1, fullName);
//            stm.setLong(2, birthday);
//            stm.setString(3, username);
//            result = stm.executeUpdate() > 0;
//        } finally {
//            closeConnection();
//        }
//        return result;
//    }
    
    private void closeConnection() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
