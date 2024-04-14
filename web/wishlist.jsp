<%@ page import="java.util.List" %>
<%@ page import="mainPackage.wishlist" %>
<%@ page import="mainPackage.Wishlist" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Wishlist</title>
    <jsp:include page="./WEB-INF/components/Imports.jsp" />
    <link rel="stylesheet" href="./css/wishlist.css" />
  </head>
  <body>
    <jsp:include page="./WEB-INF/components/nav.jsp" />

    <div class="max-container">
      <div class="wishlist-header">
        <h1>My Wishlist</h1>
        <hr />
      </div>
      <div class="wishlist-items">
    <% 
    List<Wishlist> userList = wishlist.getAllWishlist();
    for (Wishlist user : wishList) {
    %>          
          
        <div class="wishlist-item">
          <div class="product-image">
            <img src="./img/demo.jpg" alt="Product 1" />
          </div>
          <div class="product-details">
            <h2>User Name: <%= user.getUname() %></h2>
            <p>Price: $XX.XX</p>
            <button class="remove-button">Remove</button>
          </div>
        </div>

      </div>
    </div>
    <br /><br />
    <script src="./js/wishlist.js"></script>

    <jsp:include page="./WEB-INF/components/footer.jsp" />
  </body>
</html>
