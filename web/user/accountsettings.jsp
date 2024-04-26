<%-- 
    Document   : accountsettings
    Created on : Apr 25, 2024, 3:34:14 PM
    Author     : Ravindu
--%>
<%@page import="mainPackage.DatabaseLogIn, models.*, java.util.ArrayList" %>
<%
    if(session.getAttribute("user")==null){
        session.setAttribute("logreq", "./user/accountsettings.jsp");
        response.sendRedirect("../signin.jsp");
    }else{
        User user = (User)session.getAttribute("user"); 
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account Settings</title>
        <link rel="stylesheet" href="../css/userstyle.css" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.css"
              integrity="sha512-U9Y1sGB3sLIpZm3ePcrKbXVhXlnQNcuwGQJ2WjPjnp6XHqVTdgIlbaDzJXJIAuCTp3y22t+nhI4B88F/5ldjFA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <jsp:include page="../WEB-INF/components/Imports.jsp">
            <jsp:param name="path" value="../"/>
        </jsp:include>
    </head>
    <body>
            <jsp:include page="../WEB-INF/components/nav.jsp" >
                <jsp:param name="path" value="../"/>
            </jsp:include>   

            <div class="main-container wrapper">
                <div class="sidebar">
                    <h2>My Account</h2>
                    <ul>
                        <li><a href="index.jsp"><i class="fa-solid fa-circle-user"></i>&nbsp;&nbsp;My Details</a></li>
                        <li><a href="addressbook.jsp"><i class="fa-solid fa-location-dot"></i>&nbsp;&nbsp;My Address Book</a></li>
                        <li><a href="order.jsp"><i class="fa-solid fa-bag-shopping"></i>&nbsp;&nbsp;My Orders</a></li>
                        <li class="bg-[#405270] text-white"><div><i class="fa-solid fa-gear"></i>&nbsp;&nbsp;Account Settings</div></li>
                    </ul>
                </div>

                <div class="w_box">
                    <h1>Account Settings</h1>

                    <div class="logout">
                        <h2>Log Out</h2>
                        <hr>
                        <br>
                        <div class="row">
                            <div class="column">
                                <p class="gtext">Please note that after logging out, you will be directed to the main page.</p>
                            </div>
                            <div class="column">
                                <br>
                                <p><input type="submit" class="logoutss dbtn" value="LOGOUT"></p>
                            </div>
                        </div>
                    </div>

                    <div class="del_account">
                        <h2>Delete Account</h2>
                        <hr>
                        <br>
                        <div class="row">
                            <div class="column">
                                <p class="gtext">Please note that once you proceed with deleting your account, you cannot recover any data or information associated with it.</p>
                            </div>
                            <form id="delete" class="column">
                                <br>
                                <p>Password<br>
                                    <input type="password" name="password" class="txt">
                                </p>
                                <br>
                                <input type="hidden" name="id" value="<%= user.getEmail() %>"/>
                                <p><input type="submit" class="dbtn" value="DELETE"></p>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <jsp:include page="../WEB-INF/components/footer.jsp">
            <jsp:param name="path" value="../"/>
            </jsp:include> 
        
        <script>
    $(document).ready(function () {
      $("#delete").submit(function (e) {
          e.preventDefault();
          var formData = new FormData(this);
          Swal.fire({
            title: "Are you sure?",
            text: "Are you sure you want to delete your account?",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Yes, Delete it!"
          }).then((result) => {
            if (result.isConfirmed) {
              $.ajax({
              type: "POST",
              url: "../deleteUser",
              data: formData,
              processData: false,
              contentType: false,
              success: function (response) {
                  if(response=="ok")location.reload();
              },
              error: function (xhr, status, error) {
                console.error(xhr.responseText);
              },
              });
            }
          });
            
        });
    });
  </script>

    </body>
</html>
<%}%>