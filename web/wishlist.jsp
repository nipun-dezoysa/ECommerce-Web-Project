<%@page import="mainPackage.DatabaseLogIn, models.*, java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if(session.getAttribute("user")==null){
        session.setAttribute("logreq", "./wishlist.jsp");
        response.sendRedirect("./signin.jsp");
    }else{
        DatabaseLogIn db = new DatabaseLogIn();
        User user = (User)session.getAttribute("user");
        ArrayList<Product> wishlistItems = db.getWishlist(user.getId());
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Wishlist</title>
   <link rel="stylesheet" type="text/css" href="css/wishlist.css">
   <jsp:include page="./WEB-INF/components/Imports.jsp" />
</head>
<body>
    <jsp:include page="./WEB-INF/components/nav.jsp" />
    <div class="max-container">
        <div class="wishlist-header">
            <h1>My Wishlist</h1>
            <hr />
        </div>
        <!-- Display total number of items -->
        <div class="wishlist-summary">
            <div class="md:text-lg font-semibold"><%= wishlistItems.size() %> Items in Your Wishlist</div>
        </div><br>
        <div class="wishlist-items">
            <% 
                
                for (Product item : wishlistItems) { 
            %>
            <div class="wishlist-item">
                <div class="product-image">
                    <img src="./img/<%= item.getImg1() %>" alt="<%= item.getName() %>" />
                </div>
                <div class=" product-details">
                    <div class="flex justify-between items-center mt-0 p-1">
                    <div class="text-left max-md:text-sm font-semibold font-mono mt-1"><%= item.getName() %>
                        <div class="md:text-lg font-semibold">Price: $<%= item.getPrice() %></div></div>
                    <form action="WishlistServlet" method="post">
                        <input type="hidden" name="id" value="<%= item.getId() %>">
                        <button class="w-10 h-10 flex justify-center items-center p-2 rounded-full  text-black group cursor-pointer hover:bg-gray-100  duration-300 ease-in-out"
                        type="submit" name="action" value="remove">
                         <i class="fa-regular fa-heart group-hover:text-black group-hover:mb-2 duration-300 ease-in-out"></i>
                        </button>
                    </form>
                </div>
                        
                       
              </div>
            </div>
                        
            <% } %>
        </div>
    </div>
    <br><br>
    <jsp:include page="./WEB-INF/components/footer.jsp" />
     
</body>
</html>
<% } %>