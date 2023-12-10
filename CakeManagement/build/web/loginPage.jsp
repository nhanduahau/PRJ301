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
        <title>Login Page</title>
    </head>
    <body style="background-image: url(static/images/banner7.jpg)">

        <br>
        <br>
        <br>

        <div class="text-overlay" style="text-align: center">
            <div class="container">
                <div class="col-md-8" style="width: 50%; margin: auto; background-color: rgba(255,255,255,0.9); height: 300px;">
                    <div class="text-content" style="padding-top: 6%">
                        <span class="fs-6 text-muted">LOGIN PAGE</span>
                        <form action="MainController" method="POST">
                            Username <input name="txtUsername" /> 
                            <br> <br>
                            Password <input type="password" name="txtPassword" />
                            <br>
                            <input name="action"  type="submit" value="Login" /> 
                            <button type="reset">Reset</button> <br>

                            <%
                                String error = (String) request.getAttribute("ERROR");
                                if (error == null) {
                                    error = "";
                                }
                            %>
                            <%= error%>
                        </form>
                        <br>
                        <p>Create new user account? <a href="/CakeManagement/registerPage.jsp">Click here</a></p>
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