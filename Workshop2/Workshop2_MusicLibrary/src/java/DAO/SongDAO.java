/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.Song;
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
public class SongDAO {

    private static final String LISTALLSONG = "SELECT [SongID], [SongTitle] ,[SongArtist],[SongDuration], [url] FROM [dbo].[Song]";
    private static final String DELETE = "DELETE [dbo].[Song] WHERE [SongID] = ?";
    private static final String CREATE = "INSERT INTO [Song] ([SongID], [SongTitle] ,[SongArtist],[SongDuration], [url] ) VALUES (?, ?, ?, ?, ?)";

    public List<Song> listAllSong() throws SQLException, ClassNotFoundException {
        List<Song> songList = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBUtil.getConnection();
            if (con != null) {
                ps = con.prepareStatement(LISTALLSONG);
                rs = ps.executeQuery();
                while (rs.next()) {
                    String SongID = rs.getString("SongID");
                    String SongTitle = rs.getString("SongTitle");
                    String SongArtist = rs.getString("SongArtist");
                    String SongDuration = rs.getString("SongDuration");
                    String url = rs.getString("url");

                    songList.add(new Song(SongID, SongTitle, SongArtist, SongDuration, url));
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
        return songList;
    }

    public boolean delete(String SongId) throws ClassNotFoundException, SQLException {
        boolean checkDelete = false;
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBUtil.getConnection();
            if (con != null) {
                ps = con.prepareStatement(DELETE);
                ps.setString(1, SongId);
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

    public boolean CreateSong(Song song) throws SQLException {
        boolean result = false;
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DBUtil.getConnection();
            if (con != null) {
                ps = con.prepareStatement(CREATE);
                ps.setString(1, song.getSongID());
                ps.setString(2, song.getSongTitle());
                ps.setString(3, song.getSongArtist());
                ps.setString(4, song.getSongDuration());
                ps.setString(5, song.getUrl());
                
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
