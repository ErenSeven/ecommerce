<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="helper.FactoryProvider" %>
        <%@ page import="helper.Helper" %>
            <%@ page import="entity.Category" %>
                <%@ page import="dao.CategoryDao" %>
                    <%@ page import="entity.Product" %>
                        <%@ page import="entity.Orders" %>
                            <%@ page import="java.util.List" %>
                                <%@ page import="dao.ProductDao" %>

								<!DOCTYPE html>
								<html lang="en">
								<head>
									<meta charset="UTF-8">
									<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
									<title>Yönetim Paneli</title>
									<!-- Bootstrap CSS -->
									<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
									<!-- Custom styles -->
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
								
									<!-- Content -->
									<div class="content">
										<div class="container">
											<h1 class="mt-5 mb-4 text-center">Hoş Geldiniz!</h1>
											<div class="row">
												<div class="col-md-6">
													<div class="card bg-light p-3">
														<h5 class="card-title text-center mb-3">Kategoriler</h5>
														<p class="card-text text-center">Kategorileri yönetmek için tıklayın.</p>
														<a href="categoryCRUD.jsp" class="btn btn-primary btn-block">Kategorilere Git</a>
													</div>
												</div>
												<div class="col-md-6">
													<div class="card bg-light p-3">
														<h5 class="card-title text-center mb-3">Siparişler</h5>
														<p class="card-text text-center">Siparişleri yönetmek için tıklayın.</p>
														<a href="ordersCRUD.jsp" class="btn btn-primary btn-block">Siparişlere Git</a>
													</div>
												</div>
												<div class="col-md-6">
													<div class="card bg-light p-3">
														<h5 class="card-title text-center mb-3">Ürünler</h5>
														<p class="card-text text-center">Ürünleri yönetmek için tıklayın.</p>
														<a href="productCRUD.jsp" class="btn btn-primary btn-block">Ürünlere Git</a>
													</div>
												</div>
												<div class="col-md-6">
													<div class="card bg-light p-3">
														<h5 class="card-title text-center mb-3">Kullanıcılar</h5>
														<p class="card-text text-center">Kullanıcıları yönetmek için tıklayın.</p>
														<a href="userCRUD.jsp" class="btn btn-primary btn-block">Kullanıcılara Git</a>
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
								