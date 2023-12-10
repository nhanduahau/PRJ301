<%-- 
    Document   : accountPage
    Created on : Dec 8, 2023, 1:08:06 AM
    Author     : tolyh
--%>

<%@page import="java.util.List"%>
<%@page import="DTO.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account Page</title>
    </head>
    <body>
        <%

        %>
        <h1>Account Page</h1>

        <form action ="MainController">
            <input type ="submit" name ="action" value ="ListAllAccount" />
        </form>        
        <p>Add Account <a href="/Workshop2_Bank/createAccountPage.jsp">Create Account</a></p>

        <%            List<Account> listAccount = (List<Account>) request.getAttribute("LIST_ACCOUNT");
            if (listAccount != null) {
                if (listAccount.size() > 0) {
        %>
        </br>
        <table class="table" border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>User ID</th>
                    <th>User Password</th>
                    <th>User Full Name</th>
                    <th>Wallet</th>
                    <th>Deposit</th>
                    <th>Withdraw</th>
                    <th>Update</th>
                    <th>Remove</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    for (Account c : listAccount) {

                %>
            <form action="MainController" method="POST">
                <tr>
                    <td><%= count++%></td>
                    <td><%= c.getUserName()%></td>
                    <td>
                        <input type="text" name="password" value="<%= c.getPassword()%>" required=""/>
                    </td>
                    <td>
                        <input type="text" name="fullName" value="<%= c.getFullName()%>" required=""/>
                    </td>

                    <td>
                       <%=c.getWallet()%>
                    </td>
                    <td>
                        <a href="/Workshop2_Bank/depositPage.jsp?txtUsername=<%=c.getUserName()%>">Deposit</a>
                    </td>
                    <td>
                        <a href="/Workshop2_Bank/withdrawPage.jsp?txtUsername=<%=c.getUserName()%>">Withdraw</a>
                    </td>
                    <td>
                        <input type="submit" name="action" value="UpdateAccount"/>
                        <input type="hidden" name="userName" value="<%= c.getUserName()%>"/>
                    </td>
                    <td>
                        <a href="MainController?&action=RemoveAccount&txtUserName=<%=c.getUserName()%>">Delete</a>
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
