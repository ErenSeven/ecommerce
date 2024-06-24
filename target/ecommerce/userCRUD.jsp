<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="helper.FactoryProvider" %>
        <%@ page import="helper.Helper" %>
            <%@ page import="entity.User" %>
                <%@ page import="dao.UserDao" %>
                        <%@ page import="java.util.List" %>
                        <!DOCTYPE html>
                        <html lang="en">
                        <head>
                            <meta charset="UTF-8">
                            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
                            <title>Kullanıcı Yönetimi</title>
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
                                    <div class="col-md-6">
                                        <!-- Kategori Listesi -->
                                        <div class="card">
                                            <div class="card-header">
                                                <h4>Kullanıcı Listesi</h4>
                                            </div>
                                            <div class="card-body">
                                                <form action="userCRUD.jsp" method="GET" class="form-inline mb-3">
                                                    <input type="text" name="search" class="form-control mr-sm-2" placeholder="Kullanıcı adıyla ara">
                                                    <button type="submit" class="btn btn-outline-success">Ara</button>
                                                </form>
                                                <table class="table table-striped">
                                                    <thead>
                                                    </thead>
                                                    <tbody>
                                                        <%@ include file="components/listerUser.jsp" %>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <!-- Kullanıcı Ekleme Formu -->
                                        <div class="card">
                                            <div class="card-header">
                                                <h3 class="text-center">Yeni Kullanıcı Ekle</h3>
                                            </div>
                                            <div class="card-body">
                                                <form action="./UserOperationServlet" method="POST">
                                                    <input type="hidden" name="operation" value="adduser"> <!-- Operation değeri adduser olarak ayarlandı -->
                                                    <div class="form-group">
                                                        <label for="userName">Kullanıcı Adı</label>
                                                        <input type="text" class="form-control" id="userName" name="userName" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="userEmail">Kullanıcı E-postası</label>
                                                        <input type="email" class="form-control" id="userEmail" name="userEmail" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="userPassword">Kullanıcı Şifresi</label>
                                                        <input type="password" class="form-control" id="userPassword" name="userPassword" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="userType">Kullanıcı Tipi</label>
                                                        <input type="text" class="form-control" id="userType" name="userType" required>
                                                    </div>
                                                    <button type="submit" class="btn btn-primary">Ekle</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <!-- Kullanıcı Güncelleme Formu -->
                                        <div class="card">
                                            <div class="card-header">
                                                <h3 class="text-center">Kullanıcı Güncelle</h3>
                                            </div>
                                            <div class="card-body">
                                                <form action="./UserOperationServlet" method="POST">
                                                    <input type="hidden" name="operation" value="updateuser"> <!-- Operation değeri updateuser olarak ayarlandı -->
                                                    <div class="form-group">
                                                        <label for="userId">Kullanıcı ID</label>
                                                        <input type="number" class="form-control" id="userId" name="userId" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="userName">Yeni Kullanıcı Adı</label>
                                                        <input type="text" class="form-control" id="userName" name="userName" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="userEmail">Yeni Kullanıcı E-postası</label>
                                                        <input type="email" class="form-control" id="userEmail" name="userEmail" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="userPassword">Yeni Kullanıcı Şifresi</label>
                                                        <input type="password" class="form-control" id="userPassword" name="userPassword" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="userType">Yeni Kullanıcı Tipi</label>
                                                        <input type="text" class="form-control" id="userType" name="userType" required>
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
                        