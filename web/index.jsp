<!DOCTYPE html>
<html>
  <head>
    <title>Shoetopia</title>
    <jsp:include page="./WEB-INF/components/Imports.jsp" />
  </head>
  <body>
    <jsp:include page="./WEB-INF/components/nav.jsp" />

    <!-- content starts here-->
    <jsp:include page="./WEB-INF/components/hero.jsp" />
    
    <jsp:include page="./WEB-INF/components/showcase.jsp">
      <jsp:param name="title" value="New Arrivals" />
      <jsp:param name="link" value="./products.jsp" />
      <jsp:param name="specific" value="" />
    </jsp:include>

    <jsp:include page="./WEB-INF/components/heroSecond.jsp" />
    <jsp:include page="./WEB-INF/components/saleCountdown.jsp" />
   

    <jsp:include page="./WEB-INF/components/showcase.jsp">
      <jsp:param name="title" value="NIKE" />
      <jsp:param name="link" value="./products.jsp?brand=Nike" />
      <jsp:param name="specific" value="WHERE brand = 'nike'" />
    </jsp:include>

    <jsp:include page="./WEB-INF/components/showcase.jsp">
      <jsp:param name="title" value="Adidas" />
      <jsp:param name="link" value="./products.jsp?brand=Adidas" />
      <jsp:param name="specific" value="WHERE brand = 'adidas'" />
    </jsp:include>
     
    <jsp:include page="./WEB-INF/components/collection.jsp" />
    
    <jsp:include page="./WEB-INF/components/showcase.jsp">
      <jsp:param name="title" value="Men's Shoes" />
      <jsp:param name="link" value="./products.jsp?category=mens" />
      <jsp:param name="specific" value="WHERE type=1" />
    </jsp:include>
     
    <jsp:include page="./WEB-INF/components/showcase.jsp">
      <jsp:param name="title" value="Women's Shoes" />
      <jsp:param name="link" value="./products.jsp?category=womens" />
      <jsp:param name="specific" value="WHERE type=2" />
    </jsp:include>
     
    <jsp:include page="./WEB-INF/components/showcase.jsp">
      <jsp:param name="title" value="Kid's Shoes" />
      <jsp:param name="link" value="./products.jsp?category=kids" />
      <jsp:param name="specific" value="WHERE type=3" />
    </jsp:include>

    <!-- contents end here -->
   
    <jsp:include page="./WEB-INF/components/footer.jsp" />
    
    <script src="js/wishlist.js"></script>
    
  </body>
</html>
