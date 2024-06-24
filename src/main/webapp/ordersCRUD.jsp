<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="helper.FactoryProvider" %>
        <%@ page import="helper.Helper" %>
            <%@ page import="entity.Product" %>
            <%@ page import="entity.Category" %>
                <%@ page import="dao.ProductDao" %>
                <%@ page import="dao.CategoryDao" %>
                
<%@page import="entity.Orders"%>
<%@page import="dao.OrdersDao"%>
                        <%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%
OrdersDao odao = new OrdersDao(FactoryProvider.getFactory());
String search = request.getParameter("search");
List<Orders> olist;

if (search != null && !search.trim().isEmpty()) {
    olist = odao.searchOrdersByStatus(search);
} else {
    olist = odao.getAllOrders();
}
%>
                        <!DOCTYPE html>
                        <html lang="en">
                        <head>
                            <meta charset="UTF-8">
                            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
                            <title>Ürün Yönetimi</title>
                            <!-- Bootstrap CSS -->
                            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
                            <style>
                                body {
                                    background-color: #f8f9fa;
                                    font-family: Arial, sans-serif;
                                }
                                .sidebar {
                                    position: fixed;
                                    top: 0;
                                    left: 0;
                                    height: 100%;
                                    width: 250px;
                                    padding-top: 4rem;
                                    background-color: #343a40;
                                    color: #fff;
                                    transition: all 0.3s;
                                }
                                .sidebar-link {
                                    color: #fff;
                                    font-size: 18px;
                                    padding: 10px 20px;
                                    display: block;
                                    text-decoration: none;
                                    transition: background-color 0.3s;
                                }
                                .sidebar-link:hover {
                                    background-color: #495057;
                                    text-decoration: none;
                                }
                                .content {
                                    margin-left: 250px;
                                    padding: 20px;
                                }
                                .card {
                                    border: none;
                                    box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
                                    transition: transform 0.3s;
                                }
                                .card:hover {
                                    transform: translateY(-5px);
                                }
                            </style>
                        </head>
                        <body>
                            <!-- Sidebar -->
                            <div class="sidebar">
                                <h3 class="text-center mb-4 mt-3">Yönetim Paneli</h3>
                                <ul class="nav flex-column">
                                    <li class="nav-item">
                                        <a class="nav-link sidebar-link" href="categoryCRUD.jsp">Kategoriler</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link sidebar-link" href="ordersCRUD.jsp">Siparişler</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link sidebar-link" href="productCRUD.jsp">Ürünler</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link sidebar-link" href="userCRUD.jsp">Kullanıcılar</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="container mt-5">
                                <div class="row">
                                    <div class="col-md-12">
                                        <!-- Order List -->
                                        <div class="card">
                                            <div class="card-header">
                                                <h4>Order Listesi</h4>
                                            </div>
                                            <div class="card-body">
                                                <form action="ordersCRUD.jsp" method="GET" class="form-inline mb-3">
                                                    <input type="text" name="search" class="form-control mr-sm-2" placeholder="Sipariş durumu ile ara">
                                                    <button type="submit" class="btn btn-outline-success">Ara</button>
                                                </form>
                                                <table class="table table-striped">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">ID</th>
                                                            <th scope="col">User ID</th>
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
                                                            <td><%= o.getUser() %></td>
                                                            <td><%= o.getTotalAmount() %></td>
                                                            <td><%= o.getOrderStatus() %></td>
                                                            <td><%= o.getPaymentMethod() %></td>
                                                            <td>
                                                                <form action="OrdersOperationServlet" method="POST" style="display:inline;">
                                                                    <input type="hidden" name="operation" value="deleteorder">
                                                                    <input type="hidden" name="order_id" value="<%= o.getOrderId() %>">
                                                                    <button type="submit" class="btn btn-danger btn-sm">Sil</button>
                                                                </form>
                                                            </td>
                                                        </tr>
                                                        <% } %>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <!-- Ürün Ekleme Formu -->
                                        <div class="card">
                                            <div class="card-header">
                                                <h3 class="text-center">Yeni Sipariş Ekle</h3>
                                            </div>
                                            <div class="card-body">
                                                <form action="./OrdersOperationServlet" method="POST">
                                                    <input type="hidden" name="operation" value="addorder"> <!-- Operation değeri addproduct olarak ayarlandı -->
                                                    
                                                    <div class="form-group">
                                                        <label for="pQuantity">Kullanıcı Id</label>
                                                        <input type="number" class="form-control" id="user_id" name="user_id" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="pQuantity">Toplam Tutar</label>
                                                        <input type="number" class="form-control" id="total_amount" name="total_amount" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="pName">Sipariş Durumu</label>
                                                        <input type="text" class="form-control" id="order_status" name="order_status" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="pName">Ödeme Metodu</label>
                                                        <input type="text" class="form-control" id="payment_method" name="payment_method" required>
                                                    </div>
                                                    <button type="submit" class="btn btn-primary">Ekle</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    
                                    <div class="col-md-3">
                                        <!-- Ürün Güncelleme Formu -->
                                        <div class="card">
                                            <div class="card-header">
                                                <h3 class="text-center">Ürün Güncelle</h3>
                                            </div>
                                            <div class="card-body">
                                                <form action="./OrdersOperationServlet" method="POST">
                                                    <input type="hidden" name="operation" value="updateorder"> <!-- Operation değeri updateproduct olarak ayarlandı -->
                                                    <div class="form-group">
                                                        <label for="productId">Order ID</label>
                                                        <input type="number" class="form-control" id="order_id" name="order_id" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="pQuantity">Kullanıcı Id</label>
                                                        <input type="number" class="form-control" id="user_id" name="user_id" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="pQuantity">Toplam Tutar</label>
                                                        <input type="number" class="form-control" id="total_amount" name="total_amount" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="pName">Sipariş Durumu</label>
                                                        <input type="text" class="form-control" id="order_status" name="order_status" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="pName">Ödeme Metodu</label>
                                                        <input type="text" class="form-control" id="payment_method" name="payment_method" required>
                                                    </div>
                                                    <button type="submit" class="btn btn-primary">Güncelle</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                        
                            <!-- Bootstrap JS and dependencies -->
                            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
                            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
                            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
                        </body>
                        </html>
                        