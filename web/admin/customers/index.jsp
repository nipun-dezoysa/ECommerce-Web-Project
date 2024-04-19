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
          @apply flex items-center  border rounded-lg py-2 text-center text-xs lg:text-sm hover:bg-gray-200 duration-300 ease-in-out;
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
              >Orders</span
            >
          </div>
        </li>
      </ol>
    </nav>
      
      
      <div class="box">
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
              
              <%
                  ArrayList<User> users = db.getAllUsers();
                  if(users.size()>0){
                  for(User user : users){
                      
                  
              %>  
              <div class="list-item justify-between">
                <div class="w-[10%] max-md:w-[20%]">#<%= user.getId() %></div>
                <a href="#" class="w-[20%] max-md:hidden"><%= user.getFullName() %></a>
                <div class="w-[20%] max-md:w-[40%]"><%= user.getEmail() %></div>
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
                  <form action="#" class="reset">
                    <input type="hidden" name="id" value="1">
                    <button class="border border-blue-600 bg-blue-600 py-1 px-2 flex gap-1 items-center rounded-lg text-white duration-300 hover:text-blue-600 hover:bg-white"><i class="fa-solid fa-lock-open"></i><div>Reset</div></button>
                  </form>
                  <form action="#" class="block">
                    <input type="hidden" name="id" value="1">
                    <button class="border border-red-600 bg-red-600 py-1 px-2 flex gap-1 items-center rounded-lg text-white duration-300 hover:text-red-600 hover:bg-white"><i class="fa-solid fa-user-xmark"></i><div>Block</div></button>
                  </form>
                </div>
            </div>
            <%}}else{%>
            <div class="list-item flex justify-center">
              no user registered
            </div>
            <%}%>
          </div>
      
      
      <jsp:include page="../../WEB-INF/components/adminBottom.jsp" />
  </body>
</html>
