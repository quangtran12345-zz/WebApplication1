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
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import quang.dto.BillDTO;
import quang.dto.ProductDTO;
import quang.utils.DBUtils;

/**
 *
 * @author Admin
 */
public class BillDAO implements Serializable {

    private Connection con = null;
    private PreparedStatement stm = null;
    private ResultSet rs = null;

    public int createBill(BillDTO bill) throws ClassNotFoundException, SQLException, Exception {
        int result = 0;
        try {
            con = DBUtils.makeConnection();
            String sql = "Insert into public.bill (sumPrice, userId) values (?,?)";
            stm = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stm.setFloat(1, bill.getSubTotal());
            stm.setInt(2, bill.getUserID());
            int affectedRows = stm.executeUpdate();
            if (affectedRows == 0) {
                throw new Exception("Creating bill failed, no rows affected.");
            }
            rs = stm.getGeneratedKeys();
            if (rs.next()) {
                result = rs.getInt(1);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean insertDetailBill(BillDTO bill) throws ClassNotFoundException, SQLException {
        boolean result = false;
        try {
            con = DBUtils.makeConnection();
            String sql = "Insert into public.detailBill (productId, billId, quantity) values (?,?,?)";
            stm = con.prepareStatement(sql);
            stm.setInt(1, bill.getProductID());
            stm.setInt(2, bill.getId());
            stm.setInt(3, bill.getQuantity());
            result = stm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<BillDTO> getListBill() throws ClassNotFoundException, SQLException {
        List<BillDTO> result = new ArrayList();
        int id;
        float sumPrice;
        String userName = null;
        try {
            con = DBUtils.makeConnection();
            String sql = "select bill.id, bill.sumPrice, u.name from public.bill, public.user as u where bill.userId = u.id and bill.deleted = 0";
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                id = rs.getInt("id");
                sumPrice = rs.getFloat("sumPrice");
                userName = rs.getString("name");
                result.add(new BillDTO(sumPrice, id, userName));
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public BillDTO getDetailBill(int id) throws ClassNotFoundException, SQLException {
        BillDTO bill = null;
        int idBill = 0;
        int quantity = 0;
        float sumPrice = 0;
        String userName = null;
        String productName = null;
        String image = null;
        float price = 0;

        List<ProductDTO> listProduct = new ArrayList<>();
        try {
            con = DBUtils.makeConnection();
            String sql = "select bill.id, product.productName, product.image, product.price, detailBill.quantity, bill.sumPrice, u.name "
                    + "from public.bill as bill, public.detailBill as detailBill, public.product as product, public.user as u where bill.id = detailBill.billId and detailBill.productId = product.id\n"
                    + "and bill.userId = u.id and bill.id = ? and bill.deleted = 0";
            stm = con.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                if (bill == null) {
                    idBill = id;
                    sumPrice = rs.getFloat("sumPrice");
                    userName = rs.getString("name");
                    bill = new BillDTO(sumPrice, id, userName, null);
                }
                quantity = rs.getInt("quantity");
                productName = rs.getString("productName");
                image = rs.getString("image");
                price = rs.getFloat("price");
                listProduct.add(new ProductDTO(productName, price, image, quantity));
            }
            if (bill != null) {
                bill.setListProducts(listProduct);
            }
        } finally {
            closeConnection();
        }
        return bill;
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
