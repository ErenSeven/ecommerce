<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="helper.FactoryProvider" %>
        <%@ page import="helper.Helper" %>
            <%@ page import="entity.Category" %>
                <%@ page import="dao.CategoryDao" %>
                        <%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Kategori Yönetimi</title>
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
                <a class="nav-link sidebar-link" href="siparisler.jsp">Siparişler</a>
            </li>
            <li class="nav-item">
                <a class="nav-link sidebar-link" href="urunler.jsp">Ürünler</a>
            </li>
            <li class="nav-item">
                <a class="nav-link sidebar-link" href="kullanicilar.jsp">Kullanıcılar</a>
            </li>
        </ul>
    </div>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-6">
                <!-- Kategori Listesi -->
                <div class="card">
                    <div class="card-header">
                        <h4>Kategori Listesi</h4>
                    </div>
                    <div class="card-body">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">id</th>
                                    <th scope="col">Başlık</th>
                                    <th scope="col">Açıklama</th>
                                    <th scope="col">İşlemler</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Kategori Listesi Dinamik Olarak Buraya Gelecek -->
                                <%@ include file="components/listerCategory.jsp" %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <!-- Kategori Ekleme Formu -->
                <div class="card">
                    <div class="card-header">
                        <h3 class="text-center">Yeni Kategori Ekle</h3>
                    </div>
                    <div class="card-body">
                        <form action="./ProductOperationServlet" method="POST">
                            <input type="hidden" name="operation" value="addcategory"> <!-- Operation değeri addcategory olarak ayarlandı -->
        
                            <div class="form-group">
                                <label for="catTitle">Kategori Başlığı</label>
                                <input type="text" class="form-control" id="categoryTitle" name="categoryTitle" required>
                            </div>
                            <div class="form-group">
                                <label for="catDescription">Kategori Açıklaması</label>
                                <textarea class="form-control" id="categoryDescription" name="categoryDescription" rows="3"></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary">Ekle</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header">
                    <h3 class="text-center">Kategori Güncelle</h3>
                </div>
                <div class="card-body">
                    <form action="./ProductOperationServlet" method="POST">
                        <input type="hidden" name="operation" value="updatecategory"> <!-- Operation değeri updatecategory olarak ayarlandı -->
    
                        <div class="form-group">
                            <label for="categoryId">Kategori ID</label>
                            <input type="number" class="form-control" id="categoryId" name="categoryId" required>
                        </div>
                        <div class="form-group">
                            <label for="categoryTitle">Yeni Kategori Başlığı</label>
                            <input type="text" class="form-control" id="categoryTitle" name="categoryTitle" required>
                        </div>
                        <div class="form-group">
                            <label for="categoryDescription">Yeni Kategori Açıklaması</label>
                            <textarea class="form-control" id="categoryDescription" name="categoryDescription" rows="3"></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">Güncelle</button>
                    </form>
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
