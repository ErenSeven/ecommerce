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
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js"> <!--<![endif]-->

<head>
	<meta charset="utf-8">
	<title>pillloMart</title>
	<meta name="description" content="">
	<!-- Mobile Specific Meta -->
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- <link rel="shortcut icon" href="img/favicon.png"> -->

	<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700' rel='stylesheet'>

	<!-- Syntax Highlighter -->
	<link rel="stylesheet" type="text/css" href="syntax-highlighter/styles/shCore.css" media="all">
	<link rel="stylesheet" type="text/css" href="syntax-highlighter/styles/shThemeDefault.css" media="all">

	<!-- Font Awesome CSS-->
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<!-- Normalize/Reset CSS-->
	<link rel="stylesheet" href="css/normalize.min.css">
	<!-- Main CSS-->
	<link rel="stylesheet" href="css/main.css">

</head>

<body id="welcome">

	<aside class="left-sidebar">
		<div class="logo">
			<a href="#welcome">
				<h1>pillloMart</h1>
			</a>
		</div>
		<nav class="left-nav">
			<ul id="nav">
				<li class="current"><a href="#welcome">Welcome</a></li>
				<li><a href="#products">Ürünler</a></li>
				<li><a href="#customers">Müşteriler</a></li>
				<li><a href="#orders">Siparişler</a></li>
				<li><a href="#categories">Kategoriler</a></li>
			</ul>
		</nav>
	</aside>

	<div id="main-wrapper">
		<div class="main-content">
			<section id="welcome">
				<div class="content-header">
					<h1>pillloMart</h1>
				</div>
				<div class="welcome">
					<h2 class="twenty">Welcome To pillloMart</h2>

					<p>Firstly, a huge thanks for purchasing this theme, your support is truly appreciated!</p>

					<p>This document covers the installation and use of this theme and often reveals answers to common
						problems and issues - read this document thoroughly if you are experiencing any difficulties. If
						you have any questions that are beyond the scope of this document. Thank you so much!</p>
				</div>

				<div class="features">
					<h2 class="twenty">Template Features</h2>

					<ul>
						<li>Ürünler CRUD</li>
						<li>Müşteriler CRUD</li>
						<li>Siparişler CRUD</li>
						<li>Sipariş Listesi + detaylar</li>
						<li>Müşteri Listesi</li>
					</ul>
				</div>

			</section>

			<section id="products">
				
				<div class="content-header">
					<h1>B</h1>
				</div>

				<div class="section-content">
					<ol>
                        <%@ include file="components/listerProduct.jsp" %>
					</ol>
				</div>

			</section>


			<section id="customers">
				<div class="content-header">
					<h1>C</h1>
				</div>
				<p class="fifteen">All information within the main content area is nested within a body tag. The general
					template structure is pretty the same throughout the template. Here is the general structure of main
					page (index.html).</p>
				<pre class="brush: html">
					<header class="header_area">

					</header>

					<main class="site-main">
						<section class="section">

						</section>
						<section class="section">

						</section>
						<section class="section">

						</section>
					</main>

					<footer class="footer">

					</footer>
				</pre>
			</section>


			<section id="orders">
				<div class="content-header">
					<h1>D</h1>
				</div>
				<h2 class="title">CSS Files and Structure</h2>
				<p class="fifteen">These are the css files that are loaded into templates in <strong>Head
						Section</strong>.</p>
				<pre class="brush: html">
		            <!--
                    CSS
                    ============================================= -->
					<link rel="stylesheet" href="css/bootstrap.min.css">
				    <link rel="stylesheet" href="css/animate.css">
				    <link rel="stylesheet" href="css/owl.carousel.min.css">
				    <link rel="stylesheet" href="css/all.css">
				    <link rel="stylesheet" href="css/flaticon.css">
				    <link rel="stylesheet" href="css/themify-icons.css">
				    <link rel="stylesheet" href="css/magnific-popup.css">
				    <link rel="stylesheet" href="css/slick.css">
				    <link rel="stylesheet" href="css/style.css">
                </pre>

			</section>

			<section id="categories">
				<div class="content-header">
					<h1>D</h1>
				</div>
				<h2 class="title">CSS Files and Structure</h2>
				<p class="fifteen">These are the css files that are loaded into templates in <strong>Head
						Section</strong>.</p>
				<pre class="brush: html">
		            <!--
                    CSS
                    ============================================= -->
					<link rel="stylesheet" href="css/bootstrap.min.css">
				    <link rel="stylesheet" href="css/animate.css">
				    <link rel="stylesheet" href="css/owl.carousel.min.css">
				    <link rel="stylesheet" href="css/all.css">
				    <link rel="stylesheet" href="css/flaticon.css">
				    <link rel="stylesheet" href="css/themify-icons.css">
				    <link rel="stylesheet" href="css/magnific-popup.css">
				    <link rel="stylesheet" href="css/slick.css">
				    <link rel="stylesheet" href="css/style.css">
                </pre>

				<h2 class="title">Google Web Fonts</h2>
			</section>
		</div>
	</div>


	<!-- Essential JavaScript Libraries
			==============================================-->
	<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="js/jquery.nav.js"></script>
	<script type="text/javascript" src="syntax-highlighter/scripts/shCore.js"></script>
	<script type="text/javascript" src="syntax-highlighter/scripts/shBrushXml.js"></script>
	<script type="text/javascript" src="syntax-highlighter/scripts/shBrushCss.js"></script>
	<script type="text/javascript" src="syntax-highlighter/scripts/shBrushJScript.js"></script>
	<script type="text/javascript" src="syntax-highlighter/scripts/shBrushPhp.js"></script>
	<script type="text/javascript">
		SyntaxHighlighter.all()
	</script>
	<script type="text/javascript" src="js/custom.js"></script>

</body>

</html>