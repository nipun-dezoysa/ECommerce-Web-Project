<%-- 
    Document   : order
    Created on : Apr 17, 2024, 4:49:51 PM
    Author     : Ravindu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Orders</title>
        <link rel="stylesheet" href="../css/userstyle.css" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.css"
              integrity="sha512-U9Y1sGB3sLIpZm3ePcrKbXVhXlnQNcuwGQJ2WjPjnp6XHqVTdgIlbaDzJXJIAuCTp3y22t+nhI4B88F/5ldjFA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <jsp:include page="../WEB-INF/components/Imports.jsp">
            <jsp:param name="path" value="../"/>
        </jsp:include>
    </head>
    <body>
        <div class="frameBox">
            <jsp:include page="../WEB-INF/components/nav.jsp" >
                <jsp:param name="path" value="../"/>
            </jsp:include>

            <div class="main-container wrapper">
                <div class="sidebar">
                    <h2>My Orders</h2>
                    <ul>
                        <li><a href="index.jsp"><i class="fa-solid fa-circle-user"></i>&nbsp;&nbsp;My Details</a></li>
                        <li><a href="addressbook.jsp"><i class="fa-solid fa-location-dot"></i>&nbsp;&nbsp;My Address Book</a></li>
                        <li><a class="active" href="order.jsp"><i class="fa-solid fa-bag-shopping"></i>&nbsp;&nbsp;My Orders</a></li>
                        <li><a href="accountsettings.jsp"><i class="fa-solid fa-gear"></i>&nbsp;&nbsp;Account Settings</a></li>
                    </ul>
                </div>

                <div class="w_box">
                    <h1>My Orders</h1>
                    <br>
                    <div class="orders">
                        <div class="ordernav">
                            <a class="active" href="#">All</a>
                            <a href="#">To Pay</a>
                            <a href="#">To Ship</a>
                            <a href="#">To Receive</a>
                        </div>
                        <hr>
                    </div>
                </div>

            </div>

            <jsp:include page="../WEB-INF/components/footer.jsp" />

        </div>
    </body>
</html>