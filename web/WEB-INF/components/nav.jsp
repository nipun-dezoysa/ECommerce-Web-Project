<%@page import="models.Product"%>
<%@page import="models.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.CartItem"%>
<%@page import="mainPackage.DatabaseLogIn"%>
<% String path = request.getParameter("path"); if(path==null){ path="./"; } %>

<!-- ----dont delete below line---- -->
<div class="frameBox">
  <!-- ----dont delete above line---- -->

  <!--navbar code starts here-->
  <div class="bg-primary py-1 font-mono text-white flex justify-center z-50">
    Just arrived. Hurry up!
  </div>
  <div
    class="sticky top-0 text-primary bg-white flex justify-between items-center py-3 main-container border-b z-50"
  >
    <div class="flex gap-10 items-center">
      <a href="<%=path%>index.jsp">
        <img class="h-[30px] lg:h-[40px]" src="<%=path%>img/1.png" alt="" />
      </a>
      <div class="flex gap-4">
        <a href="#" class="hover:text-primaryLight font-semibold">NEW</a>
        <a href="#" class="hover:text-primaryLight font-semibold">MEN</a>
        <a href="#" class="hover:text-primaryLight font-semibold">WOMEN</a>
        <a href="#" class="hover:text-primaryLight font-semibold">KIDS</a>
        <a href="#" class="hover:text-primaryLight font-thin">NIKE</a>
        <a href="#" class="hover:text-primaryLight font-thin">ADIDAS</a>
      </div>
    </div>
    <div class="flex items-center gap-5 max-sm:gap-3 relative">
      <div
        class="block flex items-center w-[200px] rounded-md border-0 py-1.5 px-2 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 focus:ring-2 focus:ring-inset focus:outline-none focus:ring-primaryLight sm:text-sm sm:leading-6"
      >
        <input
          class="focus:outline-none w-full placeholder:text-gray-400 border-0 focus:ring-0 p-0"
          type="text"
          name="search"
          id="search"
          placeholder="Search Product"
        />
        <i class="fa-solid fa-magnifying-glass"></i>
      </div>
        
        
      <a
        href="<%=path%>wishlist.jsp"
        class="flex items-center gap-2 hover:text-primaryLight relative"
      >
        <div class="text-2xl"><i class="fa-regular fa-heart"></i></div>
        <% 
            if(session.getAttribute("user")!=null){ 
                DatabaseLogIn dbs = new DatabaseLogIn();
                User u = (User)session.getAttribute("user");
                ArrayList<Product> w = dbs.getWishlist(u.getId());
        %>
        <div
            id="wishno"  
          class="absolute top-[-7px] right-[-8px] text-xs font-bold w-5 h-5 flex items-center justify-center bg-green-300 rounded-full text-green-800"
        >
          <%= w.size() %>
        </div>
        <% }else{ %>
        
        <div
            id="wishno"  
          class="hidden absolute top-[-7px] right-[-8px] text-xs font-bold w-5 h-5 flex items-center justify-center bg-green-300 rounded-full text-green-800"
        >
          0
        </div>
        
        <%}%>
      </a>
        
        
      <a
        href="<%=path%>cart.jsp"
        class="flex items-center gap-2 hover:text-primaryLight relative"
      >
        <div class="text-2xl">
          <i class="fa-solid fa-cart-shopping"></i>
        </div>
        <% 
            if(session.getAttribute("cart")!=null){ 
            ArrayList<CartItem> cart = (ArrayList<CartItem>)session.getAttribute("cart");
        %>
        <div
            id="cartno"  
          class="absolute top-[-7px] right-[-8px] text-xs font-bold w-5 h-5 flex items-center justify-center bg-green-300 rounded-full text-green-800"
        >
          <%= cart.size() %>
        </div>
        <% }else{ %>
        
        <div
            id="cartno"  
          class="hidden absolute top-[-7px] right-[-8px] text-xs font-bold w-5 h-5 flex items-center justify-center bg-green-300 rounded-full text-green-800"
        >
          0
        </div>
        
        <%}%>
      </a>
      <% if(session.getAttribute("user")==null){ %>
      <a
        href="<%=path%>signin.jsp"
        class="flex items-center gap-2 hover:text-primaryLight"
      >
        <div class="text-2xl"><i class="fa-solid fa-user"></i></div>
        <div class="text-sm max-sm:hidden">
            <div>Account</div>
          <div class="font-bold font-mono">Sign In</div>
        </div>
      </a>
      <% }else{ %>
      <div class="flex items-center gap-2">
        <div class="text-2xl"><i class="fa-solid fa-user"></i></div>
        <div class="text-sm flex flex-col max-sm:hidden">
          <a class="hover:text-primaryLight" href="<%=path%>user">Account</a>
          <button
            id="logout"
            class="font-bold font-mono hover:text-primaryLight"
          >
            logout
          </button>
        </div>
      </div>
      <% } %>
    </div>
  </div>
  <!--navbar code end here-->
  <!-- clear all the lines after this -->
