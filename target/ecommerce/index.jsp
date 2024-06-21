<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="helper.FactoryProvider" %>
        <%@ page import="helper.Helper" %>
            <%@ page import="entity.Category" %>
                <%@ page import="dao.CategoryDao" %>
                    <%@ page import="entity.Product" %>
                        <%@ page import="java.util.List" %>
                            <%@ page import="dao.ProductDao" %>

                                    <html lang="en">

                                    <head>
                                        <meta charset="UTF-8">
                                        <meta name="description" content="Male_Fashion Template">
                                        <meta name="keywords" content="Male_Fashion, unica, creative, html">
                                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                                        <meta http-equiv="X-UA-Compatible" content="ie=edge">
                                        <title>Male-Fashion | Template</title>

                                        <link rel="icon" href="img/favicon.png">
                                        <!-- Bootstrap CSS -->
                                        <link rel="stylesheet" href="css/bootstrap.min.css">
                                        <!-- animate CSS -->
                                        <link rel="stylesheet" href="css/animate.css">
                                        <!-- owl carousel CSS -->
                                        <link rel="stylesheet" href="css/owl.carousel.min.css">
                                        <!-- font awesome CSS -->
                                        <link rel="stylesheet" href="css/all.css">
                                        <!-- flaticon CSS -->
                                        <link rel="stylesheet" href="css/flaticon.css">
                                        <link rel="stylesheet" href="css/themify-icons.css">
                                        <!-- font awesome CSS -->
                                        <link rel="stylesheet" href="css/magnific-popup.css">
                                        <link rel="stylesheet" href="css/font-awesome.min.css">
                                        <!-- swiper CSS -->
                                        <link rel="stylesheet" href="css/slick.css">
                                        <!-- style CSS -->
                                        <link rel="stylesheet" href="css/style.css">
                                    </head>



                                    <body>
                                        <%@ include file="components/header.jsp" %>

                                            <!-- product list part start-->
                                            <section class="product_list section_padding">
                                                <div class="container">
                                                    <div class="row">
                                                        <div class="col-lg-3">
                                                            <div class="product_sidebar">
                                                                <div class="single_sedebar">
                                                                    <form action="#">
                                                                        <input type="text" name="#"
                                                                            placeholder="Search keyword">
                                                                        <i class="ti-search"></i>
                                                                    </form>
                                                                </div>
                                                                <div class="single_sedebar">
                                                                    <div class="select_option">
                                                                        <div class="select_option_list">Category <i
                                                                                class="right fas fa-caret-down"></i>
                                                                        </div>
                                                                        <div class="select_option_dropdown">
                                                                            <% for (Category c : clist) { %>
                                                                                <p><a
                                                                                        href="index.jsp?category=<%= c.getCategoryId() %>">
                                                                                        <%= c.getCategoryTitle() %>
                                                                                    </a></p>
                                                                                <% } %>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="single_sedebar">
                                                                    <div class="select_option">
                                                                        <div class="select_option_list">Ürünleri Sırala
                                                                            <i class="right fas fa-caret-down"></i>
                                                                        </div>
                                                                        <div class="select_option_dropdown">
                                                                            <p><a href="#">Fiyata göre artan</a></p>
                                                                            <p><a href="#">Fiyata göre azalan</a></p>
                                                                            <p><a href="#">Çok Satanlar</a></p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-9">
                                                            <div class="product_list">
                                                                <div class="row">
                                                                    <%@ include file="components/listerProduct.jsp" %>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </section>
                                            <!-- product list part end-->

                                            <%@ include file="components/footer.jsp" %>

                                                <!-- jquery plugins here-->
                                                <script src="js/jquery-1.12.1.min.js"></script>
                                                <!-- bootstrap js -->
                                                <script src="js/bootstrap.min.js"></script>
                                                <!-- easing js -->
                                                <script src="js/jquery.magnific-popup.js"></script>
                                                <!-- swiper js -->
                                                <script src="js/mixitup.min.js"></script>
                                                <!-- particles js -->
                                                <script src="js/owl.carousel.min.js"></script>
                                                <script src="js/jquery.nice-select.min.js"></script>
                                                <!-- slick js -->
                                                <script src="js/slick.min.js"></script>
                                                <script src="js/jquery.counterup.min.js"></script>
                                                <script src="js/waypoints.min.js"></script>
                                                <script src="js/contact.js"></script>
                                                <script src="js/jquery.ajaxchimp.min.js"></script>
                                                <script src="js/jquery.form.js"></script>
                                                <script src="js/jquery.validate.min.js"></script>
                                                <script src="js/mail-script.js"></script>
                                                <!-- custom js -->
                                                <script src="js/custom.js"></script>

                                    </body>

                                    </html>