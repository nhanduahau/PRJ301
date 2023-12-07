<%-- 
    Document   : songPage
    Created on : Dec 7, 2023, 9:52:09 PM
    Author     : tolyh
--%>

<%@page import="java.util.List"%>
<%@page import="DTO.Song"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Song Page</title>
    </head>
    <body>
        <%

        %>
        <h1>Song Page</h1>

        <form action ="MainController">
            <input type ="submit" name ="action" value ="ListAllSong" />
        </form>        
        <p>Add Song? <a href="/Workshop2_MusicLibrary/createSongPage.jsp">Create Song</a></p>

        <%            List<Song> listSong = (List<Song>) request.getAttribute("LIST_SONG");
            if (listSong != null) {
                if (listSong.size() > 0) {
        %>
        </br>
        <table class="table" border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Song ID</th>
                    <th>Song Title</th>
                    <th>Song Artist</th>
                    <th>Song Duration</th>

                    <th>Play</th>
                    <th>Remove</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    for (Song c : listSong) {

                %>
            <form action="MainController">
                <tr>
                    <td><%= count++%></td>
                    <td><%= c.getSongID()%></td>
                    <td>
                        <input type="text" name="SongTitle" value="<%= c.getSongTitle()%>" required=""/>
                    </td>
                    <td>
                        <input type="text" name="SongArtist" value="<%= c.getSongArtist()%>" required=""/>
                    </td>

                    <td>
                        <input type="text" name="SongDuration" value="<%= c.getSongDuration()%>" required=""/>
                    </td>

                    <td>
                        <a href="<%=c.getUrl()%>" target="_blank">Play</a>
                    </td>
                    <td>
                        <a href="MainController?&action=RemoveSong&txtSongId=<%=c.getSongID()%>">Delete</a>
                    </td>
                </tr>
            </form>
            <%}
                    }
                }
            %>
        </tbody>
    </table>
</body>
</html>
