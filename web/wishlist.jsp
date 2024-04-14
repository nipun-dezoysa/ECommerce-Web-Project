<%@page import="mainPackage.WishlistItem"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Wishlist</title>
    <link rel="stylesheet" type="text/css" href="wishlist.css">
</head>
<body>
    <div class="max-container">
        <div class="wishlist-header">
            <h1>My Wishlist</h1>
            <hr />
        </div>
        <div class="wishlist-items">
            <% 
                List<WishlistItem> wishlistItems = (List<WishlistItem>) request.getAttribute("wishlistItems");
                for (WishlistItem item : wishlistItems) { 
            %>
            <div class="wishlist-item">
                <div class="product-image">
                    <img src="img/<%= item.getImg() %>" alt="<%= item.getName() %>" />
                </div>
                <div class="product-details">
                    <h2><%= item.getName() %></h2>
                    <p>Price: $<%= item.getPrice() %></p>
                    <button class="remove-button">Remove</button>
                </div>
            </div>
            <% } %>
        </div>
    </div>
</body>
</html>
