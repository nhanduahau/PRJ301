<%-- 
    Document   : cartPage
    Created on : Dec 6, 2023, 12:15:25 AM
    Author     : tolyh
--%>

<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.Map"%>
<%@page import="dto.CartObject"%>
<%@page import="dto.Cakes"%>
<%@page import="java.util.List"%>
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
        <title>CART Page</title>
    </head>
    <body>
        <%
            Users loginUser = (Users) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !("US".equals(loginUser.getRoleID()))) {
                response.sendRedirect("loginPage.jsp");
                return;
            }
            String cartEmpty = (String) request.getAttribute("CART_NULL");
            if (cartEmpty == null) {
                cartEmpty = "";
            }
        %>

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
                                Checkout
                            </h2>
                            <p>Home > CART</p>

                        </div><!--item-content-->
                    </div>
                </div>
            </div>
        </section>


        <h3 style="color: red"><%=cartEmpty%></h3>

        <%
            List<Cakes> listCakes = (List<Cakes>) request.getAttribute("LIST_CAKES");
            CartObject cart = (CartObject) session.getAttribute("CART");
            if (listCakes != null && cart != null) {
                Map<String, Integer> listOrders = cart.getItems();
                if (listCakes.size() > 0 && listOrders.size() > 0) {
                    float totalCart = 0;


        %>
        <h2 class="section-title">Your Order</h2>

        <table style="text-align: center; width: 90%">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Image</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <%                    for (String key : listOrders.keySet()) {
                        for (Cakes cake : listCakes) {
                            if (cake.getCakeID().equals(key)) {
                                float total = cake.getPrice() * listOrders.get(key);
                                totalCart += total;
                %>
            <form action="MainController" method="POST">
                <tr>
                    <td><%=key%></td>
                    <td><img src="<%=cake.getImage()%>" width="100px" height="100px"></td>
                    <td><%=cake.getCakeName()%></td>
                    <td><%=cake.getPrice()%></td>
                    <td>                        
                        <input type="text" name="txtQuantityBuy" value="<%=listOrders.get(key)%>"/>

                    </td>
                    <td><%=total%></td>
                    <td>
                        <button  type="submit" name="action" value="ChangeQuantity">Edit</button>
                        <button type="submit" name="action" value="RemoveCake">Remove</button>

                    </td>

                </tr>

                <input type="hidden" name="txtCakeIDBuy" value="<%=cake.getCakeID()%>"/>
                <input type="hidden" name="txtPriceBuy" value="<%=cake.getPrice()%>">

            </form>
            <%

            %>



            <%                }
                    }
                }

            %>
        </tbody>
    </table>
    <br>

    <form action="MainController" method="POST">
        <button type="submit" name="action" value="OurCakes">Add more</button>

    </form>
    <br>
    <div class="mb-8" style="text-align: right; padding-right:100px;">
        <h3>Cart Total</h3>
        <h4>Total: <%=totalCart%>$</h4>

        <form action="MainController" method="POST">
            <button type="submit" name="action" value="CheckOut">CheckOut</button>

        </form>
    </div>

    <%
            }
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
</body>

<style>

    td, th{
        border-width: 1px;
    }

</style>
</html>
