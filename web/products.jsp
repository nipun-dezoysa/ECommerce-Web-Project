<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="mainPackage.DatabaseLogIn,mainPackage.Tools, models.*, java.util.ArrayList" %>
<%
    String query = Tools.makeProductsQuery(request.getParameter("search"),request.getParameter("category"),request.getParameter("brand"));
    DatabaseLogIn db = new DatabaseLogIn();
    ArrayList<Product> list = Tools.filterList(db.getAllProducts(query+"  ORDER BY `Id` DESC;"),request.getParameter("color"),request.getParameter("size"));
    
%>
<!DOCTYPE html>
<html>
  <head>
    <title>Search</title>
    <jsp:include page="./WEB-INF/components/Imports.jsp" />
  </head>
  <body>
    <jsp:include page="./WEB-INF/components/nav.jsp">
        <jsp:param name="search" value="<%=request.getParameter("search")%>"/>
    </jsp:include>

    <!-- content starts here-->

    <div class="main-container mb-5">
        <% if(request.getParameter("search")!=null){ %>
        <h1 class="text-3xl my-10">Displaying results for "<%=request.getParameter("search")%>".</h1>
        <% }else{ %>
        <h1 class="text-3xl my-10"><%= (request.getParameter("brand")!=null)? request.getParameter("brand") : "All" %> Shoes.</h1>
        <% } %>
        <div class="flex flex-col max-lg:flex-col-reverse lg:flex-row  w-full items-start">
          <form
            id="filter"
            class="w-full lg:w-[25%] border p-5 rounded-lg shadow flex flex-col gap-3"
          >
              
              <% if(request.getParameter("search")!=null){%>
              <input type="hidden" name="search" value="<%=request.getParameter("search")%>"/>
              <%}%>
              
            <h2 class="text-lg font-semibold">Shop by</h2>
            <div>
              <label
                for="category"
                class="block mb-1 text-sm font-medium text-gray-900"
                >Category</label
              >
              <select
                id="category"
                name="category"
                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
              >
                <%
                    String cat = (request.getParameter("category")!=null)? request.getParameter("category") : "any";
                %>
                <option value="any" <%= cat.equals("any")? "selected" : ""%>>Any Category</option>
                <option value="mens" <%= cat.equals("mens")? "selected" : ""%>>Men's Shoes</option>
                <option value="womens" <%= cat.equals("womens")? "selected" : ""%>>Women's Shoes</option>
                <option value="kids" <%= cat.equals("kids")? "selected" : ""%>>Kid's Shoes</option>
              </select>
            </div>
            <div>
              <label
                for="color"
                class="block mb-1 text-sm font-medium text-gray-900"
                >Color</label
              >
              <select
                id="color"
                name="color"
                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
              >
                <%
                    String col = (request.getParameter("color")!=null)? request.getParameter("color") : "any";
                %>
                <option value="any" <%= col.equals("any")? "selected" : ""%> >Any color</option>
                <%
                    ArrayList<String> colors = db.getAllColors();
                    for(String color:colors){
                %>
                <option value="<%= color %>" <%= col.equals(color)? "selected" : ""%> ><%= color %></option>
                <%}%>
              </select>
            </div>
            <div>
              <label
                for="brand"
                class="block mb-1 text-sm font-medium text-gray-900"
                >Brand</label
              >
              <select
                id="brand"
                name="brand"
                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
              >
                <%
                    String bra = (request.getParameter("brand")!=null)? request.getParameter("brand") : "any";
                %>
                <option value="any" <%= bra.equals("any")? "selected" : ""%>>Any Brand</option>
                <%
                    ArrayList<String> brands = db.getAllBrands();
                    for(String color:brands){
                %>
                <option value="<%= color %>" <%= bra.equals(color)? "selected" : ""%>  ><%= color %></option>
                <%}%>
              </select>
            </div>
            <div>
              <label class="block mb-1 text-sm font-medium text-gray-900"
                >Size</label
              >
              <div class="flex flex-wrap gap-1">
                
                <%
                    ArrayList<String> sizes = db.getAllSizes();
                    for(int i=0;i<sizes.size();i++){
                %>
                <div>
                  <input
                    type="radio"
                    name="size"
                    id="size<%= i %>"
                    class="hidden peer"
                    value="<%= sizes.get(i) %>"
                  />
                  <label
                    for="size<%= i %>"
                    class="peer-checked:bg-primary peer-checked:text-white hover:bg-primary hover:text-white duration-300 p-2.5 block bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg"
                    ><%= sizes.get(i) %></label
                  >
                </div>
                <%}%>
              </div>
            </div>
            <button
              type="submit"
              class="p-2.5 block bg-primary border border-gray-300 text-white hover:bg-primaryLight duration-300 text-sm rounded-lg"
            >
              Filter
            </button>
          </form>
          <div class="lg:w-[75%] lg:px-5 flex flex-col ">
            <% if(list.size()==0){ %>
            <div class="bg-gray-100 p-2 border-primary border-t-2 text-gray-400">No products were found matching your selection.</div>
            <%}else{ %>
            <p class="text-sm text-gray-400">Showing <%= list.size() %> results</p>
            <div class="flex flex-wrap gap-2 py-4 max-md:justify-around">
                <% for(Product pro : list){ %>
                    <jsp:include page="./WEB-INF/components/productCard.jsp">
                    <jsp:param name="id" value="<%= pro.getId()%>" />
                    </jsp:include>
                <% } %>
            </div>
            <%}%>
            <!-- Pagination -->
<!--            <nav class="flex items-center gap-x-1 justify-center">
              <button
                type="button"
                class="min-h-[38px] min-w-[38px] py-2 px-2.5 inline-flex justify-center items-center gap-x-1.5 text-sm rounded-lg text-gray-800 hover:bg-gray-100 focus:outline-none focus:bg-gray-100 disabled:opacity-50 disabled:pointer-events-none"
                disabled=""
              >
                <svg
                  class="flex-shrink-0 size-3.5"
                  xmlns="http://www.w3.org/2000/svg"
                  width="24"
                  height="24"
                  viewBox="0 0 24 24"
                  fill="none"
                  stroke="currentColor"
                  stroke-width="2"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                >
                  <path d="m15 18-6-6 6-6"></path>
                </svg>
                <span>Previous</span>
              </button>
              <div class="flex items-center gap-x-1">
                <button
                  type="button"
                  class="min-h-[38px] min-w-[38px] flex justify-center items-center bg-gray-200 text-gray-800 py-2 px-3 text-sm rounded-lg focus:outline-none focus:bg-gray-300 disabled:opacity-50 disabled:pointer-events-none"
                  aria-current="page"
                >
                  1
                </button>
                <button
                  type="button"
                  class="min-h-[38px] min-w-[38px] flex justify-center items-center text-gray-800 hover:bg-gray-100 py-2 px-3 text-sm rounded-lg focus:outline-none focus:bg-gray-100 disabled:opacity-50 disabled:pointer-events-none"
                >
                  2
                </button>
              </div>
              <button
                type="button"
                class="min-h-[38px] min-w-[38px] py-2 px-2.5 inline-flex justify-center items-center gap-x-1.5 text-sm rounded-lg text-gray-800 hover:bg-gray-100 focus:outline-none focus:bg-gray-100 disabled:opacity-50 disabled:pointer-events-none"
              >
                <span>Next</span>
                <svg
                  class="flex-shrink-0 size-3.5"
                  xmlns="http://www.w3.org/2000/svg"
                  width="24"
                  height="24"
                  viewBox="0 0 24 24"
                  fill="none"
                  stroke="currentColor"
                  stroke-width="2"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                >
                  <path d="m9 18 6-6-6-6"></path>
                </svg>
              </button>
            </nav>-->
            <!-- End Pagination -->
          </div>
        </div>
      </div>

    <!-- contents end here -->
   
    <jsp:include page="./WEB-INF/components/footer.jsp" />
    
    <script src="./js/products.js"></script>
    <script src="./js/wishlist.js"></script>
  </body>
</html>

<% db.closeDb(); %>