<%-- 
    Document   : createBookPage
    Created on : Dec 7, 2023, 11:48:21 PM
    Author     : tolyh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Book Page</title>
    </head>
    <body>
          <%

            String result_Updated = (String) request.getAttribute("CREATE_ERROR");
            if (result_Updated == null) {
                result_Updated = "";
            }
        %>


        <h1>Create Book</h1>
        <%=result_Updated%>

        <form action="MainController" method="POST">
            Book ID <input type="text" name="txtBookId"value=""/> <br>
            Book Title<input type="text" name="txtBookTitle"value=""/><br>
            Book Author<input type="text" name="txtBookAuthor"value=""/><br>
            Year Of Published<input type="text" name="txtYearOfPublished"value=""/><br>
            <button type="Submit" name="action" value="AddBook">Add Book</button>
        </form>

    </body>
</html>
