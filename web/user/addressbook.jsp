<%-- 
    Document   : addressbook
    Created on : Apr 17, 2024, 9:34:00 AM
    Author     : Ravindu
--%>
<%@page import="mainPackage.DatabaseLogIn, models.*, java.util.ArrayList" %>
<%
    if(session.getAttribute("user")==null){
        session.setAttribute("logreq", "./user/addressbook.jsp");
        response.sendRedirect("../signin.jsp");
    }else{
        User user = (User)session.getAttribute("user");
        DatabaseLogIn db = new DatabaseLogIn();  
        ArrayList<Address> address = db.getAddresses(user.getId()+"");
%>
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
            <jsp:include page="../WEB-INF/components/nav.jsp" >
                <jsp:param name="path" value="../"/>
            </jsp:include>

            <div class="main-container wrapper">
                <div class="sidebar">
                    <h2>My Account</h2>
                    <ul>
                        <li><a href="index.jsp"><i class="fa-solid fa-circle-user"></i>&nbsp;&nbsp;My Details</a></li>
                        <li class="bg-[#405270] text-white"><div><i class="fa-solid fa-location-dot"></i>&nbsp;&nbsp;My Address Book</div></li>
                        <li><a href="./orders/"><i class="fa-solid fa-bag-shopping"></i>&nbsp;&nbsp;My Orders</a></li>
                        <li><a href="accountsettings.jsp"><i class="fa-solid fa-gear"></i>&nbsp;&nbsp;Account Settings</a></li>
                    </ul>
                </div>

                <div class="w_box">
                    <h1>My Address Book</h1>
                    <div class="address_book flex flex-col gap-3">
                        <%
                            if(address.size()==0){
                        %>
                        <p class="gtext">You currently don't have any saved delivery addresses. Add an address in place-order page to be pre-filled for quicker checkout.</p>
                        <%
                            }else{
                                for(Address ads : address){
                        %>
                        <div class="flex border rounded-lg px-5 py-2 relative justify-between">
                            <div class="w-[20%]">
                              <div class="text-gray-400">Name</div>
                              <div><%= ads.getFname()+" "+ads.getLname() %></div>
                            </div>
                            <div class="w-[20%]">
                              <div class="text-gray-400">Email</div>
                              <div><%= ads.getEmail() %></div>
                            </div>
                            <div class="w-[20%]">
                              <div class="text-gray-400">Phone</div>
                              <div><%= ads.getPhone() %></div>
                            </div>
                            <div class="w-[40%]">
                              <div class="text-gray-400 ">Address</div>
                              <div><%= ads.getFullAddress() %></div>
                            </div>
                            <form class="addr absolute top-[-12px] right-[-10px] text-2xl hover:text-red-600" action="#">
                                <input type="hidden" name="id" value="<%= ads.getId() %>"/>
                                <button type="submit"><i class="fa-solid fa-circle-xmark"></i></button>
                            </form>
                        </div>
                        <%}}%>
                    </div>
                </div>

            </div>

            <jsp:include page="../WEB-INF/components/footer.jsp" >
            <jsp:param name="path" value="../"/>
            </jsp:include> 
            
            <script src="./js/addressBook.js"></script>
            
    </body>
</html>
<% db.closeDb(); %>
<%}%>