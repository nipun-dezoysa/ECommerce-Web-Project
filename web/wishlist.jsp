<!DOCTYPE html>
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
          
          
        <div class="wishlist-item">
          <div class="product-image">
            <img src="./img/demo.jpg" alt="Product 1" />
          </div>
          <div class="product-details">
            <h2>Product Name 1</h2>
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
