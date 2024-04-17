<%-- 
    Document   : index
    Created on : Apr 16, 2024, 8:49:43 PM
    Author     : Ravindu
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Details</title>
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
                        <li><a class="active" href="index.jsp"><i class="fa-solid fa-circle-user"></i>&nbsp;&nbsp;My Details</a></li>
                        <li><a href="addressbook.jsp"><i class="fa-solid fa-location-dot"></i>&nbsp;&nbsp;My Address Book</a></li>
                        <li><a href="#"><i class="fa-solid fa-bag-shopping"></i>&nbsp;&nbsp;My Orders</a></li>
                        <li><a href="#"><i class="fa-solid fa-gear"></i>&nbsp;&nbsp;Account Settings</a></li>
                    </ul>
                </div>
                <div class="my_details">
                    <h1>My Details</h1>
                    <div class="personal_information">
                        <h2>Personal Information</h2>
                        <hr>
                        <br>
                        <div class="row">
                            <div class="column">
                                <p class="gtext">Feel free to edit any of your details so your account is up to date.</p>
                            </div>
                            <div class="column">
                                <p>First Name<br>
                                    <input type="text" class="txt">
                                </p>
                                <br>
                                <p>Birth Date<br>
                                    <input type="date" class="txt">
                                </p>
                                <br>
                                <p>Phone Number<br>
                                    <input type="number" class="txt"><br>
                                <p class="stxt">Keep 9-digit format with no spaces and dashes.</p>
                                </p>
                                <br>
                                <p><input type="submit" class="btn" value="SAVE"></p>
                            </div>
                            <div class="column">
                                <p>Last Name<br>
                                    <input type="text" class="txt">
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="email_address">
                        <h2>E-mail Address</h2>
                        <hr>
                        <br>
                        <div class="row">
                            <div class="column">
                                <p class="gtext">Feel free to edit any of your details so your account is up to date.</p>
                            </div>
                            <div class="column">
                                <p>Email Address<br>
                                    <input type="text" class="txt">
                                </p>
                                <br>
                                <p>Password<br>
                                    <input type="password" class="txt">
                                </p>
                                <br>
                                <p><input type="submit" class="btn" value="SAVE"></p>
                            </div>
                            <div class="column">
                            </div>
                        </div>
                    </div>

                    <div class="password">
                        <h2>Password</h2>
                        <hr>
                        <br>
                        <div class="row">
                            <div class="column">
                                <p class="gtext">Feel free to edit any of your details so your account is up to date.</p>
                            </div>
                            <div class="column">
                                <p>Current Password<br>
                                    <input type="password" class="txt">
                                </p>
                                <br>
                                <p>New Password<br>
                                    <input type="password" class="txt"><br>
                                <p class="stxt">Make sure your password is 8 characters long and contains letters and numbers.</p>
                                </p>
                                <br>
                                <p>Confirm Password<br>
                                    <input type="password" class="txt">
                                </p>
                                <br>
                                <p><input type="submit" class="btn" value="SAVE"></p>
                            </div>
                            <div class="column">
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <jsp:include page="../WEB-INF/components/footer.jsp" />

        </div>

    </body>
</html>
