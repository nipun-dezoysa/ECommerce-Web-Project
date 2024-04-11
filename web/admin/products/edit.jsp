<%-- Document : products Created on : Apr 2, 2024, 11:53:55 PM Author : Nipun
--%> <%@page contentType="text/html" pageEncoding="UTF-8"%>
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
              >Nike Air 1</span
            >
          </div>
        </li>
      </ol>
    </nav>

    <div class="flex gap-3">
      <div class="w-[70%] flex flex-col gap-3">
        <form action="#" method="POST" class="box w-full">
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
                required
              />
            </div>
            <div>
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
            <div class="flex w-full gap-3">
              <div class="w-[50%]">
                <div class="input-lable">Price (LKR)</div>
                <input
                  class="inputs"
                  type="text"
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
                  type="text"
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
                class="w-[150px] h-[150px] overflow-hidden rounded-lg font-semibold relative group"
              >
                <input type="hidden" name="pid" value="#" />
                <input type="hidden" name="choice" value="#" />
                <img
                  id="1img"
                  class="w-full h-full"
                  src="../../img/demo.jpg"
                  alt="product"
                />
                <div
                  class="absolute bottom-[-25%] text-center w-full p-1 bg-gray-200 font-mono group-hover:bottom-0 duration-300 ease-in-out"
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
                class="w-[150px] h-[150px] overflow-hidden rounded-lg font-semibold relative group"
              >
                <input type="hidden" name="pid" value="#" />
                <input type="hidden" name="choice" value="#" />
                <img
                  id="2img"
                  class="w-full h-full"
                  src="../../img/demo.jpg"
                  alt="product"
                />
                <div
                  class="absolute bottom-[-25%] text-center w-full p-1 bg-gray-200 font-mono group-hover:bottom-0 duration-300 ease-in-out"
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
                class="w-[150px] h-[150px] overflow-hidden rounded-lg font-semibold relative group"
              >
                <input type="hidden" name="pid" value="#" />
                <input type="hidden" name="choice" value="#" />
                <img
                  id="3img"
                  class="w-full h-full"
                  src="../../img/demo.jpg"
                  alt="product"
                />
                <div
                  class="absolute bottom-[-25%] text-center w-full p-1 bg-gray-200 font-mono group-hover:bottom-0 duration-300 ease-in-out"
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
                class="w-[150px] h-[150px] overflow-hidden rounded-lg font-semibold relative group"
              >
                <input type="hidden" name="pid" value="#" />
                <input type="hidden" name="choice" value="#" />
                <img
                  id="4img"
                  class="w-full h-full"
                  src="../../img/demo.jpg"
                  alt="product"
                />
                <div
                  class="absolute bottom-[-25%] text-center w-full p-1 bg-gray-200 font-mono group-hover:bottom-0 duration-300 ease-in-out"
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

      <div class="w-[30%] flex flex-col gap-3">
        <div class="box">
          <div class="box-title">Sizes</div>
          <div class="box-body">
            <form action="#" method="POST">
              <div class="flex gap-2">
                <input type="hidden" name="size" value="XL" />
                <div
                  class="py-2.5 px-5 w-full bg-gray-200 rounded-lg font-semibold"
                >
                  XL
                </div>
                <input class="remove" type="submit" value="Remove" />
              </div>
            </form>
            <form action="#" method="POST">
              <div class="flex flex-col items-center gap-1">
                <input
                  type="text"
                  class="inputs"
                  id="size"
                  name="size"
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
            <form action="#" method="POST">
              <div class="flex gap-2">
                <input type="hidden" name="color" value="Black" />
                <div
                  class="py-2.5 px-5 w-full bg-gray-200 rounded-lg font-semibold"
                >
                  Black
                </div>
                <input class="remove" type="submit" value="Remove" />
              </div>
            </form>
            <form action="#" method="POST">
              <div class="flex gap-2">
                <input type="hidden" name="color" value="Black" />
                <div
                  class="py-2.5 px-5 w-full bg-gray-200 rounded-lg font-semibold"
                >
                  White
                </div>
                <input class="remove" type="submit" value="Remove" />
              </div>
            </form>
            <form action="#" method="POST">
              <div class="flex flex-col items-center gap-1">
                <input
                  type="text"
                  class="inputs"
                  id="color"
                  name="color"
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
    <script src="../../js/productEdit.js"></script>
    <jsp:include page="../../WEB-INF/components/adminBottom.jsp" />
  </body>
</html>
