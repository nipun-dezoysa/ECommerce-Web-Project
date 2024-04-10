<% String admin = (String)session.getAttribute("admin"); if(admin == null){ %>

<jsp:include page="../WEB-INF/components/adminLogin.jsp" />

<%}else{%> <%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <title>Admin Dashboard</title>
    <jsp:include page="../WEB-INF/components/adminImports.jsp">
      <jsp:param name="path" value="" />
    </jsp:include>
  </head>
  <body>
    <jsp:include page="../WEB-INF/components/adminHead.jsp">
      <jsp:param name="path" value="" />
    </jsp:include>

    <jsp:include page="../WEB-INF/components/adminBottom.jsp" />
  </body>
</html>

<% } %>
