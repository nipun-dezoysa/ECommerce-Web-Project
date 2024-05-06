<% String admin = (String)session.getAttribute("admin"); 
    if(admin == null){
%>

<jsp:include page="../../WEB-INF/components/adminLogin.jsp"/>
<%}else{%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="mainPackage.DatabaseLogIn, models.*, java.util.ArrayList" %> 
<% 
    String id = request.getParameter("id"); 
if(id==null){
    response.sendRedirect("./index.jsp"); 
}else{ 
    DatabaseLogIn db = new DatabaseLogIn(); 
    User user = db.getUser(id);
    if(user==null){
        response.sendRedirect("./index.jsp"); 
    }else{
%>
<!DOCTYPE html>
<html>
  <head>
    <title>Customer</title>
    <jsp:include page="../../WEB-INF/components/adminImports.jsp">
      <jsp:param name="path" value="../" />
    </jsp:include>
    <style type="text/tailwindcss">
      @layer utilities {
        .list-header {
          @apply flex justify-between text-center font-semibold text-sm;
        }
        .list-item {
          @apply flex items-center  border rounded-lg py-2 text-center text-xs lg:text-sm hover:bg-gray-200 duration-300 ease-in-out;
        }
        .item-width {
          @apply w-[20%];
        }
      }
    </style>
  </head>
  <body>
    <jsp:include page="../../WEB-INF/components/adminHead.jsp">
      <jsp:param name="path" value="../" />
      <jsp:param name="no" value="4" />
    </jsp:include>

    <nav class="flex" aria-label="Breadcrumb">
      <ol
        class="inline-flex items-center space-x-1 md:space-x-2 rtl:space-x-reverse"
      >
        <li class="inline-flex items-center">
          <a
            href="../"
            class="inline-flex items-center text-sm font-medium text-gray-700 hover:text-blue-600 dark:text-gray-400 dark:hover:text-white"
          >
            <svg
              class="w-3 h-3 me-2.5"
              aria-hidden="true"
              xmlns="http://www.w3.org/2000/svg"
              fill="currentColor"
              viewBox="0 0 20 20"
            >
              <path
                d="m19.707 9.293-2-2-7-7a1 1 0 0 0-1.414 0l-7 7-2 2a1 1 0 0 0 1.414 1.414L2 10.414V18a2 2 0 0 0 2 2h3a1 1 0 0 0 1-1v-4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v4a1 1 0 0 0 1 1h3a2 2 0 0 0 2-2v-7.586l.293.293a1 1 0 0 0 1.414-1.414Z"
              />
            </svg>
            Dashboard
          </a>
        </li>
        <li>
          <div class="flex items-center">
            <svg
              class="rtl:rotate-180 w-3 h-3 text-gray-400 mx-1"
              aria-hidden="true"
              xmlns="http://www.w3.org/2000/svg"
              fill="none"
              viewBox="0 0 6 10"
            >
              <path
                stroke="currentColor"
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="m1 9 4-4-4-4"
              />
            </svg>
            <a
              href="./"
              class="ms-1 text-sm font-medium text-gray-700 hover:text-blue-600 md:ms-2 dark:text-gray-400 dark:hover:text-white"
              >Customers</a
            >
          </div>
        </li>
        <li aria-current="page">
          <div class="flex items-center">
            <svg
              class="rtl:rotate-180 w-3 h-3 text-gray-400 mx-1"
              aria-hidden="true"
              xmlns="http://www.w3.org/2000/svg"
              fill="none"
              viewBox="0 0 6 10"
            >
              <path
                stroke="currentColor"
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="m1 9 4-4-4-4"
              />
            </svg>
            <span
              class="ms-1 text-sm font-medium text-gray-500 md:ms-2 dark:text-gray-400"
              >#<%= id%></span
            >
          </div>
        </li>
      </ol>
    </nav>

    <div class="flex flex-col lg:flex-row gap-5">
      <div class="lg:w-[40%] flex flex-col gap-5">
        <div class="box">
          <div class="py-2 px-5 border-b flex justify-between bg-gray-100">
            <div class="font-bold text-xl font-mono text-gray-600">
              Customer Details<span class="text-gray-400">#<%= id%></span>
            </div>
            <div class="flex items-center gap-2">
              <% if(user.getStatus()==1){ %>
              <span class="flex w-3 h-3 bg-green-500 rounded-full"></span>Active
              <%}else{%>
              <span class="flex w-3 h-3 bg-red-500 rounded-full"></span>Blocked
              <%}%>
            </div>
          </div>
          <div class="p-5 flex">
            <div class="flex flex-col gap-3 mr-5">
              <div class="flex gap-10">
                <div>
                  <div class="text-gray-400 font-semibold">First Name</div>
                  <div><%= (user.getFname()==null)? "not provided" : user.getFname() %></div>
                </div>
                <div>
                  <div class="text-gray-400 font-semibold">Last Name</div>
                  <div><%= (user.getLname()==null)? "not provided" : user.getLname() %></div>
                </div>
              </div>
              <div>
                <div class="text-gray-400 font-semibold">Email</div>
                <div><%= user.getEmail() %></div>
              </div>
              <div>
                <div class="text-gray-400 font-semibold">Birth Date</div>
                <div><%= (user.getBday()==null)? "not provided" : user.getBday() %></div>
              </div>
            </div>
            <div class="pl-5 border-l flex flex-col gap-3">
              <div>
                <div class="text-gray-400 font-semibold">Phone Number</div>
                <div><%= (user.getPno()==null)? "not provided" : user.getPno() %></div>
              </div>
              <div>
                <div class="text-gray-400 font-semibold">Last Login</div>
                <div><%= user.getLogDateTime() %></div>
              </div>
              <div>
                <div class="text-gray-400 font-semibold">Registered Date</div>
                <div><%= user.getRegDateTime() %></div>
              </div>
            </div>
          </div>
        </div>
        <div class="bg-white p-5 rounded-lg text-sm flex flex-col gap-2">
          <div class="flex justify-between">
            <div class="text-gray-400">
              Reset customer account password to default password.
            </div>
            <form action="#" class="reset">
               <input type="hidden" name="id" value="<%= user.getId() %>">
               <button class="normal flex gap-2 items-center"><i class="fa-solid fa-lock-open"></i><div>Reset</div></button>
            </form>  
          </div>
          <div class="flex justify-between">
            <div class="text-gray-400">Block customer account.</div>
            <form action="#" class="block">
                    <input type="hidden" name="id" value="<%= user.getId() %>">
                    <% if(user.getStatus()==1){ %>
                    <button class="remove flex gap-2 items-center"><i class="fa-solid fa-user-xmark"></i><div>Block</div></button>
                    <%}else{%>
                    <button class="normal flex gap-2 items-center"><i class="fa-solid fa-user-plus"></i><div>Unblock</div></button>
                    <%}%>
                  </form>
          </div>
        </div>
        <div class="box">
          <div class="box-title">Most Viewed</div>
          <div class="box-body">
            <%
                ArrayList<Product> viewed = db.getUserViewed(user.getId()+"");
                int no=0;
                for(Product a : viewed){
                no++;
            %>
            <div class="flex gap-3 font-semibold text-gray-400">
              <div><%=no%>.</div>
              <img
                src="../../img/products/<%= a.getImg1() %>"
                class="w-[100px] rounded-lg aspect-square"
                alt=""
              />
              <div>
                <div><%= a.getName() %></div>
                <div>#<%= a.getId() %></div>
                <div>
                  LKR <%= a.getformatPrice() %>
                  <span class="bg-green-200 rounded-full px-2 text-green-400"
                    ><%= a.getDiscount() %>%</span
                  >
                </div>
                <div>View Count <span class="text-gray-600"><%= a.getViewCount() %></span></div>
              </div>
            </div>
            <%}%>
          </div>
        </div>
      </div>
      <div class="lg:w-[60%] flex flex-col gap-5">
        <div class="box">
          <div class="box-title">Orders</div>
          <div class="box-body">
            <div class="list-header">
              <div class="item-width">Date</div>
              <div class="item-width max-sm:hidden">Time</div>
              <div class="item-width">No of items</div>
              <div class="item-width">Amount</div>
              <div class="item-width">Status</div>
            </div>
            <%
                ArrayList<Order> orders = db.getOrders(0, id);
                if(orders.size()>0){
                for(Order order : orders){
                String c="";
                  String stt = "";
                  if(order.getStatus()==1){
                      c="text-xs rounded-full bg-yellow-200 text-yellow-400 px-2 py-1";
                      stt="New";
                  }else if(order.getStatus()==2){
                      c="text-xs rounded-full bg-purple-200 text-purple-400 px-2 py-1";
                      stt="Processing";
                  }else if(order.getStatus()==3){
                      c="text-xs rounded-full bg-blue-200 text-blue-400 px-2 py-1";
                      stt="Shipped";
                  }else if(order.getStatus()==4){
                      c="text-xs rounded-full bg-green-200 text-green-400 px-2 py-1";
                      stt="Delivered";
                  }else if(order.getStatus()==5){
                      c="text-xs rounded-full bg-red-200 text-red-400 px-2 py-1";
                      stt="Canceled";
                  }else if(order.getStatus()==6){
                      c="text-xs rounded-full bg-red-200 text-red-400 px-2 py-1";
                      stt="Declined";
                  }
                  else{
                      c="text-xs rounded-full bg-red-200 text-red-400 px-2 py-1";
                      stt="Returned";
                  }   
                
            %>
            <a href="../orders/order.jsp?id=<%= order.getId() %>" class="list-item justify-between">
              <div class="item-width"><%= order.getDate() %></div>
              <div class="item-width max-sm:hidden"><%= order.getTime()%></div>
              <div class="item-width"><%= order.getItems().size() %></div>
              <div class="item-width">LKR <%= order.getFTotal() %></div>
              <div class="item-width">
                  <div class="<%=c%>"><%=stt%></div>
              </div>
            </a>
            <%}}else{%>
            <div class="list-item justify-center">No Records Found</div>
            <%}%>
          </div>
        </div>

        <div class="box">
          <div class="box-title">Address Book</div>
          <div class="box-body text-sm">
              
            <%
                ArrayList<Address> addr = db.getAddresses(id);
                if(addr.size()>0){
                for(Address a : addr){
            %>  
            <div class="border py-3 px-5 rounded-lg flex flex-col gap-3">
              <div class="flex gap-5 lg:gap-10 flex-wrap">
                <div>
                  <div class="text-gray-400 font-semibold">First Name</div>
                  <div><%= a.getFname() %></div>
                </div>
                <div>
                  <div class="text-gray-400 font-semibold">Last Name</div>
                  <div><%= a.getLname() %></div>
                </div>
                <div>
                  <div class="text-gray-400 font-semibold">Email</div>
                  <div><%= a.getEmail() %></div>
                </div>
                <div>
                  <div class="text-gray-400 font-semibold">Phone</div>
                  <div><%= a.getPhone() %></div>
                </div>
              </div>
              <div>
                <div class="text-gray-400 font-semibold">Address</div>
                <div><%= a.getFullAddress() %></div>
              </div>
            </div>
            <%}}else{%>
            <div class="list-item justify-center">No Records Found</div>
            <%}%>
          </div>
        </div>
      </div>
    </div>

    <jsp:include page="../../WEB-INF/components/adminBottom.jsp" />
    <script src="./js/customersMain.js"></script>
  </body>
</html>
<%}
db.closeDb();
}}%>
