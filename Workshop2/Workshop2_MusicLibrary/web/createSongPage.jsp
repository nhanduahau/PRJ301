<%-- 
    Document   : createSongPage
    Created on : Dec 7, 2023, 11:04:41 PM
    Author     : tolyh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Song Page</title>
    </head>
    <body>
        <%

            String result_Updated = (String) request.getAttribute("CREATE_ERROR");
            if (result_Updated == null) {
                result_Updated = "";
            }
        %>


        <h1>Create Mobile</h1>
        <%=result_Updated%>

        <form action="MainController" method="POST">
            Song ID <input type="text" name="txtSongId"value=""/> <br>
            Song Title<input type="text" name="txtSongTitle"value=""/><br>
            Song Artist<input type="text" name="txtSongArtist"value=""/><br>
            Song Duration<input type="text" name="txtSongDuration"value=""/><br>
            Song URL<input type="text" name="txturl"value=""/><br>
            <button type="Submit" name="action" value="AddSong">Add Song</button>
        </form>

    </body>
</html>
