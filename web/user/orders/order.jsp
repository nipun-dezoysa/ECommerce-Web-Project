<%@page import="mainPackage.Tools"%>
<%@page import="mainPackage.DatabaseLogIn, models.*, java.util.ArrayList" %>
<%  String id = request.getParameter("id");
    if(session.getAttribute("user")==null){
        session.setAttribute("logreq", "./user/orders/order.jsp?id="+id);
        response.sendRedirect("../../signin.jsp");
    }else if(id==null)response.sendRedirect("./index.jsp");
    else{
        User user = (User)session.getAttribute("user");
        DatabaseLogIn db = new DatabaseLogIn();
        Order order = db.getOrder(Integer.parseInt(id));
        if(order==null || order.getUser().getId()!=user.getId()){
            response.sendRedirect("./index.jsp"); 
        }else{
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
                        <li class="bg-[#405270] text-white"><a href="../orders/"><i class="fa-solid fa-bag-shopping"></i>&nbsp;&nbsp;My Orders</a></li>
                        <li><a href="../accountsettings.jsp"><i class="fa-solid fa-gear"></i>&nbsp;&nbsp;Account Settings</a></li>
                    </ul>
                </div>

                <div class="w_box">
                    <h1 class="font-semibold text-xl">
                      Order Details #<%=order.getId() %>
                      <%
                        String[] colors = Tools.getOrderColorUser(order);
                      %>
                      <span class="<%= colors[0] %> text-sm px-2 rounded-full"
                        ><%= colors[1] %></span
                      >
                    </h1>

                    <div class="flex w-full gap-2 justify-between">
                      <div class="w-[65%]">
                        <!-- Stepper -->
                        <ul class="relative flex flex-col md:flex-row gap-2 w-full p-10">
                            
                          <%
                              ArrayList<Stepper> st = order.getStepper();
                              for(int i=0;i<st.size();i++){
                          %>  
                          <!-- Item -->
                          <li
                            class="md:shrink md:basis-0 flex-1 group flex gap-x-2 md:block"
                          >
                            <div
                              class="min-w-7 min-h-7 flex flex-col items-center md:w-full md:inline-flex md:flex-wrap md:flex-row text-xs align-middle"
                            >
                              <span
                                class="size-7 flex justify-center items-center flex-shrink-0 bg-<%= st.get(i).getColor() %>-200 font-medium text-<%= st.get(i).getColor() %>-600 rounded-full"
                              >
                                  <i class="fa-solid <%= st.get(i).getIcon() %>"></i>
                              </span>
                              <div
                                  class="mt-2 w-[2px] h-full md:mt-0 md:ms-2 md:w-full md:h-[2px] md:flex-1 bg-<%= i+1==st.size()? "gray" : st.get(i+1).getColor() %>-200 group-last:hidden"
                              ></div>
                            </div>
                            <div class="grow md:grow-0 md:mt-3 pb-5">
                                <span class="block text-sm font-medium text-<%= st.get(i).getColor() %>-500">
                                  <%= st.get(i).getPlace() %>
                              </span>
                                  <p class="text-sm text-<%= st.get(i).getColor() %>-500"><%= st.get(i).getDate() %></p>
                            </div>
                          </li>
                          <!-- End Item -->
                          <%}%>
                        </ul>
                        <!-- End Stepper -->

                        <div class="font-semibold">Items</div>
                        <div class="py-2 flex flex-col w-full gap-2">
                            <%
                                for(int i=0;i<order.getItems().size();i++){
                                    OrderItem item = order.getItems().get(i);
                                    Product pr = db.getProduct(item.getPid()+"");
                            %>
                            <div class="flex justify-between items-center mt-2 mb-5">
                                <a class="flex gap-2 w-[40%]" href="../../product.jsp?id=<%= item.getPid() %>">
                                  <div
                                    class="w-[100px] h-[100px] bg-gray-300 rounded-lg overflow-hidden flex items-center justify-center"
                                  >
                                    <img
                                      class="w-full h-auto"
                                      src="../../img/products/<%= pr.getImg1() %>"
                                      alt=""
                                    />
                                  </div>
                                  <div class="flex flex-col justify-evenly">
                                      <div class="font-semibold"><%= item.getName() %></div>
                                      <div class="text-gray-400">Size: <%= item.getSize() %></div>
                                      <div class="text-gray-400">Color: <%= item.getColor() %></div>
                                  </div>
                                </a>
                                <div class="text-gray-400 w-[30%] flex flex-col">
                                  <div>Price: LKR <%= item.getformatPrice() %></div>
                                  <div>Discount: <%= item.getDiscount() %>%</div>
                                  <div>Qt: <%= item.getQuantity() %></div>
                                </div>
                                <div class="flex flex-col gap-2 text-end text-lg">
                                  LKR <%= item.getformatTotal() %>
                                </div>
                            </div>
                            <%if(i+1<order.getItems().size()){%>
                                <hr>
                                <%}}%>
                        </div>
                        
                        <% if(order.getStatus()<3){ %>
                        <div class="font-semibold">Cancel the order</div>
                        <form class="formss" class="flex gap-2">
                          <div class="text-gray-400">
                            Please be aware that you can cancel your order before it is
                            shipped. Once canceled, this action cannot be reversed.
                          </div>
                          <input type="hidden" name="id" value="<%= order.getId() %>"/>
                          <input type="hidden" name="status" value="5"/>
                          <button type="submit" class="dbtn bg-[#717171]">Cancel</button>
                        </form>
                        <% } %>
                        
                      </div>
                      <div class="w-[30%] flex flex-col gap-5">
                        <div class="flex flex-col gap-1">
                          <div class="font-semibold">Order info</div>
                          <div class="flex text-sm text-gray-400">
                            <div class="w-[35%] font-semibold">Time Placed</div>
                            <div class="w-[75%]"><%= order.getDate()+" at "+order.getTime() %></div>
                          </div>
                          <div class="flex text-sm text-gray-400">
                            <div class="w-[35%] font-semibold">Order number</div>
                            <div class="w-[75%]">#<%= order.getId() %></div>
                          </div>
                          <div class="flex text-sm text-gray-400">
                            <div class="w-[35%] font-semibold">Sub total</div>
                            <div class="w-[75%]">LKR <%= order.getTotal() %></div>
                          </div>
                          <div class="flex text-sm text-gray-400">
                            <div class="w-[35%] font-semibold">Delivary fee</div>
                            <div class="w-[75%]">LKR 30.00</div>
                          </div>
                          <div class="flex text-sm text-gray-400">
                            <div class="w-[35%] font-semibold">Total</div>
                            <div class="w-[75%]">LKR <%= order.getFTotal() %></div>
                          </div>
                        </div>

                        <div class="flex flex-col gap-1">
                          <div class="font-semibold">Shipping details</div>
                          <div class="flex text-sm text-gray-400">
                            <div class="w-[35%] font-semibold">Name</div>
                            <div class="w-[75%]"><%= order.getName() %></div>
                          </div>
                          <div class="flex text-sm text-gray-400">
                            <div class="w-[35%] font-semibold">Email</div>
                            <div class="w-[75%]"><%= order.getEmail() %></div>
                          </div>
                          <div class="flex text-sm text-gray-400">
                            <div class="w-[35%] font-semibold">Phone</div>
                            <div class="w-[75%]"><%= order.getPhone() %></div>
                          </div>
                          <div class="flex text-sm text-gray-400">
                            <div class="w-[35%] font-semibold">Address</div>
                            <div class="w-[75%]"><%= order.getAddress() %></div>
                          </div>
                        </div>
                      </div>
                    </div>
                </div>

            </div>

            <jsp:include page="../../WEB-INF/components/footer.jsp" >
            <jsp:param name="path" value="../../"/>
            </jsp:include> 
                          
            <script src="./js/userOrder.js"></script>
                                       
    </body>
</html>
<% db.closeDb(); %>
<%}}%>