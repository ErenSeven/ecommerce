<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="helper.FactoryProvider" %>
        <%@ page import="helper.Helper" %>
            <%@ page import="entity.Product" %>
            <%@ page import="entity.Category" %>
                <%@ page import="dao.ProductDao" %>
                <%@ page import="dao.CategoryDao" %>
<%@page import="entity.User"%>
<%@page import="entity.Orders"%>
<%@page import="dao.OrdersDao"%>
<%@page import="entity.OrderItems"%>
<%@page import="dao.OrderItemsDao"%>
<%@page import="dao.UserDao"%>
                        <%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%
try {
    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
    List<Category> clist = cdao.getCategories();
    OrdersDao odao = new OrdersDao(FactoryProvider.getFactory());
    OrderItemsDao oIdao = new OrderItemsDao(FactoryProvider.getFactory());
    String search = request.getParameter("search");
    User user1 = (User) session.getAttribute("current-user");
    int userId = user1.getUserID();
    
    System.out.println("Current user id: " + userId); // Debugging

    

    List<Orders> olist = odao.getOrdersByUserId(userId);
    List<OrderItems> oilist = oIdao.getOrderItemsByOrderId(5);
    

    if (olist == null || olist.isEmpty()) {
        System.out.println("No orders found for user id: " + userId); // Debugging
        olist = new ArrayList<>();
    } else {
        System.out.println("Number of orders found: " + olist.size()); // Debugging
    }
%>
<!doctype html>
<html lang="zxx">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>pillloMart</title>
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
    <!-- swiper CSS -->
    <link rel="stylesheet" href="css/slick.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
  <!--::header part start::-->
  <header class="main_menu home_menu">
    <div class="container">
        <div class="row align-items-center justify-content-center">
            <div class="col-lg-12">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <a class="navbar-brand" href="index.jsp"> <img src="img/logo.png" alt="logo"> </a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                        <span class="menu_icon"><i class="fas fa-bars"></i></span>
                    </button>

                    <div class="collapse navbar-collapse main-menu-item" id="navbarSupportedContent">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link" href="index.jsp">Home</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown_3" role="button"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Category
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown_2">
                                    <% for (Category c : clist) { %>
                                        <a class="dropdown-item" href="index.jsp?category=<%= c.getCategoryId() %>">
                                            <%= c.getCategoryTitle() %>
                                        </a>
                                    <% } %>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="about.jsp">about</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="contact.jsp">Contact</a>
                            </li>
                            
                            
                            <% if (user1 == null) { %>
                                <li class="nav-item active">
                                    <a class="nav-link" href="login.jsp">Login</a>
                                </li>
                                <li class="nav-item active">
                                    <a class="nav-link" href="register.jsp">Register</a>
                                </li>
                            <% } else { %>
                                
                                <li class="nav-item">
                                    <a class="nav-link" href="userOrder.jsp">Siparislerim</a>
                                </li>
                                <li class="nav-item active">
                                    <a class="nav-link" href="./LogoutServlet">Logout</a>
                                </li>
                                <li class="nav-item active">
                                    <a class="nav-link" href="<%=  user1.getUserType().equals("admin")
                                                                        ? "admin.jsp" : "normal.jsp" %>">(<%= user1.getUserName()%>)</a>
                                </li>
                            <% } %>
                                                                
                        </ul>
                    </div>
                    <div class="hearer_icon d-flex align-items-center">
                        <a id="search_1" href="javascript:void(0)"><i class="ti-search"></i></a>
                        <a href="cart.jsp">
                            <i class="flaticon-shopping-cart-black-shape"></i>
                        </a>
                    </div>
                </nav>
            </div>
        </div>
    </div>
</header>

    <!-- breadcrumb part start-->
    <section class="breadcrumb_part">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <h2>siparisler</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb part end-->

  <!-- ================ contact section start ================= -->
  <section class="contact-section section_padding">
    <div class="container">
      <div class="row">
        <div class="col-12">
          <h2 class="contact-title">Siparislerim</h2>
        </div>
        <div class="col-lg-12">
          <form class="form-contact contact_form" action="contact_process.php" method="post" id="contactForm"
            novalidate="novalidate">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4>Sipariş Listesi</h4>
                        </div>
                        <div class="card-body">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th scope="col">OrderID</th>
                                        <th scope="col">Total Amount</th>
                                        <th scope="col">Order Status</th>
                                        <th scope="col">Payment Method</th>
                                        <th scope="col">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for (Orders o : olist) { %>
                                        <tr>
                                            <th scope="row"><%= o.getOrderId() %></th>
                                            <td><%= o.getTotalAmount() %></td>
                                            <td><%= o.getOrderStatus() %></td>
                                            <td><%= o.getPaymentMethod() %></td>
                                            <td>
                                                <a href="orderItemList.jsp?order_id=<%= o.getOrderId() %>">Detayları Göster</a>
                                            </td>
                                        </tr>
                                    <% } %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </section>
  <!-- ================ contact section end ================= -->

  <%@ include file="components/footer.jsp" %>

    <!-- jquery plugins here-->
    <script src="js/jquery-1.12.1.min.js"></script>
    <!-- popper js -->
    <script src="js/popper.min.js"></script>
    <!-- bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- easing js -->
    <script src="js/jquery.magnific-popup.js"></script>
    <!-- swiper js -->
    <script src="js/swiper.min.js"></script>
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

<%
} catch (Exception e) {
    StringWriter sw = new StringWriter();
    PrintWriter pw = new PrintWriter(sw);
    e.printStackTrace(pw);
    out.println("<pre>" + sw.toString() + "</pre>");
}
%>