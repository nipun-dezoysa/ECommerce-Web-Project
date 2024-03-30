<%-- 
    Document   : singup
    Created on : Mar 29, 2024, 8:25:16 PM
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
        <div style="text-align:center;">
        <h1>Sign Up </h1>
        <form action="signup" method="POST">
            username -
            <input type="text" name="uname" value="" /><br><br>
            Password -
            <input type="text" name="passwd" value="" /><br><br>
            
            <input type="submit" value="Create" /> &nbsp; &nbsp; <input type="reset" value="Clear" />
        </form>
        <a href="index.html"> Back to log in ?</a>
        </div>
    </body>
</html>
