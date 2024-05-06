<%@page import="mainPackage.Tools"%>
<%@page import="mainPackage.DatabaseLogIn, models.*, java.util.ArrayList" %>
<%
    if(session.getAttribute("user")==null){
        session.setAttribute("logreq", "./user/orders/");
        response.sendRedirect("../../signin.jsp");
    }else{
        User user = (User)session.getAttribute("user");
        DatabaseLogIn db = new DatabaseLogIn();
        ArrayList<Order> orders = Tools.filterOrders(db.getOrders(0, user.getId()+""), request.getParameter("type"));
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Orders</title>
        <link rel="stylesheet" href="../../css/userstyle.css" type="text/css"/>
        <jsp:include page="../../WEB-INF/components/Imports.jsp">
            <jsp:param name="path" value="../../"/>
        </jsp:include>
    </head>
    <body>
            <jsp:include page="../../WEB-INF/components/nav.jsp" >
                <jsp:param name="path" value="../../"/>
            </jsp:include>

            <div class="main-container wrapper">
                <div class="sidebar">
                    <h2>My Orders</h2>
                    <ul>
                        <li><a href="../index.jsp"><i class="fa-solid fa-circle-user"></i>&nbsp;&nbsp;My Details</a></li>
                        <li><a href="../addressbook.jsp"><i class="fa-solid fa-location-dot"></i>&nbsp;&nbsp;My Address Book</a></li>
                        <li class="bg-[#405270] text-white"><div><i class="fa-solid fa-bag-shopping"></i>&nbsp;&nbsp;My Orders</div></li>
                        <li><a href="../accountsettings.jsp"><i class="fa-solid fa-gear"></i>&nbsp;&nbsp;Account Settings</a></li>
                    </ul>
                </div>

                <div class="w_box">
                    <h1>My Orders</h1>
                    <br>
                    <div class="orders">
                        <div class="ordernav">
                            <%
                                int st = 8;
                                String type = request.getParameter("type");
                                if(type != null){
                                if(type.equals("toship")) st=2;
                                else if(type.equals("toreceive")) st=3;
                                else if(type.equals("delivered")) st=4;
                                }
                            %>
                            <a class="<%= st==8 ? "active" : "" %>" href="./index.jsp">All</a>
                            <a class="<%= st==2 ? "active" : "" %>" href="./index.jsp?type=toship">To Ship</a>
                            <a class="<%= st==3 ? "active" : "" %>" href="./index.jsp?type=toreceive">To Receive</a>
                            <a class="<%= st==4 ? "active" : "" %>" href="./index.jsp?type=delivered">Delivered</a>
                        </div>
                        <hr>
                        <div class="flex flex-col gap-2 mt-3">
                            
                            <% for(Order order : orders){%>
                            
                            <div
                              class="border border-gray-300 rounded-lg overflow-hidden flex flex-col items-start"
                            >
                              <div class="py-2 px-5 bg-gray-100 border-b flex gap-10 w-full">
                                <div class="font-semibold">
                                  <div class="text-gray-400">Order Placed</div>
                                  <div><%= order.getDate() %></div>
                                </div>
                                <div class="font-semibold">
                                  <div class="text-gray-400">Total</div>
                                  <div>LKR <%= order.getFTotal() %></div>
                                </div>
                                <div class="font-semibold ml-auto flex flex-col items-end">
                                  <div class="text-gray-400">Order #<%=order.getId() %></div>
                                  <a
                                    href="./order.jsp?id=<%=order.getId() %>"
                                    class="underline text-primaryLight hover:text-primary"
                                    >View order details</a
                                  >
                                </div>
                              </div>
                              <%
                                  String[] colors = Tools.getOrderColorUser(order);
                              %>
                              <div
                                class="mx-5 my-2 px-2 rounded-full <%= colors[0] %>"
                              >
                                <%= colors[1] %>
                              </div>
                              <div class="py-2 px-5 flex flex-col w-full gap-2">
                                  
                                <%
                                    for(int i=0;i<order.getItems().size();i++){
                                       OrderItem item = order.getItems().get(i);
                                       Product pr = db.getProduct(item.getPid()+"");
                                       String iconclass = "regular";
                                       if(db.isExistWishlist(user.getId(), item.getPid())) iconclass = "solid";
                                %>
                                <div class="flex justify-between items-center">
                                  <div class="flex gap-5 w-[40%]">
                                    <div
                                      class="w-[100px] h-[100px] bg-gray-300 rounded-lg overflow-hidden flex items-center justify-center"
                                    >
                                    <img class="w-full h-auto" src="../../img/products/<%= pr.getImg1() %>" alt="">
                                  </div>
                                    <div class="flex flex-col justify-evenly">
                                      <div class="font-semibold"><%= item.getName() %></div>
                                      <div class="text-gray-400">Size: <%= item.getSize() %></div>
                                      <div class="text-gray-400">Color: <%= item.getColor() %></div>
                                    </div>
                                  </div>
                                  <div class="text-gray-400 w-[20%]">Price: LKR <%= item.getformatPrice() %></div>
                                  <div class="text-gray-400 w-[10%]">Qt: <%= item.getQuantity() %></div>
                                  <div class="flex flex-col gap-2 text-sm">
                                      <form class="wforms">
                                          <input type="hidden" name="id" value="<%= item.getPid() %>"/>
                                          <button type="submit" class="bg-primary text-white text-center rounded-full py-2 px-4 hover:bg-primaryLight duration-300">
                                              <i class="fa-<%= iconclass%> fa-heart group-hover:mb-2 duration-300 ease-in-out picon<%= item.getPid() %>"></i>
                                              Add to wishlist
                                          </button>
                                      </form>
                                      
                                      <a class="bg-primary text-white text-center rounded-full py-2 px-4 hover:bg-primaryLight duration-300" href="../../product.jsp?id=<%= item.getPid() %>">Buy now</a>
                                  </div>
                                </div>
                                <%if(i+1<order.getItems().size()){%>
                                <hr>
                                <%}}%>
                                
                              </div>
                            </div>
                            <% } 
                               if(orders.size()==0){
                            %>
                            <div class="text-center text-gray-400 pt-2 text-lg">There is no orders.</div>
                            <%}%>
                        </div>
                    </div>
                </div>

            </div>

            <jsp:include page="../../WEB-INF/components/footer.jsp" >
            <jsp:param name="path" value="../../"/>
            </jsp:include> 

                            
            <script src="./js/wishlist.js"></script>                
                            
    </body>
</html>
<% db.closeDb(); %>
<%}%>