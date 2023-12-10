<%-- 
    Document   : registerPage
    Created on : Dec 4, 2023, 11:41:18 PM
    Author     : tolyh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="format-detection" content="telephone=no">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="author" content="TemplatesJungle">
        <meta name="keywords" content="html,css,template,bootstrap">
        <meta name="description" content="Bootstrap 5 HTML Cake Shop Template">
        <link rel="stylesheet" type="text/css" href="static/fonts/icomoon/icomoon.css">
        <link rel="stylesheet" type="text/css" href="static/css/vendor.css" />

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

        <link href="https://fonts.googleapis.com/css2?family=Merriweather:ital,wght@0,400;0,700;1,400;1,700&display=swap"
              rel="stylesheet">

        <link rel="stylesheet" type="text/css" href="static/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="static/style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Page</title>
    </head>
    <body style="background-image: url(static/images/banner4.jpg)">
        <%
            String result_Updated = (String) request.getAttribute("ERROR_CREATE");
            if (result_Updated == null) {
                result_Updated = "";
            }
        %>

        <br>
        <br>
        <br>

        <div class="text-overlay" style="text-align: center">
            <div class="container">
                <div class="col-md-8" style="width: 50%; margin: auto; background-color: rgba(255,255,255,0.9); height: 500px;">
                    <div class="text-content" style="padding-top: 6%">
                        <span class="fs-6 text-muted">CREATE PAGE</span>
                        <%=result_Updated%>
                        <form action="MainController" method="POST">
                            User ID <br>
                            <input type="text" name="txtUserID" value=""/> <br>
                            Full Name <br>
                            <input type="text" name="txtFullName"value=""/> <br>
                            Role <br>
                            <input type="text" name="txtRoleID"value=""/> <br>
                            Password <br>
                            <input type="password" name="txtPassword"value=""/> <br>
                            Confirm <br>
                            <input type="password" name="txtConfirmPassword"value=""/> <br>
                            <button type="submit" name="action" value="CreateUser">Create</button>
                            <button type="reset">Reset</button> <br>
                            <p>Already have account? <a href="/CakeManagement">Click here</a></p>
                        </form> 
                    </div>
                </div>
            </div>
        </div><!--content-box-->


        <script src="static/js/jquery.min.js"></script>
        <script type="text/javascript" src="static/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript" src="static/js/plugins.js"></script>
        <script type="text/javascript" src="static/js/script.js"></script>


    </body>
</html>
