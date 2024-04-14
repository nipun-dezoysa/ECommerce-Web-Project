<%-- 
    Document   : index
    Created on : Apr 2, 2024, 12:27:13 PM
    Author     : Nipun
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="../WEB-INF/components/Imports.jsp">
            <jsp:param name="path" value="../"/>
        </jsp:include>
  </head>
  <body>
    <div class="frameBox">
      <jsp:include page="../WEB-INF/components/nav.jsp" >
        <jsp:param name="path" value="../"/>
      </jsp:include>
        
    <jsp:include page="../WEB-INF/components/notfound.jsp" />    
        
    <jsp:include page="../WEB-INF/components/footer.jsp" />
    
     
    </div>
  </body>
</html>
