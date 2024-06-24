<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="helper.FactoryProvider" %>
        <%@ page import="helper.Helper" %>
            <%@ page import="entity.Product" %>
            <%@ page import="entity.Category" %>
                <%@ page import="dao.ProductDao" %>
                <%@ page import="dao.CategoryDao" %>
                        <%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%
ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
String search = request.getParameter("search");
List<Product> plist;

if (search != null && !search.trim().isEmpty()) {
    plist = pdao.searchProductsByName(search);
} else {
    plist = pdao.getAllProducts();
}
%>
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
                                    <div class="col-md-12">
                                        <!-- Ürün Listesi -->
                                        <div class="card">
                                            <div class="card-header">
                                                <h4>Ürün Listesi</h4>
                                            </div>
                                            <div class="card-body">
                                                <form action="productCRUD.jsp" method="GET" class="form-inline mb-3">
                                                    <input type="text" name="search" class="form-control mr-sm-2" placeholder="Ürün adıyla ara">
                                                    <button type="submit" class="btn btn-outline-success">Ara</button>
                                                </form>
                                                <table class="table table-striped">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">ID</th>
                                                            <th scope="col">Name</th>
                                                            <th scope="col">Description</th>
                                                            <th scope="col">Price</th>
                                                            <th scope="col">Quantity</th>
                                                            <th scope="col">Category</th>
                                                            <th scope="col">Actions</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <% for (Product p : plist) { %>
                                                        <tr>
                                                            <th scope="row"><%= p.getpId() %></th>
                                                            <td><%= p.getpName() %></td>
                                                            <td><%= p.getpDesc() %></td>
                                                            <td><%= p.getpPrice() %></td>
                                                            <td><%= p.getpQuantity() %></td>
                                                            <td><%= p.getCategory()%></td>
                                                            <td>
                                                                <form action="ProductOperationServlet" method="POST" style="display:inline;">
                                                                    <input type="hidden" name="operation" value="deleteproduct">
                                                                    <input type="hidden" name="productId" value="<%= p.getpId() %>">
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
                                                <h3 class="text-center">Yeni Ürün Ekle</h3>
                                            </div>
                                            <div class="card-body">
                                                <form action="./ProductOperationServlet" method="POST">
                                                    <input type="hidden" name="operation" value="addproduct"> <!-- Operation değeri addproduct olarak ayarlandı -->
                                                    <div class="form-group">
                                                        <label for="pName">Ürün Adı</label>
                                                        <input type="text" class="form-control" id="pName" name="pName" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="pDesc">Ürün Açıklaması</label>
                                                        <textarea class="form-control" id="pDesc" name="pDesc" rows="3"></textarea>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="pPrice">Ürün Fiyatı</label>
                                                        <input type="number" class="form-control" id="pPrice" name="pPrice" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="pQuantity">Ürün Miktarı</label>
                                                        <input type="number" class="form-control" id="pQuantity" name="pQuantity" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="catId">Kategori ID</label>
                                                        <input type="number" class="form-control" id="catId" name="catId" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="pPhoto">Ürün Fotoğrafının Pathi</label>
                                                        <input type="text" class="form-control" id="pPhoto" name="pPhoto" required>
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
                                                <form action="./ProductOperationServlet" method="POST">
                                                    <input type="hidden" name="operation" value="updateproduct"> <!-- Operation değeri updateproduct olarak ayarlandı -->
                                                    <div class="form-group">
                                                        <label for="productId">Ürün ID</label>
                                                        <input type="number" class="form-control" id="productId" name="productId" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="pName">Yeni Ürün Adı</label>
                                                        <input type="text" class="form-control" id="pName" name="pName" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="pDesc">Yeni Ürün Açıklaması</label>
                                                        <textarea class="form-control" id="pDesc" name="pDesc" rows="3"></textarea>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="pPrice">Yeni Ürün Fiyatı</label>
                                                        <input type="number" class="form-control" id="pPrice" name="pPrice" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="pQuantity">Yeni Ürün Miktarı</label>
                                                        <input type="number" class="form-control" id="pQuantity" name="pQuantity" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="catId">Yeni Kategori ID</label>
                                                        <input type="number" class="form-control" id="catId" name="catId" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="pPhoto">Yeni Fotoğraf Pathi</label>
                                                        <input type="text" class="form-control" id="pPhoto" name="pPhoto" required>
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
                        