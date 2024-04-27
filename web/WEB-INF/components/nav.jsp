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
    class="sticky top-0 text-primary bg-white flex justify-between items-center py-3 main-container border-b z-40"
  >
    <button class="lg:hidden text-white bg-primary hover:bg-primaryLight focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 focus:outline-none" type="button" data-drawer-target="drawer-navigation" data-drawer-show="drawer-navigation" aria-controls="drawer-navigation">
   <i class="fa-solid fa-bars"></i>
   </button>
    <div class="flex gap-10 items-center">
      <a href="<%=path%>index.jsp">
        <img class="h-[30px] lg:h-[40px]" src="<%=path%>img/1.png" alt="" />
      </a>
      <div class="flex gap-4 max-lg:hidden">
        <a href="<%=path%>products.jsp" class="hover:text-primaryLight font-semibold">All</a>
        <a href="<%=path%>products.jsp?category=mens" class="hover:text-primaryLight font-semibold">MEN</a>
        <a href="<%=path%>products.jsp?category=womens" class="hover:text-primaryLight font-semibold">WOMEN</a>
        <a href="<%=path%>products.jsp?category=kids" class="hover:text-primaryLight font-semibold">KIDS</a>
        <a href="<%=path%>products.jsp?brand=Nike" class="hover:text-primaryLight font-thin">NIKE</a>
        <a href="<%=path%>products.jsp?brand=Adidas" class="hover:text-primaryLight font-thin">ADIDAS</a>
      </div>
    </div>
    <div class="flex items-center gap-5 max-sm:gap-3 relative">
      <form
        action="products.jsp"
        class="max-lg:hidden block flex items-center w-[200px] rounded-md border-0 py-1.5 px-2 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 focus:ring-2 focus:ring-inset focus:outline-none focus:ring-primaryLight sm:text-sm sm:leading-6"
      >
        <input
          class="focus:outline-none w-full placeholder:text-gray-400 border-0 focus:ring-0 p-0"
          type="text"
          name="search"
          id="search"
          <%if(request.getParameter("search")!=null){%>
          value="<%= request.getParameter("search") %>"
          <%}%>
          placeholder="Search Product"
          required
        />
        <button><i class="fa-solid fa-magnifying-glass"></i></button>
      </form>
        
        
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
        class="flex items-center gap-2 hover:text-primaryLight max-lg:hidden"
      >
        <div class="text-2xl"><i class="fa-solid fa-user"></i></div>
        <div class="text-sm max-sm:hidden">
            <div>Account</div>
          <div class="font-bold font-mono">Sign In</div>
        </div>
      </a>
      <% }else{ %>
      <div class="flex items-center gap-2 max-lg:hidden">
        <div class="text-2xl"><i class="fa-solid fa-user"></i></div>
        <div class="text-sm flex flex-col max-sm:hidden">
          <a class="hover:text-primaryLight" href="<%=path%>user">Account</a>
          <button
            id="logout"
            class="logoutss font-bold font-mono hover:text-primaryLight"
          >
            logout
          </button>
        </div>
      </div>
      <% } %>
    </div>
  </div>
  <!--navbar code end here-->
  
  <div id="drawer-navigation" class="fixed top-0 left-0 z-50 w-64 h-screen p-4 overflow-y-auto transition-transform -translate-x-full bg-white dark:bg-gray-800" tabindex="-1" aria-labelledby="drawer-navigation-label">
    <h5 id="drawer-navigation-label" class="text-base font-semibold text-gray-500 uppercase dark:text-gray-400">Menu</h5>
    <button type="button" data-drawer-hide="drawer-navigation" aria-controls="drawer-navigation" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 absolute top-2.5 end-2.5 inline-flex items-center dark:hover:bg-gray-600 dark:hover:text-white" >
        <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
        <span class="sr-only">Close menu</span>
    </button>
  <div class="py-4 overflow-y-auto">
      <ul class="space-y-2 font-medium">
         <li>
            <form
        action="products.jsp"
        class="bg-white block flex items-center w-full rounded-md border-0 py-1.5 px-2 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 focus:ring-2 focus:ring-inset focus:outline-none focus:ring-primaryLight sm:text-sm sm:leading-6"
      >
        <input
          class="focus:outline-none w-full placeholder:text-gray-400 border-0 focus:ring-0 p-0"
          type="text"
          name="search"
          id="search"
          <%if(request.getParameter("search")!=null){%>
          value="<%= request.getParameter("search") %>"
          <%}%>
          placeholder="Search Product"
          required
        />
        <button><i class="fa-solid fa-magnifying-glass"></i></button>
      </form>
         </li>
         <li>
            <a href="<%=path%>products.jsp" class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
               <span class="flex-1 ms-3 whitespace-nowrap">All Products</span>
            </a>
         </li>
         <li>
            <a href="<%=path%>products.jsp?category=mens" class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
               <span class="flex-1 ms-3 whitespace-nowrap">Men's Shoes</span>
            </a>
         </li>
         <li>
            <a href="<%=path%>products.jsp?category=womens" class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
               <span class="flex-1 ms-3 whitespace-nowrap">Women's Shoes</span>
            </a>
         </li>
         <li>
            <a href="<%=path%>products.jsp?category=kids" class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
               <span class="flex-1 ms-3 whitespace-nowrap">Kid's Shoes</span>
            </a>
         </li>
         <li>
            <a href="<%=path%>products.jsp?brand=Nike" class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
               <span class="flex-1 ms-3 whitespace-nowrap">Nike</span>
            </a>
         </li>
         <li>
            <a href="<%=path%>products.jsp?brand=Adidas" class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
               <span class="flex-1 ms-3 whitespace-nowrap">Adidas</span>
            </a>
         </li>
         
         <%
             if(session.getAttribute("user")==null){
         %>
         <li>
            <a href="./signin.jsp" class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
               <svg class="flex-shrink-0 w-5 h-5 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 16">
                  <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M1 8h11m0 0L8 4m4 4-4 4m4-11h3a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2h-3"/>
               </svg>
               <span class="flex-1 ms-3 whitespace-nowrap">Sign In</span>
            </a>
         </li>
         <li>
            <a href="./signup.jsp" class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
               <svg class="flex-shrink-0 w-5 h-5 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
                  <path d="M5 5V.13a2.96 2.96 0 0 0-1.293.749L.879 3.707A2.96 2.96 0 0 0 .13 5H5Z"/>
                  <path d="M6.737 11.061a2.961 2.961 0 0 1 .81-1.515l6.117-6.116A4.839 4.839 0 0 1 16 2.141V2a1.97 1.97 0 0 0-1.933-2H7v5a2 2 0 0 1-2 2H0v11a1.969 1.969 0 0 0 1.933 2h12.134A1.97 1.97 0 0 0 16 18v-3.093l-1.546 1.546c-.413.413-.94.695-1.513.81l-3.4.679a2.947 2.947 0 0 1-1.85-.227 2.96 2.96 0 0 1-1.635-3.257l.681-3.397Z"/>
                  <path d="M8.961 16a.93.93 0 0 0 .189-.019l3.4-.679a.961.961 0 0 0 .49-.263l6.118-6.117a2.884 2.884 0 0 0-4.079-4.078l-6.117 6.117a.96.96 0 0 0-.263.491l-.679 3.4A.961.961 0 0 0 8.961 16Zm7.477-9.8a.958.958 0 0 1 .68-.281.961.961 0 0 1 .682 1.644l-.315.315-1.36-1.36.313-.318Zm-5.911 5.911 4.236-4.236 1.359 1.359-4.236 4.237-1.7.339.341-1.699Z"/>
               </svg>
               <span class="flex-1 ms-3 whitespace-nowrap">Sign Up</span>
            </a>
         </li>
         <%}else{%>
         
         <li>
            <a href="./user/" class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
               <i class="fa-solid fa-user"></i>
               <span class="flex-1 ms-3 whitespace-nowrap">Account</span>
            </a>
         </li>
         <li>
            <div href="#" class="logoutss cursor-pointer flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
               <i class="fa-solid fa-right-from-bracket"></i>
                <span class="flex-1 ms-3 whitespace-nowrap">Logout</span>
            </div>
         </li>
         
         <%}%>
      </ul>
   </div>
</div>
  
  <!-- clear all the lines after this -->
