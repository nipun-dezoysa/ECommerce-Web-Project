<%-- 
    Document   : user
    Created on : Apr 1, 2024, 7:43:38 PM
    Author     : sanjeewa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% String name = (String)session.getAttribute("email"); %>
        <h1>Hello Wellcome <%=name%></h1>
    </body>
</html>
