<% String admin = (String)session.getAttribute("admin"); 
    if(admin == null){
%>

<jsp:include page="../../WEB-INF/components/adminLogin.jsp"/>
<%}else{%>
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
%> 
<!DOCTYPE html>
<html>
  <head>
    <title>Products</title>
    <jsp:include page="../../WEB-INF/components/adminImports.jsp">
      <jsp:param name="path" value="../" />
    </jsp:include>
  </head>
  <body>
    <jsp:include page="../../WEB-INF/components/adminHead.jsp">
      <jsp:param name="path" value="../" />
      <jsp:param name="no" value="3" />
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
        <li>
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
            <a
              href="./"
              class="ms-1 text-sm font-medium text-gray-700 hover:text-blue-600 md:ms-2 dark:text-gray-400 dark:hover:text-white"
              >Products</a
            >
          </div>
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
              >#<%= id%></span
            >
          </div>
        </li>
      </ol>
    </nav>

    <div class="flex flex-col md:flex-row gap-3">
      <div class="w-full md:w-[70%] flex flex-col gap-3">
          <form id="mainform"  method="POST" class="box w-full">
          <input type="hidden" name="pid" value="<%= id %>"/>
          <div class="box-title">Product Details</div>
          <div class="box-body">
            <div>
              <div class="input-lable">Name</div>
              <input
                class="inputs"
                type="text"
                name="name"
                id="name"
                placeholder="Product Name"
                value="<%= pr.getName() %>"
                required
              />
            </div>
            <div class="flex w-full gap-3">
              <div class="w-[50%]">
                <div class="input-lable">Brand</div>
                <input
                  class="inputs"
                  type="text"
                  name="brand"
                  id="brand"
                  value="<%= pr.getBrand() %>"
                  placeholder="Brand Name"
                  required
                />
              </div>
              <div class="w-[50%]">
                <div class="input-lable">Type</div>
                <select class="inputs pr-5" name="type" id="type">
                  <option value="1" <%= pr.getType()==1? "selected" : "" %>>Men Shoe</option>
                  <option value="2" <%= pr.getType()==2? "selected" : "" %>>Women Shoe</option>
                  <option value="3" <%= pr.getType()==3? "selected" : "" %>>Kid Shoe</option>
                </select>
              </div>
            </div>
            <div class="flex w-full gap-3">
              <div class="w-[50%]">
                <div class="input-lable">Price (LKR)</div>
                <input
                  class="inputs"
                  type="number"
                  name="price"
                  id="price"
                  placeholder="Product Price"
                  value="<%= pr.getPrice() %>"
                  required
                />
              </div>
              <div class="w-[50%]">
                <div class="input-lable">Discount (%)</div>
                <input
                  class="inputs"
                  type="number"
                  name="discount"
                  id="discount"
                  placeholder="Discount Percentage"
                  value="<%= pr.getDiscount() %>"
                  required
                />
              </div>
            </div>
            <div>
              <div class="input-lable">Description</div>
              <textarea
                class="inputs resize-none"
                name="des"
                id="description"
                cols="30"
                rows="5"
                placeholder="Product Description"
                required
              ><%= pr.getDes() %></textarea>
            </div>
            <input
              class="normal w-[200px]"
              type="submit"
              value="Save Changes"
            />
          </div>
        </form>
        <div class="box">
          <div class="box-title">Images</div>
          <div class="box-body">
            <div class="flex gap-3">
              <form
                action="#"
                method="POST"
                enctype="multipart/form-data"
                class="imgclass w-[25%] md:w-[150px] aspect-square flex flex-col items-center justify-center overflow-hidden rounded-lg font-semibold relative group"
              >
                <input type="hidden" name="pid" value="<%= id %>" />
                <input type="hidden" name="choice" value="img01" />
                <img
                  id="1img"
                  class="w-full h-auto"
                  src="../../img/products/<%= pr.getImg1() %>"
                  alt="product"
                />
                <div
                  class="absolute bottom-[-100%] md:bottom-[-25%] text-center w-full p-1 bg-gray-200 font-mono group-hover:bottom-0 duration-300 ease-in-out"
                >
                  Select Image
                </div>
                <input
                  required
                  accept="image/png, image/gif, image/jpeg"
                  type="file"
                  name="img"
                  class="absolute top-0 w-full h-full opacity-0"
                  onchange="loadFile(event,'1')"
                />
                <div
                  id="1ok"
                  class="absolute invisible top-2 right-2 p-1 bg-gray-200 rounded-full w-7 h-7 flex items-center justify-center hover:bg-green-500 hover:text-white"
                >
                  <i class="fa-solid fa-check"></i>
                  <input
                    class="w-full h-full absolute opacity-0 cursor-pointer"
                    type="submit"
                  />
                </div>
              </form>

              <form
                action="#"
                method="POST"
                enctype="multipart/form-data"
                class="imgclass w-[25%] md:w-[150px] aspect-square flex flex-col items-center justify-center overflow-hidden rounded-lg font-semibold relative group"
              >
                <input type="hidden" name="pid" value="<%= id %>" />
                <input type="hidden" name="choice" value="img02" />
                <img
                  id="2img"
                  class="w-full h-auto"
                  src="../../img/products/<%= pr.getImg2() %>"
                  alt="product"
                />
                <div
                  class="absolute bottom-[-100%] md:bottom-[-25%] text-center w-full p-1 bg-gray-200 font-mono group-hover:bottom-0 duration-300 ease-in-out"
                >
                  Select Image
                </div>
                <input
                  required
                  accept="image/png, image/gif, image/jpeg"
                  type="file"
                  name="img"
                  class="absolute top-0 w-full h-full opacity-0"
                  onchange="loadFile(event,'2')"
                />
                <div
                  id="2ok"
                  class="absolute invisible top-2 right-2 p-1 bg-gray-200 rounded-full w-7 h-7 flex items-center justify-center hover:bg-green-500 hover:text-white"
                >
                  <i class="fa-solid fa-check"></i>
                  <input
                    class="w-full h-full absolute opacity-0 cursor-pointer"
                    type="submit"
                  />
                </div>
              </form>

              <form
                action="#"
                method="POST"
                enctype="multipart/form-data"
                class="imgclass w-[25%] md:w-[150px] aspect-square flex flex-col items-center justify-center overflow-hidden rounded-lg font-semibold relative group"
              >
                <input type="hidden" name="pid" value="<%= id %>" />
                <input type="hidden" name="choice" value="img03" />
                <img
                  id="3img"
                  class="w-full h-auto"
                  src="../../img/products/<%= pr.getImg3() %>"
                  alt="product"
                />
                <div
                  class="absolute bottom-[-100%] md:bottom-[-25%] text-center w-full p-1 bg-gray-200 font-mono group-hover:bottom-0 duration-300 ease-in-out"
                >
                  Select Image
                </div>
                <input
                  required
                  accept="image/png, image/gif, image/jpeg"
                  type="file"
                  name="img"
                  class="absolute top-0 w-full h-full opacity-0"
                  onchange="loadFile(event,'3')"
                />
                <div
                  id="3ok"
                  class="absolute invisible top-2 right-2 p-1 bg-gray-200 rounded-full w-7 h-7 flex items-center justify-center hover:bg-green-500 hover:text-white"
                >
                  <i class="fa-solid fa-check"></i>
                  <input
                    class="w-full h-full absolute opacity-0 cursor-pointer"
                    type="submit"
                  />
                </div>
              </form>

              <form
                action="#"
                method="POST"
                enctype="multipart/form-data"
                class="imgclass w-[25%] md:w-[150px] aspect-square flex flex-col items-center justify-center overflow-hidden rounded-lg font-semibold relative group"
              >
                <input type="hidden" name="pid" value="<%= id %>" />
                <input type="hidden" name="choice" value="img04" />
                <img
                  id="4img"
                  class="w-full h-auto"
                  src="../../img/products/<%= pr.getImg4() %>"
                  alt="product"
                />
                <div
                  class="absolute bottom-[-100%] md:bottom-[-25%] text-center w-full p-1 bg-gray-200 font-mono group-hover:bottom-0 duration-300 ease-in-out"
                >
                  Select Image
                </div>
                <input
                  required
                  accept="image/png, image/gif, image/jpeg"
                  type="file"
                  name="img"
                  class="absolute top-0 w-full h-full opacity-0"
                  onchange="loadFile(event,'4')"
                />
                <div
                  id="4ok"
                  class="absolute invisible top-2 right-2 p-1 bg-gray-200 rounded-full w-7 h-7 flex items-center justify-center hover:bg-green-500 hover:text-white"
                >
                  <i class="fa-solid fa-check"></i>
                  <input
                    class="w-full h-full absolute opacity-0 cursor-pointer"
                    type="submit"
                  />
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>

      <div class="w-full md:w-[30%] flex flex-col gap-3">
        <div class="box">
          <div class="box-title">Sizes</div>
          <div class="box-body">
              
            <% for(int i=0;i<pr.getSizes().size();i++){ %>  
            <form class="ssforms" method="POST">
              <div class="flex gap-2">
                <input type="hidden" name="value" value="<%= pr.getSizes().get(i).getId() %>" />
                <div
                  class="py-2.5 px-5 w-full bg-gray-200 rounded-lg font-semibold"
                >
                    <%= pr.getSizes().get(i).getValue() %>
                </div>
                <input class="remove" type="submit" value="Remove" />
              </div>
            </form>
            <%}%>  
              
            <form id="sizeadd" action="#" method="POST">
              <div class="flex flex-col items-center gap-1">
                <input type="hidden" name="pid" value="<%= id %>" />
                <input
                  type="number"
                  class="inputs"
                  id="id"
                  name="value"
                  placeholder="type size"
                  required
                />
                <input type="submit" value="Add" class="normal w-full" />
              </div>
            </form>
          </div>
        </div>
        <div class="box">
          <div class="box-title">Colors</div>
          <div class="box-body">
            
            <% for(int i=0;i<pr.getColors().size();i++){ %>  
            <form class="ccforms" method="POST">
              <div class="flex gap-2">
                <input type="hidden" name="value" value="<%= pr.getColors().get(i).getId() %>" />
                <div
                  class="py-2.5 px-5 w-full bg-gray-200 rounded-lg font-semibold"
                >
                    <%= pr.getColors().get(i).getValue() %>
                </div>
                <input class="remove" type="submit" value="Remove" />
              </div>
            </form>
            <%}%>
            <form id="coloradd" method="POST">
              <div class="flex flex-col items-center gap-1">
                <input type="hidden" name="pid" value="<%= id %>" />
                <input
                  type="text"
                  class="inputs"
                  id="color"
                  name="value"
                  placeholder="type color"
                  required
                />
                <input type="submit" value="Add" class="normal w-full" />
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    <script src="./js/edit.js"></script>
    <jsp:include page="../../WEB-INF/components/adminBottom.jsp" />
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
}
%> 