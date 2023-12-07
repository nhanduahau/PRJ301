<%-- 
    Document   : bookPage
    Created on : Dec 7, 2023, 11:48:07 PM
    Author     : tolyh
--%>

<%@page import="java.util.List"%>
<%@page import="DTO.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Page</title>
    </head>
    <body>
        <%

        %>
        <h1>Book Page</h1>

        <form action ="MainController">
            <input type ="submit" name ="action" value ="ListAllBook" />
        </form>        
        <p>Add Book? <a href="/Workshop2_Library/createBookPage.jsp">Create Book</a></p>

        <%            List<Book> listBook = (List<Book>) request.getAttribute("LIST_BOOK");
            if (listBook != null) {
                if (listBook.size() > 0) {
        %>
        </br>
        <table class="table" border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Book ID</th>
                    <th>Book Title</th>
                    <th>Book Author</th>
                    <th>Year of Published</th>
                    <th>Remove</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    for (Book c : listBook) {

                %>
            <form action="MainController">
                <tr>
                    <td><%= count++%></td>
                    <td><%= c.getBookID()%></td>
                    <td>
                        <input type="text" name="BookTitle" value="<%= c.getBookTitle()%>" required=""/>
                    </td>
                    <td>
                        <input type="text" name="BookAuthor" value="<%= c.getBookAuthor()%>" required=""/>
                    </td>

                    <td>
                        <input type="text" name="YearofPublished" value="<%= c.getYearOfPublished()%>" required=""/>
                    </td>

                    <td>
                        <a href="MainController?&action=RemoveBook&txtBookId=<%=c.getBookID()%>">Delete</a>
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
