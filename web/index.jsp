<!DOCTYPE html>
<html>
  <head>
    <title>Shoetopia</title>
    <jsp:include page="./WEB-INF/components/Imports.jsp" />
  </head>
  <body>
    <jsp:include page="./WEB-INF/components/nav.jsp" />

    <!-- updated-->

    <jsp:include page="./WEB-INF/components/hero.jsp" />

    <jsp:include page="./WEB-INF/components/showcase.jsp">
      <jsp:param name="title" value="New Arrivals" />
    </jsp:include>

    <jsp:include page="./WEB-INF/components/saleCountdown.jsp" />

    <jsp:include page="./WEB-INF/components/showcase.jsp">
      <jsp:param name="title" value="NIKE" />
    </jsp:include>

    <jsp:include page="./WEB-INF/components/showcase.jsp">
      <jsp:param name="title" value="POLGAHA SEREPPU" />
    </jsp:include>

    <!-- contents end here -->
    <jsp:include page="./WEB-INF/components/footer.jsp" />
  </body>
</html>
