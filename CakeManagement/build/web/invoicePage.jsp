<%-- 
    Document   : invoicePage
    Created on : Dec 6, 2023, 7:56:44 PM
    Author     : tolyh
--%>

<%@page import="dto.Orders"%>
<%@page import="dto.Users"%>
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
        <title>Invoice Page</title>
    </head>
    <body>
        <div id="header-wrap">
            <div class="header-top-menu bg-black color-secondary py-2">
                <div class="container-fluid">
                    <div class="row row-cols-md-2">
                        <div class="contact-block">
                            <span class="pr-50"><i class="icon icon-phone pe-2"></i>0123-2222-4444</span>
                            <span class="color-secondary">
                                <i class="icon icon-envelope-o pe-2"></i><a href="#" class="text-decoration-none">contact@yourcompany.com</a>
                            </span>
                        </div>

                        <div class="header-top-right text-md-end">
                            <ul class="list-unstyled d-flex justify-content-end color-secondary">
                                <!--<a href="MainController?action=Logout" class="Logout ">Logout</a>-->   
                                <li class="pr-50"><a href="MainController?action=Logout" class="text-decoration-none">Logout</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div><!----top-menu---->

            <header id="header">
                <div class="container-fluid">
                    <div class="row">

                        <nav class="navbar navbar-expand-lg col-md-12">

                            <div class="navbar-brand">
                                <img src="static/images/main-logo.png" alt="logo">
                            </div>

                            <button class="navbar-toggler collapsed" type="button" data-toggle="collapse"
                                    data-target="#slide-navbar-collapse" aria-controls="slide-navbar-collapse"
                                    aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"><i class="icon icon-navicon"></i></span>
                            </button>

                            <div class="navbar-collapse collapse" id="slide-navbar-collapse">
                                <ul class="navbar-nav list-inline text-uppercase">
                                    <li class="nav-item text-hover "><a href="/CakeManagement/MainController?action=Home" class="nav-link"
                                                                        data-effect="Home">Home</a></li>
                                    <li class="nav-item text-hover "><a href="/CakeManagement/MainController?action=AboutUs" class="nav-link"
                                                                        data-effect="About Us">About us</a></li>
                                    <li class="nav-item text-hover"><a href="/CakeManagement/MainController?action=OurCakes" class="nav-link"
                                                                       data-effect="Blogs">Our Cakes</a></li>

                                </ul>
                            </div>

                            <div class="action-menu">
                                <div class="searchbar">
                                    <a href="#" class="search-button search-toggle" data-selector=".navbar">
                                        <i class="icon icon-search"></i>
                                    </a>
                                    <form role="search" method="get" class="search-box" action="">
                                        <input class="search-field text search-input" placeholder="Search"
                                               type="search">
                                    </form>
                                </div>
                                <div class="shopping-cart">
                                    <a href="/CakeManagement/MainController?action=ViewCart">
                                        <i class="icon icon-shopping-cart"></i>
                                    </a>
                                </div>
                            </div><!--action-menu-->

                        </nav>

                    </div>
                </div>

            </header>

        </div><!--header-wrap-->

        <section class="special-items mb-5">
            <div class="item-content" style="height: 350px;">
                <div class="container">
                    <div class="row" style="text-align: center">
                        <div class="col-md-12 color-white">
                            <h2 class="section-title color-white mb-4">
                                Invoice
                            </h2>
                            <p>Home > Checkout</p>

                        </div><!--item-content-->
                    </div>
                </div>
            </div>
        </section>

        <%
            Users loginUser = (Users) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !("US".equals(loginUser.getRoleID()))) {
                response.sendRedirect("loginPage.jsp");
                return;
            }
            Orders order = (Orders) request.getAttribute("ORDER_SUCCESSFULLY");
            if (order != null) {
        %>
        <section class="col-md-3" style="margin: auto">
            <h2 style="text-align: center">Invoice</h2>
            <div>
                <p class="alignleft">Order ID</p>
                <p class="alignright">***</p>
            </div>
            <br>
            
            <div>
                <p class="alignleft">Date:</p>
                <p class="alignright"><%=order.getDateBuy()%></p>
            </div>
            <br>
            
             <div>
                <p class="alignleft">User ID:</p>
                <p class="alignright"><%=order.getUserID()%></p>
            </div>
            <br>
            
             <div>
                <p class="alignleft">Phone:</p>
                <p class="alignright"><%=order.getPhone()%></p>
            </div>
            <br>
            
             <div>
                <p class="alignleft">Address:</p>
                <p class="alignright"><%=order.getAddress()%></p>
            </div>
            <br>
            
             <div>
                <p class="alignleft">Total:</p>
                <p class="alignright"><%=order.getTotal()%></p>
            </div>
            <br><br><br>

        </section>

        <%
        } else {
        %>

        <h3 style="color:red">Having problem when saved your order!</h3>

        <%
            }
        %>
        <footer id="footer">
            <div class="container">
                <div class="row justify-content-between g-5">

                    <div class="col-md-3 footer-logo text-center mb-3">
                        <h4 class="widget-title">More Than Happy</h4>
                        <p>At vero eos et accusamus et iusto 0dio
                            dignissimos ducimus qui bland itiis
                            praesentium voluptatum deleniti atque
                            corrupti.
                        </p>
                    </div>

                    <div class="col-md-5 mb-3">


                        <div class="working-schedule">
                            <h4 class="widget-title">Our Work Time</h4>
                            <div class="time-list d-flex">
                                <ul class="list-unstyled">
                                    <li>Monday - Friday</li>
                                    <li>8:00am - 8:30 pm</li>
                                </ul> 
                                <ul class="list-unstyled" style="padding-left: 20px;">
                                    <li>Saturday - Sunday</li>
                                    <li>10:00am - 16:00 pm</li>
                                </ul>
                            </div>
                        </div>
                    </div><!--col-md-4-->

                    <div class="col-md-2">
                        <div class="quick-links">
                            <h4 class="widget-title">Contact Info</h4>
                            <div class="footer-menu">
                                <ul class="list-unstyled">
                                    <li>0794486799</li>
                                    <liMore Than Happy</li>
                                        <li>S1.02 Vinhome GrandPark Q9, Ho Chi Minh City, Vietnam</li>
                                        <li>thuyvi10061998@gmail.com</li>
                                </ul>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </footer>

        <script src="static/js/jquery.min.js"></script>
        <script type="text/javascript" src="static/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript" src="static/js/plugins.js"></script>
        <script type="text/javascript" src="static/js/script.js"></script>
        
         <style>
           
            .alignleft {
                float: left;
                text-align:left;
                width:50%;

            }
            .alignright {
                float: left;
                text-align:right;
                width:50%;
            }

          
        </style>
    </body>
</html>
