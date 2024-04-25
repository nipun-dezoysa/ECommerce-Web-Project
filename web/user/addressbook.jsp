<%-- 
    Document   : addressbook
    Created on : Apr 17, 2024, 9:34:00 AM
    Author     : Ravindu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Address Book</title>
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
                    <h2>My Account</h2>
                    <ul>
                        <li><a href="index.jsp"><i class="fa-solid fa-circle-user"></i>&nbsp;&nbsp;My Details</a></li>
                        <li><a class="active" href="addressbook.jsp"><i class="fa-solid fa-location-dot"></i>&nbsp;&nbsp;My Address Book</a></li>
                        <li><a href="order.jsp"><i class="fa-solid fa-bag-shopping"></i>&nbsp;&nbsp;My Orders</a></li>
                        <li><a href="accountsettings.jsp"><i class="fa-solid fa-gear"></i>&nbsp;&nbsp;Account Settings</a></li>
                    </ul>
                </div>

                <div class="w_box">
                    <h1>My Address Book</h1>
                    <div class="address_book">
                        <p class="gtext">You currently don't have any saved delivery addresses. Add an address here to be pre-filled for quicker checkout.</p>
                        <br>
                        <textarea name="add" id="" cols="50" rows="10"></textarea>
                        <br><br>
                        <p><input type="submit" class="btn" value="SAVE"></p>
                    </div>
                </div>

            </div>

            <jsp:include page="../WEB-INF/components/footer.jsp" />

        </div>
    </body>
</html>
