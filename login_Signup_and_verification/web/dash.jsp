<%-- 
    Document   : dash
    Created on : Mar 29, 2024, 9:40:36 AM
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
        <% String name = (String)request.getAttribute("uname"); %>
        <h1>Hello Wellcome <%=name%></h1>
    </body>
</html>
