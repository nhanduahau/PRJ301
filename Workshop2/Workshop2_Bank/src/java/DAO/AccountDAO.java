/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtil;

/**
 *
 * @author tolyh
 */
public class AccountDAO {

    private static final String LISTALLACCOUNT = "SELECT [userName], [password] ,[fullName],[wallet]FROM [dbo].[Account]";
    private static final String DELETE = "DELETE [dbo].[Account] WHERE [userName] = ?";
    private static final String CREATE = "INSERT INTO [Account] ([userName], [password] ,[fullName],[wallet]) VALUES (?, ?, ?, ?)";
    private static final String UPDATE = "UPDATE [dbo].[Account] SET [password] = ?, [fullName] = ? WHERE [userName] LIKE ?";
    private static final String UPDATE_WALLET = "UPDATE [dbo].[Account] SET [wallet] = ? WHERE [userName] LIKE ?";
    private static final String SEARCHBYNAME = "SELECT [userName], [password] ,[fullName], [wallet] FROM [dbo].[Account] WHERE [userName] LIKE ?";

    public List<Account> listAllAccount() throws SQLException, ClassNotFoundException {
        List<Account> accountList = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBUtil.getConnection();
            if (con != null) {
                ps = con.prepareStatement(LISTALLACCOUNT);
                rs = ps.executeQuery();
                while (rs.next()) {
                    String userName = rs.getString("userName");
                    String password = rs.getString("password");
                    String fullName = rs.getString("fullName");
                    float wallet = rs.getFloat("wallet");
                    accountList.add(new Account(userName, password, fullName, wallet));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                rs.close();
            }
            if (con != null) {
                rs.close();
            }
        }
        return accountList;
    }

    public boolean delete(String txtUserName) throws ClassNotFoundException, SQLException {
        boolean checkDelete = false;
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBUtil.getConnection();
            if (con != null) {
                ps = con.prepareStatement(DELETE);
                ps.setString(1, txtUserName);
                checkDelete = ps.executeUpdate() > 0 ? true : false;
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
        return checkDelete;
    }

    public boolean CreateAccount(Account account) throws SQLException {
        boolean result = false;
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DBUtil.getConnection();
            if (con != null) {
                ps = con.prepareStatement(CREATE);
                ps.setString(1, account.getUserName());
                ps.setString(2, account.getPassword());
                ps.setString(3, account.getFullName());
                ps.setFloat(4, account.getWallet());
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

    public boolean UpdateAccount(Account account) throws SQLException {
        boolean result = false;
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DBUtil.getConnection();
            if (con != null) {
                ps = con.prepareStatement(UPDATE);
                ps.setString(1, account.getPassword());
                ps.setString(2, account.getFullName());
                ps.setString(3, account.getUserName());

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

    public boolean UpdateWallet(Account account) throws SQLException {
        boolean result = false;
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DBUtil.getConnection();
            if (con != null) {
                ps = con.prepareStatement(UPDATE_WALLET);
                ps.setFloat(1, account.getWallet());
                ps.setString(2, account.getUserName());

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

    public List<Account> getAccountByName(String userName) throws SQLException, ClassNotFoundException {
        List<Account> accountList = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBUtil.getConnection();
            if (con != null) {
                ps = con.prepareStatement(SEARCHBYNAME);
                ps.setString(1, '%' + userName + '%');
                rs = ps.executeQuery();
                while (rs.next()) {
                    String txtUserName = rs.getString("userName");
                    String password = rs.getString("password");
                    String fullName = rs.getString("fullName");
                    Float wallet = rs.getFloat("wallet");

                    accountList.add(new Account(txtUserName, password, fullName, wallet));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                rs.close();
            }
            if (con != null) {
                rs.close();
            }
        }
        return accountList;
    }
}
