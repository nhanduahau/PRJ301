<%-- 
    Document   : createAccountPage
    Created on : Dec 8, 2023, 1:08:22 AM
    Author     : tolyh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Account Page</title>
    </head>
    <body>
        <%

            String result_Updated = (String) request.getAttribute("CREATE_ERROR");
            if (result_Updated == null) {
                result_Updated = "";
            }
        %>


        <h1>Create Account</h1>
        <%=result_Updated%>

        <form action="MainController" method="POST">
            User ID <input type="text" name="txtUserName"value=""/> <br>
            User Password<input type="text" name="txtPassword"value=""/><br>
            User Full Name<input type="text" name="txtFullName"value=""/><br>
            Wallet<input type="text" name="txtWallet"value=""/><br>
            <button type="Submit" name="action" value="CreateAccount">Create Account</button>
        </form>

    </body>
</html>
