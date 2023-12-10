/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Orders;
import dto.Users;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author tolyh
 */
public class OrderDAO {

    private static final String SEARCH_ORDERS = "Select [orderID], [dateBuy], [userID], [phone], [address] from tblOrders where CAST( dateBuy AS DATE) = ?";
    private static final String GET_ORDERS = "Select [orderID], [dateBuy], [userID], [phone], [address] from tblOrders";
    private static final String CREATE_ORDER = "INSERT INTO tblOrders ([orderID], [dateBuy], [total], [userID], [phone], [address]) VALUES (?, ?, ?, ?, ?, ?)";

    public List<Orders> GetOrders() throws SQLException {
        List<Orders> listOrders = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ps = con.prepareStatement(GET_ORDERS);
                rs = ps.executeQuery();
                while (rs.next()) {
                    int orderId = rs.getInt("orderId");
                    //  LocalDateTime date = rs.getDate("dateBuy");
                    LocalDateTime createdDateTime = rs.getTimestamp("dateBuy").toLocalDateTime();

                    String userID = rs.getString("userID");
                    String phone = rs.getString("phone");
                    String address = rs.getString("address");
                    Orders order = new Orders(orderId, createdDateTime, 0, userID, phone, address);
                    listOrders.add(order);
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
        return listOrders;

    }

    public List<Orders> GetOrdersWithDate(LocalDateTime date) throws SQLException {
        List<Orders> listOrders = new ArrayList<>();
        java.sql.Date sqlDate = java.sql.Date.valueOf(date.toLocalDate());
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ps = con.prepareStatement(SEARCH_ORDERS);
                ps.setDate(1, sqlDate);
                rs = ps.executeQuery();
                while (rs.next()) {
                    int orderId = rs.getInt("orderId");
                    //  LocalDateTime date = rs.getDate("dateBuy");
                    LocalDateTime createdDateTime = rs.getTimestamp("dateBuy").toLocalDateTime();

                    String userID = rs.getString("userID");
                    String phone = rs.getString("phone");
                    String address = rs.getString("address");
                    Orders order = new Orders(orderId, createdDateTime, 0, userID, phone, address);
                    listOrders.add(order);
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
        return listOrders;

    }

    public boolean CreateOrder(Orders order) throws SQLException {
        boolean result = false;
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ps = con.prepareStatement(CREATE_ORDER);
                Timestamp timestamp = Timestamp.valueOf(order.getDateBuy());

                ps.setInt(1, order.getOrderID());
                ps.setTimestamp(2, timestamp);
                ps.setFloat(3, order.getTotal());
                ps.setString(4, order.getUserID());
                ps.setString(5, order.getPhone());
                ps.setString(6, order.getAddress());
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
            return result;

        }
    }
}
