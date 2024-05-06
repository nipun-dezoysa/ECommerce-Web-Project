<% String admin = (String)session.getAttribute("admin"); 
    if(admin == null){
%>

<jsp:include page="../../WEB-INF/components/adminLogin.jsp"/>
<%}else{%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="mainPackage.DatabaseLogIn, models.*, java.util.ArrayList" %>
<%
    DatabaseLogIn db = new DatabaseLogIn();
%>
<!DOCTYPE html>
<html>
  <head>
    <title>Customers</title>
    <jsp:include page="../../WEB-INF/components/adminImports.jsp">
      <jsp:param name="path" value="../" />
    </jsp:include>
    <style type="text/tailwindcss">
      @layer utilities {
        .list-header {
          @apply flex justify-between text-center font-semibold text-sm;
        }
        .list-item {
          @apply flex items-center  border rounded-lg py-2 text-center text-xs hover:bg-gray-200 duration-300 ease-in-out;
        }
        .item-width {
          @apply w-[18%];
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
              >Customers</span
            >
          </div>
        </li>
      </ol>
    </nav>
      
      <%
            String type = request.getParameter("type");
            int a = 2;
            if(type!=null){
                if(type.equals("active")) a=1;
                else if(type.equals("blocked")) a=0;
            }
            ArrayList<User> users = db.getAllUsers(a);
            
        %>

      <div class="flex flex-col items-start lg:flex-row gap-5">

        <div class="box w-[15%] max-lg:w-full">
          <div class="flex flex-row lg:flex-col gap-2 lg:gap-1  max-lg:justify-between px-3 py-2 text-sm max-lg:text-center">
              <a href="./index.jsp" class="<%= a==2? "w-full bg-gray-100 p-2 rounded-lg font-semibold" : "w-full hover:bg-gray-100 hover:px-2 py-2 hover:rounded-lg hover:font-semibold  duration-300 ease-in-out" %>">All<span class="max-md:hidden"> Users</span></a>
              <a href="./index.jsp?type=active" class="<%= a==1? "w-full bg-gray-100 p-2 rounded-lg font-semibold" : "w-full hover:bg-gray-100 hover:px-2 py-2 hover:rounded-lg hover:font-semibold  duration-300 ease-in-out" %>">Active<span class="max-md:hidden"> Users</span></a>
              <a href="./index.jsp?type=blocked" class="<%= a==0? "w-full bg-gray-100 p-2 rounded-lg font-semibold" : "w-full hover:bg-gray-100 hover:px-2 py-2 hover:rounded-lg hover:font-semibold  duration-300 ease-in-out" %>">Blocked<span class="max-md:hidden"> Users</span></a>
          </div>
        </div>
      
      
      <div class="box w-[85%] max-lg:w-full">
            <div class="box-title">Customers</div>
            <div class="box-body">
              <div class="list-header">
                <div class="w-[10%] max-md:w-[20%]">User ID</div>
                <div class="w-[20%] max-md:hidden">Name</div>
                <div class="w-[20%] max-md:w-[40%]">Email</div>
                <div class="w-[10%] max-md:hidden">No of Orders</div>
                <div class="w-[10%] max-md:hidden">Status</div>
                <div class="w-[10%] max-md:hidden">Last login</div>
                <div class="w-[20%] max-md:w-[40%]">Actions</div>
              </div>
              <div class="flex flex-col gap-1">
              <%
                  
                  if(users.size()>0){
                  for(User user : users){
                      
                  
              %>  
              <div class="list-item justify-between">
                <div class="w-[10%] max-md:w-[20%]">#<%= user.getId() %></div>
                <a href="./customer.jsp?id=<%= user.getId() %>" class="w-[20%] max-md:hidden"><%= user.getFullName() %></a>
                <a href="./customer.jsp?id=<%= user.getId() %>" class="w-[20%] max-md:w-[40%]"><%= user.getEmail() %></a>
                <div class="w-[10%] max-md:hidden"><%= user.getOcount() %></div>
                <div class="w-[10%] max-md:hidden flex items-center justify-center gap-1">
                    <% if(user.getStatus()==1){ %>
                    <span class="flex w-3 h-3 bg-green-500 rounded-full"></span>Active
                    <%}else{%>
                    <span class="flex w-3 h-3 bg-red-500 rounded-full"></span>Blocked
                    <%}%>
                </div>
                <div class="w-[10%] max-md:hidden"><%= user.getLogDate() %></div>
                <div class="w-[20%] max-md:w-[40%] flex justify-center gap-1">
                  <% if(user.getStatus()==1){ %>  
                  <form action="#" class="reset">
                    <input type="hidden" name="id" value="<%= user.getId() %>">
                    <button class="border border-blue-600 bg-blue-600 py-1 px-2 flex gap-1 items-center rounded-lg text-white duration-300 hover:text-blue-600 hover:bg-white"><i class="fa-solid fa-lock-open"></i><div>Reset</div></button>
                  </form>
                  <form action="#" class="block">
                    <input type="hidden" name="id" value="<%= user.getId() %>">
                    <button class="border border-red-600 bg-red-600 py-1 px-2 flex gap-1 items-center rounded-lg text-white duration-300 hover:text-red-600 hover:bg-white"><i class="fa-solid fa-user-xmark"></i><div>Block</div></button>
                  </form> 
                    <%}else{%>
                    <form action="#" class="block">
                    <input type="hidden" name="id" value="<%= user.getId() %>">
                    <button class="border border-blue-600 bg-blue-600 py-1 px-2 flex gap-1 items-center rounded-lg text-white duration-300 hover:text-blue-600 hover:bg-white"><i class="fa-solid fa-user-plus"></i><div>Unblock</div></button>
                    </form> 
                    <%}%>
                  
                </div>
            </div>
            <%}}else{%>
            <div class="list-item flex justify-center">
              no user found
            </div>
            <%}%>
            </div>
          </div>
      </div>
      </div>
      <jsp:include page="../../WEB-INF/components/adminBottom.jsp" />
      
      <script src="./js/customersMain.js"></script>
      
  </body>
</html>
<% db.closeDb(); %>
<%}%>