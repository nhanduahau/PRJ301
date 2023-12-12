/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Users;
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
public class UserDAO {

    private static final String LOGIN = "SELECT [userID], [fullName], [roleID] FROM tblUsers WHERE [userID] LIKE ? AND [password] LIKE ?";
    private static final String SEARCH_USER = "SELECT [userID], [fullName], [roleID] FROM tblUsers WHERE [fullName] LIKE ?";
    private static final String GET_USER = "SELECT [userID], [fullName], [roleID] FROM tblUsers WHERE [userID] LIKE ?";
    private static final String UPDATE_USER = "UPDATE tblUsers SET fullName = ?, roleID = ? WHERE userID LIKE ?";
    private static final String DELETE_USER = "DELETE FROM tblUsers WHERE userID = ?";
    private static final String CREATE_USER = "INSERT INTO tblUsers (userID, fullName, password, roleID) VALUES (?, ?, ?, ?)";

    public Users checkLogin(String username, String password) throws SQLException {
        Users user = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ps = con.prepareStatement(LOGIN);
                ps.setString(1, username);
                ps.setString(2, password);
                rs = ps.executeQuery();
                if (rs.next()) {
                    String fullName = rs.getString("fullName");
                    String roleID = rs.getString("roleID");
                    user = new Users(username, fullName, "", roleID);
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
        return user;
    }

    public List<Users> SearchUser(String fullName) throws SQLException {
        List<Users> listUsers = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ps = con.prepareStatement(SEARCH_USER);
                ps.setString(1, '%' + fullName + '%');
                rs = ps.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("userID");
                    String fullNameU = rs.getString("fullName");
                    String roleID = rs.getString("roleID");
                    Users user = new Users(id, fullNameU, "", roleID);
                    listUsers.add(user);
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
            return listUsers;
        }
    }

    public Users GetUser(String username) throws SQLException {
        Users user = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ps = con.prepareStatement(GET_USER);
                ps.setString(1, username);
                rs = ps.executeQuery();
                if (rs.next()) {
                    String fullName = rs.getString("fullName");
                    String roleID = rs.getString("roleID");
                    user = new Users(username, fullName, "", roleID);
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
        return user;
    }

    public boolean UpdateUser(Users user) throws SQLException {
        boolean result = false;
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ps = con.prepareStatement(UPDATE_USER);
                ps.setString(1, user.getFullName());
                ps.setString(2, user.getRoleID());
                ps.setString(3, user.getUserID());
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

  
      public boolean Delete(String userID) throws SQLException {
        boolean result = false;
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DBUtils.getConnection();
            if (con != null) {               
                ps = con.prepareStatement(DELETE_USER);
                ps.setString(1, userID);

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

    public boolean CreateUser(Users user) throws SQLException {
        boolean result = false;
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ps = con.prepareStatement(CREATE_USER);
                ps.setString(1, user.getUserID());
                ps.setString(2, user.getFullName());
                ps.setString(3, user.getPassword());
                ps.setString(4, user.getRoleID());
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
