<% String admin = (String)session.getAttribute("admin"); 
    if(admin == null){
%>

<jsp:include page="../../WEB-INF/components/adminLogin.jsp"/>
<%}else{%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="mainPackage.DatabaseLogIn, models.Product, java.util.ArrayList" %>
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
              >Products</span
            >
          </div>
        </li>
      </ol>
    </nav>

    <div class="box">
      <div class="box-title">New Product</div>
      <form id="pform" class="box-body" enctype="multipart/form-data">
        <div class="flex flex-col lg:flex-row gap-3">
          <div class="w-full lg:w-[70%] flex flex-col gap-3">
            <div>
              <div class="input-lable">Name</div>
              <input
                class="inputs"
                type="text"
                name="name"
                id="name"
                placeholder="Product Name"
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
                  placeholder="Brand Name"
                  required
                />
              </div>
              <div class="w-[50%]">
                <div class="input-lable">Type</div>
                <select class="inputs pr-5" name="type" id="type">
                  <option value="1">Men Shoe</option>
                  <option value="2">Women Shoe</option>
                  <option value="3">Kid Shoe</option>
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
              ></textarea>
            </div>
            <div class="w-full">
              <div class="input-lable">Images</div>
              <div class="flex gap-3">
                <div
                  class="w-[25%] md:w-[150px] aspect-square flex flex-col items-center justify-center overflow-hidden rounded-lg font-semibold relative group"
                >
                  <img
                    id="cimg"
                    class="w-full h-auto"
                    src="../../img/demo.jpg"
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
                    name="cimage"
                    id="cimage"
                    class="absolute top-0 w-full h-full opacity-0"
                    onchange="loadFile(event,'cimg')"
                  />
                </div>

                <div
                  class="w-[25%] md:w-[150px] aspect-square flex flex-col items-center justify-center overflow-hidden rounded-lg font-semibold relative group"
                >
                  <img
                    id="1img"
                    class="w-full h-auto"
                    src="../../img/demo.jpg"
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
                    name="image1"
                    id="image1"
                    class="absolute top-0 w-full h-full opacity-0"
                    onchange="loadFile(event,'1img')"
                  />
                </div>

                <div
                  class="w-[25%] md:w-[150px] aspect-square flex flex-col items-center justify-center overflow-hidden rounded-lg font-semibold relative group"
                >
                  <img
                    id="2img"
                    class="w-full h-auto"
                    src="../../img/demo.jpg"
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
                    name="image2"
                    id="image2"
                    class="absolute top-0 w-full h-full opacity-0"
                    onchange="loadFile(event,'2img')"
                  />
                </div>

                <div
                  class="w-[25%] md:w-[150px] aspect-square flex flex-col items-center justify-center overflow-hidden rounded-lg font-semibold relative group"
                >
                  <img
                    id="3img"
                    class="w-full h-auto"
                    src="../../img/demo.jpg"
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
                    name="image3"
                    id="image3"
                    class="absolute top-0 w-full h-full opacity-0"
                    onchange="loadFile(event,'3img')"
                  />
                </div>
              </div>
            </div>
          </div>
          <div class="w-full lg:w-[30%] flex flex-col gap-3">
            <div class="w-full flex flex-col gap-1">
              <div class="input-lable">Sizes</div>
              <div class="w-full flex flex-wrap gap-1" id="sblock"></div>
              <input
                type="number"
                class="inputs"
                id="size"
                placeholder="type size"
              />
              <div class="flex items-center gap-1">
                <input
                  type="button"
                  value="Add"
                  id="sadd"
                  class="normal w-full"
                />
                <input type="button" value="Undo" id="sdelete" class="remove" />
              </div>
            </div>
            <div class="w-full flex flex-col gap-1">
              <div class="input-lable">Colors</div>
              <div class="w-full flex flex-wrap gap-1" id="cblock"></div>
              <input
                type="text"
                class="inputs"
                id="color"
                placeholder="type color"
              />
              <div class="flex items-center gap-1">
                <input
                  type="button"
                  value="Add"
                  id="cadd"
                  class="normal w-full"
                />
                <input type="button" value="Undo" id="cdelete" class="remove" />
              </div>
            </div>
          </div>
        </div>
        <input class="normal w-[200px]" type="submit" value="Add Product" />
      </form>
    </div>

    <div class="box">
      <div class="box-title">All Products</div>
      <div class="box-body">
        <div class="max-md:hidden flex w-full font-semibold rounded-lg">
          
          <div class="w-[30%] md:w-[25%]  text-center"></div>
          <div class="w-[65%]  flex gap-2">
          <div class="w-[25%] text-center max-md:hidden">Brand</div>
          <div class="w-[25%] text-center">Price</div>
          <div class="w-[25%] text-center max-md:hidden">Discount</div> 
          <div class="w-[25%] text-center max-md:hidden">Availability</div>
          </div>
          
          <div class="w-[20%] text-center"></div>
        </div>
        
          <!--all product item-->
        <% 
            DatabaseLogIn db = new DatabaseLogIn();
            ArrayList<Product> prods = db.getAllProducts(" ORDER BY Id DESC");
            for(int i=0;i<prods.size();i++){
        %>
        <div class="flex w-full border rounded-lg items-center p-1">
          <div class="w-[70%] md:w-[25%] flex gap-1 items-center">
            <img
              class="w-[70px] aspect-square block rounded-lg"
              src="../../img/products/<%= prods.get(i).getImg1() %>"
              alt="product"
            />
            <div >
                <a href="../../product.jsp?id=<%= prods.get(i).getId() %>"class="font-semibold"><%= prods.get(i).getName() %></a>
              <div class="text-gray-400 text-sm">#<%= prods.get(i).getId() %></div>
            </div>
          </div>
          <div class="flex gap-2 w-[30%] md:w-[65%] max-md:hidden">
            <div class="w-[25%] text-center"><%= prods.get(i).getBrand() %></div>
            <div class="w-[25%] text-center">LKR <%= prods.get(i).getPrice() %></div>
            <div class="w-[25%] text-center"><%= prods.get(i).getDiscount() %>%</div>
            <div class="w-[25%] text-center">available</div>
          </div>
          <div class="flex justify-end gap-2 w-[30%] md:w-[20%]">
            <a class="normal" type="button" href="edit.jsp?id=<%= prods.get(i).getId() %>"><i class="fa-solid fa-pen-to-square"></i></a>
            <form class="dform" id="d<%= prods.get(i).getId() %>" action="deleteProduct" method="POST">
                <input type="hidden" name="id" value="<%= prods.get(i).getId() %>"/>
                <button type="submit" class="remove"><i class="fa-solid fa-trash"></i></button>
            </form>
          </div>
        </div>
        <% } %>  
        <% db.closeDb(); %>
      </div>
    </div>

    <jsp:include page="../../WEB-INF/components/adminBottom.jsp" />
    <script src="./js/colorsSizes.js"></script>
    <script src="./js/newProduct.js"></script>
  </body>
</html>
<%}%>