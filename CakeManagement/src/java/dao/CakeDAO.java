/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Cakes;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author tolyh
 */
public class CakeDAO {

    private static final String SEARCH_CAKE = "SELECT [cakeID], [cakeName], [description], [price], [image] FROM tblCakes WHERE [cakeID] LIKE ?";
    private static final String UPDATE_CAKE = "UPDATE tblCakes SET cakeName = ?, description = ?, price = ? WHERE cakeId LIKE ?";
    private static final String DELETE_CAKE = "DELETE FROM tblCakes WHERE cakeID = ?";
    private static final String CREATE_CAKE = "INSERT INTO tblCakes (cakeID, cakeName, description, price, image) VALUES (?, ?, ?, ?, ?)";

    public List<Cakes> SearchCake(String cakeID) throws SQLException {
        List<Cakes> listCakes = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ps = con.prepareStatement(SEARCH_CAKE);
                ps.setString(1, '%' + cakeID + '%');
                rs = ps.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("cakeID");
                    String cakeName = rs.getString("cakeName");
                    String description = rs.getString("description");
                    float price = rs.getFloat("price");
                    String image = rs.getString("image");
                    listCakes.add(new Cakes(id, cakeName, description, price, image));
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
            return listCakes;
        }
    }

    public boolean UpdateCake(Cakes cake) throws SQLException {
        boolean result = false;
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ps = con.prepareStatement(UPDATE_CAKE);
                ps.setString(1, cake.getCakeName());
                ps.setString(2, cake.getDescription());
                ps.setFloat(3, cake.getPrice());
                ps.setString(4, cake.getCakeID());
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

    public boolean DeleteCake(String cakeID) throws SQLException {
        boolean result = false;
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ps = con.prepareStatement(DELETE_CAKE);
                ps.setString(1, cakeID);
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

    public boolean CreateCake(Cakes cake) throws SQLException {
        boolean result = false;
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ps = con.prepareStatement(CREATE_CAKE);
                ps.setString(1, cake.getCakeID());
                ps.setString(2, cake.getCakeName());
                ps.setString(3, cake.getDescription());
                ps.setFloat(4, cake.getPrice());
                ps.setString(5, cake.getImage());
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
