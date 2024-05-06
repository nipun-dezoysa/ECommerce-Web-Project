<%@page import="mainPackage.DatabaseLogIn,mainPackage.Tools, models.*, java.util.ArrayList" %> 
<% String admin = (String)session.getAttribute("admin"); 
    if(admin == null){
%>

<jsp:include page="../WEB-INF/components/adminLogin.jsp">
    <jsp:param name="path" value="../"/>
</jsp:include>

<%}else{
    DatabaseLogIn db = new DatabaseLogIn();
    String[] counts = db.getAllCounts();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <title>Admin Dashboard</title>
    <jsp:include page="../WEB-INF/components/adminImports.jsp">
      <jsp:param name="path" value="" />
    </jsp:include>
  </head>
  <body>
    <jsp:include page="../WEB-INF/components/adminHead.jsp">
      <jsp:param name="path" value="" />
      <jsp:param name="no" value="1" />
    </jsp:include>

    <div class="flex gap-5 items-start">
      <div
        class="bg-white py-3 px-3 rounded-lg w-full md:w-[220px] shadow flex items-center gap-2 hover:bg-green-100 duration-300"
      >
        <div
          class="bg-green-200 w-10 h-10 md:w-12 md:h-12 flex items-center justify-center rounded-full text-green-500"
        >
          <i class="fa-solid fa-bag-shopping"></i>
        </div>
        <div>
          <div class="text-xs md:text-lg font-semibold text-gray-500">
            Total Orders
          </div>
          <div class="text-lg md:text-2xl"><%= counts[0] %></div>
        </div>
      </div>
      <div
        class="bg-white py-3 px-3 rounded-lg w-full md:w-[220px] shadow flex items-center gap-2 hover:bg-blue-100 duration-300"
      >
        <div
          class="bg-blue-200 w-10 h-10 md:w-12 md:h-12 flex items-center justify-center rounded-full text-blue-500"
        >
          <i class="fa-solid fa-tags"></i>
        </div>
        <div>
          <div class="text-xs md:text-lg font-semibold text-gray-500">
            Total Products
          </div>
          <div class="text-lg md:text-2xl"><%= counts[1] %></div>
        </div>
      </div>
      <div
        class="bg-white py-3 px-3 rounded-lg w-full md:w-[220px] shadow flex items-center gap-2 hover:bg-violet-100 duration-300"
      >
        <div
          class="bg-violet-200 w-10 h-10 md:w-12 md:h-12 flex items-center justify-center rounded-full text-violet-500"
        >
          <i class="fa-solid fa-person"></i>
        </div>
        <div>
          <div class="text-xs md:text-lg font-semibold text-gray-500">
            Total Customers
          </div>
          <div class="text-lg md:text-2xl"><%= counts[2] %></div>
        </div>
      </div>
    </div>

    <div class="flex flex-col lg:flex-row gap-2 max-lg:flex-wrap">
      <div class="w-full lg:w-[60%] bg-white rounded-lg shadow p-4 md:p-6">
        <div class="flex justify-between mb-5">
          <div>
            <h5 class="leading-none text-3xl font-bold text-gray-900 pb-2">
              LKR <%= db.getWeekSales() %>
            </h5>
            <p class="text-base font-normal text-gray-500">Sales this week</p>
          </div>
          
        </div>
        <div id="grid-chart"></div>
      </div>

      <div
        class="w-full md:w-[300px] lg:w-[25%] bg-white rounded-lg shadow p-4 md:p-6 flex flex-col justify-between"
      >
        <div class="flex justify-between items-start w-full">
          <div class="flex-col items-center">
            <div class="flex items-center mb-1">
              <h5 class="text-xl font-bold leading-none text-gray-900 me-1">
                Orders Summary
              </h5>
            </div>
          </div>
        </div>

        <!-- Line Chart -->
        <div class="" id="pie-chart"></div>
      </div>

      <div
        class="w-full md:w-[300px] lg:w-[30%] bg-white rounded-lg shadow pt-6 pb-2 lg:pb-0 flex flex-col gap-7 overflow-hidden"
      >
        <h5 class="text-xl font-bold leading-none text-gray-900 me-1 px-4">
          Recent Orders
        </h5>
        <div class="px-4 flex flex-col gap-2 justify-center">
        <%
            ArrayList<Order> recent = db.getOrders(9,"");
            for(Order order : recent){
                String[] colors = Tools.getOrderColor(order);
        %>
        
         <a 
            data-aos="slide-up"
           href="./orders/order.jsp?id=<%= order.getId() %>"
           class="text-xs flex justify-between py-2 px-2 <%= colors[0] %> font-semibold rounded-lg hover:bg-gray-800 hover:text-white duration-300 ease-in-out"
          >
            <div class="w-[10%]">#<%= order.getId() %></div>
            <div class="w-[50%]"><%= order.getUser().getEmail() %></div>
            <div class="w-[40%] text-end">LKR <%= order.getTotal() %></div>
          </a>
        <%}%>
        </div>
      </div>
    </div>

    <div class="flex flex-col lg:flex-row gap-2">
      <div
        class="lg:w-[30%] bg-white rounded-lg shadow pt-6 pb-2 px-4 flex flex-col gap-5 overflow-hidden"
      >
        <h5 class="text-xl font-bold leading-none text-gray-900">
          Most Sold Products
        </h5>
        <div>
        <%
            ArrayList<Product> sold = db.getHighestSold();
            int s = 0;
            for(Product pr : sold){
                s++;
        %>    
          <a
            href="./products/edit.jsp?id=<%= pr.getId() %>"
            class="flex gap-2 font-semibold hover:bg-gray-200 px-1 py-2 rounded-lg duration-700"
          >
            <div class="text-gray-400"><%=s%>.</div>
            <div class="w-[100px] rounded-lg aspect-square flex justify-center items-center overflow-hidden">
                <img src="../img/products/<%=pr.getImg1() %>" class="w-full h-auto"  alt="" />
            </div>
            <div>
              <h1 class="text-lg"><%= pr.getName() %></h1>
              <div class="text-gray-400"><%= pr.getBrand() %></div>
              <div>
                LKR <%= pr.getformatPrice() %>
                <span class="bg-green-200 text-green-400 px-2 rounded-full"
                  ><%= pr.getDiscount() %>%</span
                >
              </div>
              <div><%= pr.getSoldCount() %> Items sold</div>
            </div>
          </a>
          <%}%>
        </div>
      </div>

      <div
        class="lg:w-[30%] bg-white rounded-lg shadow pt-6 pb-2 px-4 flex flex-col gap-5 overflow-hidden"
      >
        <h5 class="text-xl font-bold leading-none text-gray-900">
          Most Viewed Products
        </h5>
        <div>
          <%
            ArrayList<Product> viewed = db.getHighestViewed();
            int v = 0;
            for(Product pr : viewed){
                v++;
        %>    
          <a
            href="./products/edit.jsp?id=<%= pr.getId() %>"
            class="flex gap-2 font-semibold hover:bg-gray-200 px-1 py-2 rounded-lg duration-700"
          >
            <div class="text-gray-400"><%=v%>.</div>
            <div class="w-[100px] rounded-lg aspect-square flex justify-center items-center overflow-hidden">
                <img src="../img/products/<%=pr.getImg1() %>" class="w-full h-auto"  alt="" />
            </div>
            
            <div>
              <h1 class="text-lg"><%= pr.getName() %></h1>
              <div class="text-gray-400"><%= pr.getBrand() %></div>
              <div>
                LKR <%= pr.getformatPrice() %>
                <span class="bg-green-200 text-green-400 px-2 rounded-full"
                  ><%= pr.getDiscount() %>%</span
                >
              </div>
              <div><%= pr.getViewCount() %> Page Views</div>
            </div>
          </a>
          <%}%>
        </div>
      </div>
    </div>

    <jsp:include page="../WEB-INF/components/adminBottom.jsp" />

    <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    <script>
        const placedss = <%= db.getWeekOrders(1) %>;
        const returnedss = <%= db.getWeekOrders(7) %>;
        const deliveredss = <%= db.getWeekOrders(4) %>;
        const categoriess = <%= Tools.getWeekDays() %>;
        <%
          double[] summ = db.getOrdersCategoryCount();
        %>
        const ordersNums = [<%=summ[0]%>, <%=summ[1]%>, <%=summ[2]%>,<%=summ[3]%>,<%=summ[4]%>,<%=summ[5]%>,<%=summ[6]%>] ;
    </script>
    <script src="./js/charts.js"></script>
    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
    <script>
      AOS.init();
    </script>
  </body>
</html>
<% db.closeDb(); %>
<% } %>
