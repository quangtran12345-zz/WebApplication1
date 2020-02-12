/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package quang.utils;
/**
 *
 * @author Admin
 */
import java.io.Serializable;
import java.sql.*;

public class DBUtils implements Serializable {
    private final static String URL = "jdbc:postgresql://ec2-35-168-54-239.compute-1.amazonaws.com:5432/dchlu8bhei15rm?sslmode=require&user=bbtjyzsfzhwzlo&password=31f21918f8c14b7af1fa3e41c2c35ed1609692c9355ec078fa4e14747dd0818c";
    public static Connection makeConnection() throws ClassNotFoundException, SQLException {
            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection(URL);
            return con;
    }
}
