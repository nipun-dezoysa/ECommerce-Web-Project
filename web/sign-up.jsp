<%-- 
    Document   : sign-up
    Created on : Mar 30, 2024, 7:53:11 AM
    Author     : samee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Welcome To SignUp</h1>
          <form action="SignUpServlet" method="post">
          Username: <input type="text" name="username"><br><br>
         Email: <input type="text" name="email"><br><hr>
         <input type="submit" name="create" value="Create">&nbsp;
         <input type="reset" name="clear" value="Clear">
    </form>
    </body>
</html>
