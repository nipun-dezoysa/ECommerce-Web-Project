<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="mainPackage.DatabaseLogIn, models.*, java.util.ArrayList" %>
<% 
    String id = request.getParameter("id");
    if(id==null) response.sendRedirect("./index.jsp");
    else{
    try { 
        Integer.parseInt(id); 
        DatabaseLogIn db = new DatabaseLogIn();
        Product pr = db.getProduct(id);
        if(pr==null)response.sendRedirect("./index.jsp");
        else{
            if(session.getAttribute("user")==null) db.addview(0, pr.getId());
            else{
                User us = (User)session.getAttribute("user");
                db.addview(us.getId(), pr.getId());
            }
%>       

<!DOCTYPE html>
<html>
  <head>
    <title>Product</title>
    <script src="./js/quantityRange.js"></script>
    <script src="./js/productPageSlider.js"></script>
    <jsp:include page="./WEB-INF/components/Imports.jsp" />
  </head>
  <body>
    <jsp:include page="./WEB-INF/components/nav.jsp" />

    <!-- product images -->
    <div class="main-container p-5 flex flex-col md:flex-row max-lg:w-full lg:h-[500px] gap-5 justify-center">
      <div class="flex flex-col max-lg:flex-col-reverse lg:flex-row max-md:w-full max-lg:w-[500px] lg:h-full gap-1 shrink-0">

        <!-- side pics -->
        <div class="flex flex-row lg:flex-col max-lg:w-full lg:h-full justify-between">
          <div class="max-lg:w-[24%] lg:h-[24%] relative group" onclick="chnge(0)">
            <input
              type="radio"
              name="imggroup"
              class="peer h-full w-full absolute opacity-0 cursor-pointer"
              checked
            />
            <div class="max-lg:w-full lg:h-full aspect-square flex items-center overflow-hidden rounded-xl group-hover:border-4 peer-checked:border-8 border-gray-300 cursor-pointer duration-300 ease-in-out">
                <img
              class="w-full h-auto"
              src="./img/products/<%= pr.getImg1() %>"
              alt="product image"
            />
            </div>
          </div>
          <div class="max-lg:w-[24%] lg:h-[24%] relative group" onclick="chnge(1)">
            <input
              type="radio"
              name="imggroup"
              class="peer h-full w-full absolute opacity-0 cursor-pointer"
            />
            <div class="max-lg:w-full lg:h-full aspect-square flex items-center overflow-hidden rounded-xl group-hover:border-4 peer-checked:border-8 border-gray-300 cursor-pointer duration-300 ease-in-out">
                <img
              class="w-full h-auto"
              src="./img/products/<%= pr.getImg2() %>"
              alt="product image"
            />
            </div>
          </div>
          <div class="max-lg:w-[24%] lg:h-[24%] relative group" onclick="chnge(2)">
            <input
              type="radio"
              name="imggroup"
              class="peer h-full w-full absolute opacity-0 cursor-pointer"
            />
            <div class="max-lg:w-full lg:h-full aspect-square flex items-center overflow-hidden rounded-xl group-hover:border-4 peer-checked:border-8 border-gray-300 cursor-pointer duration-300 ease-in-out">
                <img
              class="w-full h-auto"
              src="./img/products/<%= pr.getImg3() %>"
              alt="product image"
            />
            </div>
          </div>
          <div class="max-lg:w-[24%] lg:h-[24%] relative group" onclick="chnge(3)">
            <input
              type="radio"
              name="imggroup"
              class="peer h-full w-full absolute opacity-0 cursor-pointer"
            />
            <div class="max-lg:w-full lg:h-full aspect-square flex items-center overflow-hidden rounded-xl group-hover:border-4 peer-checked:border-8 border-gray-300 cursor-pointer duration-300 ease-in-out">
                <img
              class="w-full h-auto"
              src="./img/products/<%= pr.getImg4() %>"
              alt="product image"
            />
            </div>
          </div>
        </div>

        <!-- cover pics -->
        <div class="max-lg:w-full lg:h-full aspect-square overflow-hidden rounded-xl">
          <div id="sl" class="h-[400%] w-full duration-700 ease-in-out">
              <div class="h-[25%] aspect-square flex items-center overflow-hidden"><img class="w-full h-auto" src="./img/products/<%= pr.getImg1() %>" alt="product image" /></div>
              <div class="h-[25%] aspect-square flex items-center overflow-hidden"><img class="w-full h-auto" src="./img/products/<%= pr.getImg2() %>" alt="product image" /></div>
              <div class="h-[25%] aspect-square flex items-center overflow-hidden"><img class="w-full h-auto" src="./img/products/<%= pr.getImg3() %>" alt="product image" /></div>
              <div class="h-[25%] aspect-square flex items-center overflow-hidden"><img class="w-full h-auto" src="./img/products/<%= pr.getImg4() %>" alt="product image" /></div>
            
          </div>
        </div>
      </div>

      <!-- product details -->
      <div class="w-full md:w-[40%] flex flex-col gap-1">
        <div class="flex items-center gap-3">
          <h1 class="text-4xl font-bold font-mono"><%= pr.getName() %></h1>
          <form class="wforms" action="WishlistServlet" method="POST" >
            <input type="hidden" name="id" value="<%= pr.getId()%>" />
            <button type="submit">
              <%
                String iconclass = "regular";
                if(session.getAttribute("user")!=null){
                    User user = (User)session.getAttribute("user");
                    if(db.isExistWishlist(user.getId(), pr.getId())) iconclass = "solid";
                }
              %>
              <i class="fa-<%= iconclass%> fa-heart text-2xl picon<%= pr.getId() %>"></i>
            </button>
          </form>
        </div>
        <div class="flex gap-1">
          <div class="px-2 py-1 rounded-full text-xs border"><%= pr.getBrand() %></div>
          <div class="px-2 py-1 rounded-full text-xs border">
              <% if(pr.getType()==1){ %>
              Men Shoes
              <%}else if(pr.getType()==2){ %>
              Women Shoes
              <%}else{ %>
              Kid Shoes
              <%}%>
          </div>
        </div>
          
        <%
            double price = (double)pr.getPrice();
            
        %>  
          
        <div>
          <% if(pr.getDiscount()>0 && pr.getDiscount()<=100){%>  
          <div class="text-2xl font-mono">LKR <%= pr.getformatDis() %></div>
          <div class="flex gap-2">
            <div class="text-gray-500 line-through">LKR <%= pr.getformatPrice() %></div>
            <div class="bg-green-200 px-2 rounded-full text-green-500"><%= pr.getDiscount() %>%</div>
          </div>
          <% }else{ %>
          <div class="text-2xl font-mono">LKR <%= pr.getformatPrice() %></div>
          <% } %>
        </div>

        <p class="font-mono text-sm">
          <%= pr.getDes() %>
        </p>
        <form id="cartform" class="flex flex-col gap-1">
          <div class="flex flex-col">
            <div class="font-semibold">Colors</div>
            <div class="mt-1 flex gap-1 flex-wrap">
                
              <% for(int i=0;i<pr.getColors().size();i++){ %>  
              <div>
                <input
                  type="radio"
                  id="color<%= i %>"
                  name="color"
                  value="<%= pr.getColors().get(i).getId() %>"
                  class="hidden peer"
                />
                <label
                  for="color<%= i %>"
                  class="block px-5 py-2 border-2 rounded-full peer-checked:bg-primary peer-checked:text-white hover:bg-primaryLight cursor-pointer hover:text-white"
                  ><%= pr.getColors().get(i).getValue() %></label
                >
              </div>
              <% } %>
              
            </div>
          </div>
          <div class="flex flex-col">
            <div class="font-semibold">Sizes</div>
            <div class="mt-1 flex gap-1 flex-wrap">
                
              <% for(int i=0;i<pr.getSizes().size();i++){ %>  
              <div>
                <input
                  type="radio"
                  id="size<%= i %>"
                  name="size"
                  value="<%= pr.getSizes().get(i).getId() %>"
                  class="hidden peer"
                />
                <label
                  for="size<%= i %>"
                  class="block px-5 py-2 border-2 rounded-full peer-checked:bg-primary peer-checked:text-white hover:bg-primaryLight cursor-pointer hover:text-white"
                  ><%= pr.getSizes().get(i).getValue() %></label
                >
              </div>
              <% } %>
              
            </div>
          </div>

          <!-- product id no -->
          <input type="hidden" name="id" value="<%= id %>" />

          <div class="flex mt-1 gap-1">
            <div
              class="border-2 rounded-full flex items-center w-[110px] p-1 justify-between"
            >
              <input id="quantity" type="hidden" name="quantity" value="1" />
              <button
                type="button"
                onclick="updateQuantity('rem','quantity','no')"
              >
                <i
                  class="fa-solid fa-circle-minus text-3xl text-primary hover:text-primaryLight"
                ></i>
              </button>
              <div id="no" class="text-primary font-mono font-semibold">1</div>
              <button
                type="button"
                onclick="updateQuantity('add','quantity','no')"
              >
                <i
                  class="fa-solid fa-circle-plus text-3xl text-primary hover:text-primaryLight"
                ></i>
              </button>
            </div>
            <button
              class="bg-primary hover:bg-primaryLight text-white px-5 py-2 rounded-xl"
              type="submit"
            >
              <i class="fa-solid fa-cart-plus"></i>
              Add to Cart
            </button>
          </div>
        </form>
      </div>
    </div>

    <%
        String a = "WHERE Id!="+id;
    %>
    <jsp:include page="./WEB-INF/components/showcase.jsp">
      <jsp:param name="title" value="You may also like" />
      <jsp:param name="link" value="./products.jsp" />
      <jsp:param name="specific" value="<%=a%>" />
    </jsp:include>

    <jsp:include page="./WEB-INF/components/footer.jsp" />
    
    <script src="js/wishlist.js"></script>
    <script src="js/addToCart.js"></script>
  </body>
</html>

<%        }
db.closeDb();
	}  
    catch (NumberFormatException e)  
	{
        response.sendRedirect("./index.jsp");
        
	}
    
    }
%>      