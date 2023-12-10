/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Cakes;
import dto.OrderDetails;
import dto.Users;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author tolyh
 */
public class OrderDetailDAO {

    private static final String GET_ORDER_DETAILS = "SELECT [orderDetailsID], [cakeID], [orderID], [price], [quantity], [total] FROM tblOrderDetails";
    private static final String CREATE_ORDER_DETAILS = "INSERT INTO tblOrderDetails ([orderDetailsID], [cakeID], [orderID], [price], [quantity], [total]) VALUES (?, ?, ?, ?, ?, ?)";

    public List<OrderDetails> GetOrderDetails() throws SQLException {
        List<OrderDetails> listOrderDetails = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ps = con.prepareStatement(GET_ORDER_DETAILS);
                rs = ps.executeQuery();
                while (rs.next()) {
                    int orderDetailsID = rs.getInt("orderDetailsID");
                    String cakeID = rs.getString("cakeID");
                    int orderID = rs.getInt("orderID");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    float total = rs.getFloat("total");
                    OrderDetails orderDetail = new OrderDetails(orderDetailsID, cakeID, orderID, price, quantity, total);
                    listOrderDetails.add(orderDetail);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return listOrderDetails;

    }

    public boolean CreateODetails(OrderDetails oDetails) throws SQLException {
        boolean result = false;
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ps = con.prepareStatement(CREATE_ORDER_DETAILS);
                ps.setInt(1, oDetails.getOrderDetailsID());
                ps.setString(2, oDetails.getCakeID());
                ps.setInt(3, oDetails.getOrderID());
                ps.setFloat(4, oDetails.getPrice());
                ps.setInt(5, oDetails.getQuantity());
                ps.setFloat(6, oDetails.getTotal());
                result = ps.executeUpdate() > 0 ? true : false;

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }

        }
        return result;

    }

}
