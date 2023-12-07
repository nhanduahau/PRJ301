/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.Book;
import Utils.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author tolyh
 */
public class BookDAO {

    private static final String LISTALLBOOK = "SELECT [BookID], [BookTitle] ,[BookAuthor],[YearOfPublished] FROM [dbo].[Book]";
    private static final String DELETE = "DELETE [dbo].[Book] WHERE [BookID] = ?";
    private static final String CREATE = "INSERT INTO [dbo].[Book] ([BookID], [BookTitle] ,[BookAuthor],[YearOfPublished]) VALUES (?, ?, ?, ?)";

    public List<Book> listAllBook() throws SQLException, ClassNotFoundException {
        List<Book> bookList = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBUtil.getConnection();
            if (con != null) {
                ps = con.prepareStatement(LISTALLBOOK);
                rs = ps.executeQuery();
                while (rs.next()) {
                    String BookID = rs.getString("BookID");
                    String BookTitle = rs.getString("BookTitle");
                    String BookArtist = rs.getString("BookAuthor");
                    String txtYearOfPublished = rs.getString("YearOfPublished");
                    int YearOfPublished = Integer.parseInt(txtYearOfPublished);
                    bookList.add(new Book(BookID, BookTitle, BookArtist, YearOfPublished));
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
        return bookList;
    }

    public boolean delete(String BookId) throws ClassNotFoundException, SQLException {
        boolean checkDelete = false;
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBUtil.getConnection();
            if (con != null) {
                ps = con.prepareStatement(DELETE);
                ps.setString(1, BookId);
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

    public boolean CreateBook(Book book) throws SQLException {
        boolean result = false;
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DBUtil.getConnection();
            if (con != null) {
                ps = con.prepareStatement(CREATE);
                ps.setString(1, book.getBookID());
                ps.setString(2, book.getBookTitle());
                ps.setString(3, book.getBookAuthor());
                ps.setInt(4, book.getYearOfPublished());
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
