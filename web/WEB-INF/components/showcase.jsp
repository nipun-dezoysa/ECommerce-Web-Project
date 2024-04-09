<div
  class="main-container py-5 overflow-hidden flex flex-col gap-2"
>
  <div class="font-bold w-full font-mono flex justify-between px-2">
    <div class="text-2xl"><%= request.getParameter("title") %></div>
    <a href="#" class="text-md">View all</a>
  </div>
  <div class="flex flex-wrap gap-2 justify-between">
    <% for(int i=0;i<6;i++){ %>
    <jsp:include page="./productCard.jsp">
      <jsp:param name="name" value="Nike Air 2 Jordan" />
      <jsp:param name="src" value="./img/demo.jpg" />
    </jsp:include>
    <% } %>
  </div>
</div>
