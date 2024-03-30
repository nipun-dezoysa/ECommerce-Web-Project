<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Sign up</title>

  <jsp:include page="nav.jsp" />

    <h1>Welcome To SignUp</h1>
    <form action="SignUpServlet" method="post">
      Username: <input type="text" name="username" /><br /><br />
      Email: <input type="text" name="email" /><br />
      <hr />
      <input type="submit" name="create" value="Create" />&nbsp;
      <input type="reset" name="clear" value="Clear" />
    </form>
    
  <jsp:include page="footer.jsp" />
