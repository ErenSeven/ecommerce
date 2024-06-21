<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@page import="entity.User"%>
<%@page import="entity.Category"%>
<%@page import="dao.CategoryDao"%>
<%@page import="helper.FactoryProvider"%>
<%
CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
List<Category> clist = cdao.getCategories();
User user1 = (User) session.getAttribute("current-user");
%>
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
        <!-- Header part end-->