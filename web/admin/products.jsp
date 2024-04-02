<%-- 
    Document   : products
    Created on : Apr 2, 2024, 11:53:55 PM
    Author     : Nipun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Products</title>

        <jsp:include page="../WEB-INF/components/adminHead.jsp"/>
        
        <div class="bg-white rounded-lg border flex flex-col">
            <div class="font-bold text-xl font-mono py-2 px-5 border-b">
              New Product
            </div>
            <form
              action="../addProduct"
              method="POST"
              id="pform"
              enctype="multipart/form-data"
              class="p-5 flex flex-col"
            >
              <div class="flex gap-5">
                <div class="w-[70%] flex flex-col gap-5">
                  <div>
                    <div>Name</div>
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
                    <div>Description</div>
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
                  <div class="w-full flex gap-5">
                    <div class="w-full">
                      <div>Sizes</div>
                      <div class="flex">
                        <input type="text" class="inputs" id="size" />
                        <input
                          type="button"
                          value="Add"
                          id="sadd"
                          class="ml-1 bg-primary text-white px-3 py-1 rounded-lg"
                        />
                        <input
                          type="button"
                          value="Undo"
                          id="sdelete"
                          class="ml-1 bg-red-900 text-white px-3 py-1 rounded-lg"
                        />
                      </div>
                      <div
                        class="w-full flex flex-wrap gap-1 mt-1"
                        id="sblock"
                      ></div>
                    </div>
                    <div class="w-full">
                      <div>Colors</div>
                      <div class="flex">
                        <input type="text" class="inputs" id="color" />
                        <input
                          type="button"
                          value="Add"
                          id="cadd"
                          class="ml-1 bg-primary text-white px-3 py-1 rounded-lg"
                        />
                        <input
                          type="button"
                          value="Undo"
                          id="cdelete"
                          class="ml-1 bg-red-900 text-white px-3 py-1 rounded-lg"
                        />
                      </div>
                      <div
                        class="w-full flex flex-wrap gap-1 mt-1"
                        id="cblock"
                      ></div>
                    </div>
                  </div>
                </div>
                <div class="w-[30%] flex flex-col gap-5">
                  <div>
                    <div>Brand</div>
                    <input
                      class="inputs"
                      type="text"
                      name="brand"
                      id="brand"
                      placeholder="Brand Name"
                      required
                    />
                  </div>
                  <div>
                    <div>Price (LKR)</div>
                    <input
                      class="inputs"
                      type="text"
                      name="price"
                      id="price"
                      placeholder="Product Price"
                      required
                    />
                  </div>
                  <div>
                    <div>Discount (%)</div>
                    <input
                      class="inputs"
                      type="text"
                      name="discount"
                      id="discount"
                      placeholder="Discount Percentage"
                      required
                    />
                  </div>
                  <div>
                    <div>Image</div>
                    <input
                      class="block w-full border border-gray-200 rounded-lg focus:z-10 focus:border-blue-500 focus:ring-blue-500 disabled:opacity-50 disabled:pointer-events-none file:bg-gray-50 file:border-0 file:me-4 file:py-2 file:px-2"
                      type="file"
                      name="pimage"
                      id="pimage"
                      accept="image/png, image/gif, image/jpeg"
                      required
                    />
                  </div>
                </div>
              </div>
              <input class="bg-primary text-white px-3 py-1 rounded-lg w-[150px] mt-5 cursor" type="submit" value="Add Product" />
            </form>
          </div>
        
        <jsp:include page="../WEB-INF/components/adminBottom.jsp"/>
