<%@ page import="mainPackage.DatabaseLogIn" %>
<%@ page import="models.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Nike Products</title>
</head>
<body>
    <h1>Nike Products</h1>
    <%
        DatabaseLogIn dbLogin = new DatabaseLogIn();
        ArrayList<Product> nikeProducts = dbLogin.ProductsByBrand("Nike");
        for (Product product : nikeProducts) {
    %>
    <div>
        <h2><%= product.getName() %></h2>
        <p>Description: <%= product.getDes() %></p>
        <p>Price: <%= product.getPrice() %></p>
        <!-- Add more product information here -->
    </div>
    <%
        }
    %>
</body>
</html>
