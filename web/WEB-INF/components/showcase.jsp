<%@page import="mainPackage.DatabaseLogIn, models.*, java.util.ArrayList" %>
<%
   DatabaseLogIn db = new DatabaseLogIn();
   ArrayList<Product> plist = db.getAllProducts(request.getParameter("specific")+"  ORDER BY `Id` DESC LIMIT 5;");
%>
<div
  data-aos="slide-up"
  class="main-container py-5 overflow-hidden flex flex-col gap-2"
>
  <div class="font-bold w-full font-mono flex justify-between px-2">
    <div class="text-2xl"><%= request.getParameter("title") %></div>
    <a href="#" class="text-md">View all</a>
  </div>
  <div class="flex flex-wrap gap-2 justify-between">
    <% for(Product pro : plist){ %>
    <jsp:include page="./productCard.jsp">
      <jsp:param name="id" value="<%= pro.getId()%>" />
    </jsp:include>
    <% } %>
  </div>
</div>
