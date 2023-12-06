/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.prj301.shopping;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import pe.prj301.utils.DBUtils;
import pe.prj301.shopping.Products;

/**
 *
 * @author hd
 */
public class DAO {

    private static final String SEARCHALL = "SELECT [productID], [productName] ,[description],[price] FROM [dbo].[tblProducts] WHERE [status] = 1";

    public List<Products> getAllProduct() throws SQLException, ClassNotFoundException {
        List<Products> productList = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ps = con.prepareStatement(SEARCHALL);
                rs = ps.executeQuery();
                while (rs.next()) {
                    String ProductID = rs.getString("productID");
                    String ProductName = rs.getString("productName");
                    String Description = rs.getString("description");
                    float price = rs.getFloat("price");
                    productList.add(new Products(ProductID, ProductName, Description, price));
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
        return productList;
    }
}
