/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package quang.dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import quang.dto.ProductDTO;
import quang.dto.TypeProductDTO;
import quang.utils.DBUtils;

/**
 *
 * @author Admin
 */
public class ProductDAO implements Serializable {

    private Connection con = null;
    private PreparedStatement stm = null;
    private ResultSet rs = null;

    public boolean createProduct(ProductDTO product) throws SQLException, ClassNotFoundException {
        boolean result = false;
        try {
            con = DBUtils.makeConnection();
            String sql = "Insert into public.product (productName, typeId, price, image) values (?,?,?, ?)";
            stm = con.prepareStatement(sql);
            stm.setString(1, product.getName());
            stm.setInt(2, product.getType());
            stm.setFloat(3, product.getPrice());
            stm.setString(4, product.getImage());
            result = stm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<ProductDTO> getListProduct(String searchValue, int typeId) throws SQLException, ClassNotFoundException {
        List<ProductDTO> listProduct = new ArrayList<>();
        String productName = null;
        String image = null;
        String productType = null;
        float price;
        int id;
        ProductDTO dto = null;

        try {
            con = DBUtils.makeConnection();
            String sql = "Select pr.productName, pr.price, pr.image, pr.id, prt.typeName as productType "
                    + "from public.product pr, public.productType prt "
                    + "where pr.typeId = prt.id and pr.productName like ? and pr.deleted = 0 ";
            if (typeId != -1) {
                sql = "Select pr.productName, pr.price, pr.image, pr.id, prt.typeName as productType "
                        + "from public.product pr, public.productType prt where pr.typeId = prt.id and typeId = " + typeId
                        + " and pr.productName like ? and pr.deleted = 0";
            }
            System.out.println(searchValue);
            stm = con.prepareStatement(sql);
            stm.setString(1, "%" + searchValue + "%");
            rs = stm.executeQuery();
            while (rs.next()) {
                productName = rs.getString("productName");
                image = rs.getString("image");
                productType = rs.getString("productType");
                price = rs.getFloat("price");
                id = rs.getInt("id");
                dto = new ProductDTO(productName, price, productType, image, id);
                listProduct.add(dto);
            }
        } finally {
            closeConnection();
        }
        return listProduct;
    }

    public ProductDTO getDetailProduct(int id) throws SQLException, ClassNotFoundException {
        String image = null;
        String productType = null;
        float price;
        String productName;
        ProductDTO dto = null;

        try {
            con = DBUtils.makeConnection();
            String sql = "Select image, typeId, price, productName from public.product where id = ? and deleted = 0";
            stm = con.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            if (rs.next()) {
                image = rs.getString("image");
                productType = Integer.toString(rs.getInt("typeId"));
                price = rs.getFloat("price");
                productName = rs.getString("productName");
                dto = new ProductDTO(productName, price, productType, image, id);
            }
        } finally {
            closeConnection();
        }
        return dto;
    }

    public boolean checkProductExisted(String productName) throws SQLException, ClassNotFoundException {

        boolean check = false;
        try {
            con = DBUtils.makeConnection();
            String sql = "Select productName from public.product where productName = ? and deleted = 0";
            stm = con.prepareStatement(sql);
            stm.setString(1, productName);
            rs = stm.executeQuery();
            if (rs.next()) {
                check = true;
            }
        } finally {
            closeConnection();
        }
        return check;
    }

    public List<TypeProductDTO> getListTypeProduct() throws SQLException, ClassNotFoundException {
        List<TypeProductDTO> listTypeProduct = new ArrayList<>();
        String typeName = null;
        int id;
        TypeProductDTO dto = null;

        try {
            con = DBUtils.makeConnection();
            String sql = "Select typeName, id from public.productType where deleted = 0";
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                typeName = rs.getString("typeName");
                id = rs.getInt("id");
                dto = new TypeProductDTO(typeName, id);
                listTypeProduct.add(dto);
            }
        } finally {
            closeConnection();
        }
        return listTypeProduct;
    }
    
    public boolean editProduct(ProductDTO dto, int id) throws ClassNotFoundException, SQLException {
        boolean result = false;
        System.out.println(dto.getType());
        try {
            con = DBUtils.makeConnection();
            String sql = "update public.product set productName = ?, price = ?, typeId = ? where id = ?";
            stm = con.prepareStatement(sql);
            stm.setString(1, dto.getName());
            stm.setFloat(2, dto.getPrice());
            stm.setInt(3, dto.getType());
            stm.setInt(4, id);
            result = stm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    public boolean deleteProduct(int id) throws ClassNotFoundException, SQLException {
        boolean result = false;
        try {
            con = DBUtils.makeConnection();
            String sql = "Update public.product set deleted = 1 where id = ?";
            stm = con.prepareStatement(sql);
            stm.setInt(1, id);
            result = stm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean createTypeProduct(String typeName) throws ClassNotFoundException, SQLException {
        boolean result = false;
        try {
            con = DBUtils.makeConnection();
            String sql = "Insert into public.productType (typeName) values (?)";
            stm = con.prepareStatement(sql);
            stm.setString(1, typeName);
            result = stm.executeUpdate() > 0;
        } finally {
            closeConnection();

        }
        return result;
    }

    public boolean checkTypeProductExisted(String typeName) throws ClassNotFoundException, SQLException {
        boolean result = false;
        try {
            con = DBUtils.makeConnection();
            String sql = "select typeName from public.productType where typeName = ? and deleted = 0";
            stm = con.prepareStatement(sql);
            stm.setString(1, typeName);
            rs = stm.executeQuery();
            if (rs.next()) {
                result = true;
            }
        } finally {
            closeConnection();

        }
        return result;
    }

    public boolean deleteTypeProduct (int id) throws ClassNotFoundException, SQLException {
       boolean result = false;
        try {
            con = DBUtils.makeConnection();
            String sql = "Update public.productType set deleted = 1 where id = ?";
            stm = con.prepareStatement(sql);
            stm.setInt(1, id);
            result = stm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }
    
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
