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
    <div class="main-container">
        <div class="wishlist-header">
            <h1>My Wishlist</h1>
            <hr />
        </div>
        <!-- Display total number of items -->
        <div class="wishlist-summary">
            <h3><span id="count"><%= wishlistItems.size() %></span> Items in Your Wishlist</h3>

        </div><br>
        <div class="flex gap-5 flex-wrap">
            <% 
                
                for (Product item : wishlistItems) { 
            %>
            
            <jsp:include page="./WEB-INF/components/productCard.jsp">
                <jsp:param name="id" value="<%= item.getId()%>" />
            </jsp:include>
                        
            <% } %>
        </div>
    </div>
    <br><br>
    <jsp:include page="./WEB-INF/components/footer.jsp" />
    
    <script src="./js/wishlistMain.js"></script>
     
</body>
</html>
<% db.closeDb(); } %>