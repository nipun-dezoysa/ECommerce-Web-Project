<%-- Document : products Created on : Apr 2, 2024, 11:53:55 PM Author : Nipun
--%> <%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Products</title>

    <jsp:include page="../WEB-INF/components/adminHead.jsp" />

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
        <div class="flex gap-3">
          <div class="w-[70%] flex flex-col gap-3">
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
            <div class="flex w-full gap-3">
              <div class="w-[50%]">
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
              <div class="w-[50%]">
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
            <div class="w-full flex gap-3">
              <div class="w-full">
                <div>Sizes</div>
                <div class="flex items-center gap-1">
                  <input type="text" class="inputs" id="size" placeholder="type size"/>
                  <input
                    type="button"
                    value="Add"
                    id="sadd"
                    class="normal"
                  />
                  <input
                    type="button"
                    value="Undo"
                    id="sdelete"
                    class="remove"
                  />
                </div>
                <div class="w-full flex flex-wrap gap-1 mt-1" id="sblock"></div>
              </div>
              <div class="w-full">
                <div>Colors</div>
                <div class="flex items-center gap-1">
                  <input type="text" class="inputs" id="color" placeholder="type color"/>
                  <input
                    type="button"
                    value="Add"
                    id="cadd"
                    class="normal"
                  />
                  <input
                    type="button"
                    value="Undo"
                    id="cdelete"
                    class="remove
                </div>
                <div class="w-full flex flex-wrap gap-1 mt-1" id="cblock"></div>
              </div>
            </div>
          </div>
          <div class="w-[30%] flex flex-col gap-3">
            <div>
              <div>Cover Image</div>
              <input
                class="image"
                type="file"
                name="cimage"
                id="cimage"
                accept="image/png, image/gif, image/jpeg"
                required
              />
            </div>
            <div>
              <div>Image 1</div>
              <input
                class="image"
                type="file"
                name="image1"
                id="image1"
                accept="image/png, image/gif, image/jpeg"
                required
              />
            </div>
            <div>
              <div>Image 2</div>
              <input
                class="image"
                type="file"
                name="image2"
                id="image2"
                accept="image/png, image/gif, image/jpeg"
                required
              />
            </div>
            <div>
              <div>Image 3</div>
              <input
                class="image"
                type="file"
                name="image3"
                id="image3"
                accept="image/png, image/gif, image/jpeg"
                required
              />
            </div>
          </div>
        </div>
        <input
          class="normal mt-3 w-[200px]"
          type="submit"
          value="Add Product"
        />
      </form>
    </div>

    <jsp:include page="../WEB-INF/components/adminBottom.jsp" />
