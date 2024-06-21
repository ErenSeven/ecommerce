<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@page import="entity.User"%>
<%@page import="entity.Product"%>
<%@page import="dao.ProductDao"%>
<%@page import="helper.FactoryProvider"%>
<%
ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
List<Product> plist = pdao.getAllProducts();
%>
<div class="col-lg-4 col-sm-4">

    
    <% for (Product p : plist) { %>
        <div class="single_product_item">
            <img src=  "<%= p.getpPhoto() %>"
            alt="#" class="img-fluid">
            <h3> <a href="product_details.jsp"><%= p.getpDesc() %></a> </h3>
            <p>From $5
        </div>
        <% } %>

</div>
