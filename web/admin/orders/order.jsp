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
    Order order = db.getOrder(Integer.parseInt(id));
    if(order==null){
        response.sendRedirect("./index.jsp"); 
    }else{
%>
<!DOCTYPE html>
<html>
  <head>
    <title>Orders</title>
    <jsp:include page="../../WEB-INF/components/adminImports.jsp">
      <jsp:param name="path" value="../" />
    </jsp:include>
    <style type="text/tailwindcss">
      @layer utilities {
        .list-header {
          @apply flex justify-between text-center font-semibold text-sm;
        }
        .list-item {
          @apply flex items-center border rounded-lg py-2 text-center text-xs hover:bg-gray-200 duration-300 ease-in-out;
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
      <jsp:param name="no" value="2" />
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
              >Orders</a
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
      
    <div class="flex flex-col md:flex-row gap-5 w-full items-start">
      <div class="box w-full md:w-[70%]">
        <div class="px-5 py-2 flex border-b bg-gray-100 text-gray-600">
          <div>
            <div class="flex gap-2">
              <div class="font-semibold">
                Order <span class="text-gray-400">#<%= order.getId() %></span>
              </div>
              <%
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
              <div
                class="<%= c %>"
              >
                <%= stt %>
              </div>
            </div>
                <div class="text-xs"><%= order.getDate()+" "+order.getTime() %></div>
          </div>
        </div>
        <div class="box-body">
          <div class="flex justify-between text-sm font-semibold text-center">
            <div class="w-[7%]">SKU</div>
            <div class="w-[13%]">Name</div>
            <div class="w-[10%]">Color</div>
            <div class="w-[10%]">Size</div>
            <div class="w-[10%] max-md:hidden">Each Price</div>
            <div class="w-[10%]">Quentity</div>
            <div class="w-[10%] max-md:hidden">Discount</div>
            <div class="w-[10%]">Total</div>
          </div>
          <div class="gap-1 flex flex-col">
             <% for(int i=0;i<order.getItems().size();i++){ %> 
            <div
              class="flex justify-between text-xs text-center border py-2 rounded-lg"
            >
                <div class="w-[7%]"><%= order.getItems().get(i).getPid() %></div>
              <div class="w-[13%]"><%= order.getItems().get(i).getName() %></div>
              <div class="w-[10%]"><%= order.getItems().get(i).getColor() %></div>
              <div class="w-[10%]"><%= order.getItems().get(i).getSize() %></div>
              <div class="w-[10%] max-md:hidden">LKR <%= order.getItems().get(i).getformatPrice() %></div>
              <div class="w-[10%]"><%= order.getItems().get(i).getQuantity() %></div>
              <div class="w-[10%] max-md:hidden"><%= order.getItems().get(i).getDiscount() %>%</div>
              <div class="w-[10%]">LKR <%= order.getItems().get(i).getformatTotal() %></div>
            </div>
            <%}%>
          </div>
          <div class="flex flex-col md:flex-row gap-2 justify-between">
            <div class="w-full md:w-[60%] text-gray-400">
              <h1 class="font-semibold">Other Notes</h1>
              <p class="text-sm">
                <%= order.getNote() %>
              </p>
            </div>
            <div class="w-full md:w-[30%]">
              <div
                class="text-gray-400 font-semibold text-sm flex justify-between"
              >
                <div>Subtotal</div>
                <div>LKR <%= order.getTotal() %></div>
              </div>
              <div
                class="text-gray-400 font-semibold text-sm flex justify-between"
              >
                <div>Shipping</div>
                <div>LKR 30.00</div>
              </div>
              <div
                class="text-gray-400 font-semibold flex justify-between border-t pt-2 mt-2"
              >
                <div>Total</div>
                <div>LKR <%= order.getFTotal() %></div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="w-full md:w-[30%] flex flex-col gap-5">
        <div class="box">
          <div class="box-title">Shipping Details</div>
          <div class="box-body text-sm">
            <div class="flex">
              <div class="w-[20%] font-semibold">Name:</div>
              <div><%= order.getName() %></div>
            </div>
            <div class="flex">
              <div class="w-[20%] font-semibold">Phone:</div>
              <div class="w-[80%]"><%= order.getPhone() %></div>
            </div>
            <div class="flex">
              <div class="w-[20%] font-semibold">Email:</div>
              <div class="w-[80%]"><%= order.getEmail() %></div>
            </div>
            <div class="flex">
              <div class="w-[20%] font-semibold">Address:</div>
              <div class="w-[80%]">
                <%= order.getAddress() %>
              </div>
            </div>
          </div>
        </div>
        <div class="box">
          <div class="box-title">Customer Details</div>
          <div class="box-body">
            <a
              href="../customers/customer.jsp?id=<%= order.getUser().getId() %>"
              class="flex gap-2 items-center hover:bg-gray-200 p-2 rounded-lg duration-300 ease-in-out"
            >
              <div><i class="fa-regular fa-user text-3xl"></i></div>
              <div>
                <div class="font-semibold"><%= order.getUser().getFullName() %></div>
                <div class="text-sm"><%= order.getUser().getEmail() %></div>
              </div>
            </a>
          </div>
        </div>
        <div class="box">
          <div class="box-title">Activity Log</div>
          <div class="box-body">
              <ol class="relative border-s border-gray-700">
                <%
                    for(int i =0;i<order.getActivity().size();i++){
                     String verb="";
                     switch(order.getActivity().get(i).getStatus()){
                         case 1: verb = "Order placed by customer."; break;
                         case 2: verb = "Order Accepted."; break;
                         case 3: verb = "Order Shipped."; break;
                         case 4: verb = "Order delivered."; break;
                         case 5: verb = "Order canceled by customer."; break;
                         case 6: verb = "Order declined."; break;
                         case 7: verb = "Order returned."; break;
                     }
                %>
                <li class="ms-4">
                    <div class="absolute w-3 h-3 bg-gray-200 rounded-full mt-1.5 -start-1.5 border border-gray-900"></div>
                    <time class="mb-1 text-sm font-normal leading-none text-gray-500"><%= order.getActivity().get(i).getFDate() %></time>
                    <h3 class="text-lg font-semibold text-gray-900"><%= verb %></h3>
                </li>
                <%}%>
              </ol>
              
              <div>
                  <%
                  if(order.getStatus()<4){
                     String lable = "";
                     int value = 1;
                     switch(order.getStatus()){
                         case 1 : lable="Accept"; value=2; break;
                         case 2 : lable="Mark As Shipped"; value=3; break;
                         case 3 : lable="Mark As Delivered"; value=4; break;
                     }
                  %>
                <form class="formss" action="../../orderStatus" method="POST">
                    <input type="hidden" name="id" value="<%= order.getId() %>"/>
                    <input type="hidden" name="status" value="<%= value %>"/>
                    <input
                      type="submit"
                      class="bg-primary text-white p-2 w-full rounded-lg mt-2 hover:bg-primaryLight cursor-pointer"
                      value="<%= lable %>"
                    />
                </form>
                <%}%> 
             
                <%if(order.getStatus()==1 || order.getStatus()==4){
                    String lable = "";
                    int value = 1;
                    switch(order.getStatus()){
                         case 1 : lable="Declined"; value=6; break;
                         case 4 : lable="Mark As Returned"; value=7; break;
                     }
                %>
                <form class="formss" action="../../orderStatus" method="POST">
                    <input type="hidden" name="id" value="<%= order.getId() %>"/>
                    <input type="hidden" name="status" value="<%= value %>"/>
                    <input
                      type="submit"
                      class="bg-red-800 text-white p-2 w-full rounded-lg mt-2 hover:bg-red-700 cursor-pointer"
                      value="<%= lable %>"
                    />
                </form>
                <%}%>
              </div>
                  
          </div>
        </div>
      </div>
    </div>
    <jsp:include page="../../WEB-INF/components/adminBottom.jsp" />
    
    <script src="./js/order.js"></script>
    
  </body>
</html>
<%}
db.closeDb();
}}%>