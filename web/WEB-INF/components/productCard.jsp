<%@page import="mainPackage.DatabaseLogIn, models.*, java.util.ArrayList" %>
<%
    DatabaseLogIn db = new DatabaseLogIn();
    Product product = db.getProduct(request.getParameter("id"));
%>
<div
  class="rounded-xl overflow-hidden bg-white p-2 hover:shadow-md duration-300 shrink-0 border"
>
  <div class="w-[184px] h-[184px] relative overflow-hidden rounded-lg">
    <img src="./img/products/<%= product.getImg1() %>" alt="" class="w-full h-full" />
    <div
      class="absolute overflow-hidden group top-1 right-1 w-6 h-6 hover:top-0 hover:right-0 hover:w-full hover:h-full hover:rounded-none bg-gray-100 rounded-md flex justify-center items-center duration-300 ease-in-out"
    >
      <i class="fa-solid fa-info text-sm group-hover:hidden"></i>
      <div class="absolute invisible group-hover:visible text-sm text-gray-400">
          <div class="flex gap-5 items-center">
              <div>
                  <div class="font-semibold">Colors</div>
                  <%
                      ArrayList<Color> colors = product.getColors();
                      for(Color col : colors){
                  %>
                  <div><%= col.getValue() %></div>
                  <%}%>
              </div>
              <div>
                  <div class="font-semibold">Sizes</div>
                  <%
                      ArrayList<Size> sizes = product.getSizes();
                      for(Size siz : sizes){
                  %>
                  <div><%= siz.getValue() %></div>
                  <%}%>
              </div>
          </div>
          <div class="font-semibold mt-2 text-center"><%= product.getTypeString() %></div>
      </div>
    </div>
  </div>
    <a href="./product.jsp?id=<%= product.getId() %>" class="font-semibold font-mono mt-1"><%= product.getName() %></a>
  <div class="flex justify-between items-center mt-1">
    <% if(product.getDiscount()>0){ %>  
    <div>
      <div class="flex text-xs gap-1">
        <div class="text-gray-600 line-through">LKR <%=product.getformatPrice() %></div>
        <div class="bg-green-200 px-1 rounded-lg text-green-600"><%= product.getDiscount() %>%</div>
      </div>
      <div class="text-lg font-semibold">LKR <%=product.getformatDis() %></div>
    </div>
    <%}else{%>
    <div>
      <div class="text-lg font-semibold">LKR <%=product.getformatPrice() %></div>
    </div>
    <%}%>
    <form
      acton="#"
      class="wforms w-10 h-10 flex justify-center items-center p-2 bg-blue-600 rounded-lg text-white group cursor-pointer hover:bg-blue-800 duration-300 ease-in-out"
    >
        <input type="hidden" name="id" value="<%= product.getId() %>"/>
        <button  type="submit">
            <i id="picon<%= product.getId() %>" class="fa-regular fa-heart group-hover:mb-2 duration-300 ease-in-out"></i>
        </button>
    </form>
  </div>
</div>