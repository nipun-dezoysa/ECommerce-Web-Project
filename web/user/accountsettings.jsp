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
                        <li><a href="./orders/"><i class="fa-solid fa-bag-shopping"></i>&nbsp;&nbsp;My Orders</a></li>
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
                                <p><input type="submit" class="logoutss dbtn bg-[#717171]" value="LOGOUT"></p>
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
                                <p><input type="submit" class="dbtn bg-[#717171]" value="DELETE"></p>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <jsp:include page="../WEB-INF/components/footer.jsp">
            <jsp:param name="path" value="../"/>
            </jsp:include> 
        
        <script src="./js/settings.js"></script>

    </body>
</html>
<%}%>