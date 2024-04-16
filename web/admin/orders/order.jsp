<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="mainPackage.DatabaseLogIn, models.*, java.util.ArrayList" %> 
<% 
    String id = request.getParameter("id");
    if(id==null){
        response.sendRedirect("./index.jsp");
    }else{
    DatabaseLogIn db = new DatabaseLogIn(); 
    Order order = db.getOrder(Integer.parseInt(id));
%>
<!DOCTYPE html>
<html>
  <head>
    <title>Orders</title>
    <jsp:include page="../../WEB-INF/components/adminImports.jsp">
      <jsp:param name="path" value="../" />
    </jsp:include>
    <style type="text/tailwindcss">
      @layer utilities {
        .list-header {
          @apply flex justify-between text-center font-semibold text-sm;
        }
        .list-item {
          @apply flex items-center border rounded-lg py-2 text-center text-xs hover:bg-gray-200 duration-300 ease-in-out;
        }
        .item-width {
          @apply w-[20%];
        }
      }
    </style>
  </head>
  <body>
    <jsp:include page="../../WEB-INF/components/adminHead.jsp">
      <jsp:param name="path" value="../" />
    </jsp:include>
    <div class="flex flex-col md:flex-row gap-5 w-full items-start">
      <div class="box w-full md:w-[70%]">
        <div class="px-5 py-2 flex border-b">
          <div>
            <div class="flex gap-2">
              <div class="font-semibold">
                Order <span class="text-gray-400">#<%= order.getId() %></span>
              </div>
              <%
                  String c;
                  switch(order.getStatus()){
                      case (1) : c="text-xs rounded-full bg-yellow-200 text-yellow-400 px-2 py-1";break;
                      case (2) : c="text-xs rounded-full bg-purple-200 text-purple-400 px-2 py-1";break;
                      case (3) : c="text-xs rounded-full bg-blue-200 text-blue-400 px-2 py-1";break;
                      case (4) : c="text-xs rounded-full bg-green-200 text-green-400 px-2 py-1";break;
                      case (5) : c="text-xs rounded-full bg-red-200 text-red-400 px-2 py-1";break;
                  }
              %>
              <div
                class="text-xs rounded-full bg-green-200 text-green-400 px-2 py-1"
              >
                Completed
              </div>
            </div>
                <div class="text-xs"><%= order.getDate().substring(0,16) %></div>
          </div>
        </div>
        <div class="box-body">
          <div class="flex justify-between text-sm font-semibold text-center">
            <div class="w-[10%]">SKU</div>
            <div class="w-[10%]">Name</div>
            <div class="w-[10%]">Color</div>
            <div class="w-[10%]">Size</div>
            <div class="w-[10%] max-md:hidden">Each Price</div>
            <div class="w-[10%]">Quentity</div>
            <div class="w-[10%] max-md:hidden">Discount</div>
            <div class="w-[10%]">Total</div>
          </div>
          <div class="gap-1 flex flex-col">
            <div
              class="flex justify-between text-xs text-center border py-2 rounded-lg"
            >
              <div class="w-[10%]">SKU</div>
              <div class="w-[10%]">Name</div>
              <div class="w-[10%]">Color</div>
              <div class="w-[10%]">Size</div>
              <div class="w-[10%] max-md:hidden">Each Price</div>
              <div class="w-[10%]">Quentity</div>
              <div class="w-[10%] max-md:hidden">Discount</div>
              <div class="w-[10%]">Total</div>
            </div>
          </div>
          <div class="flex flex-col md:flex-row gap-2 justify-between">
            <div class="w-full md:w-[60%] text-gray-400">
              <h1 class="font-semibold">Other Notes</h1>
              <p class="text-sm">
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Eum
                perspiciatis pariatur distinctio quisquam quod atque veritatis
                cum aspernatur ipsa officiis minima voluptatem, alias ea soluta.
                Eum illum facere perferendis hic.
              </p>
            </div>
            <div class="w-full md:w-[30%]">
              <div
                class="text-gray-400 font-semibold text-sm flex justify-between"
              >
                <div>Subtotal</div>
                <div>LKR 22,500.00</div>
              </div>
              <div
                class="text-gray-400 font-semibold text-sm flex justify-between"
              >
                <div>Subtotal</div>
                <div>LKR 22,500.00</div>
              </div>
              <div
                class="text-gray-400 font-semibold flex justify-between border-t pt-2 mt-2"
              >
                <div>Subtotal</div>
                <div>LKR 22,500.00</div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="w-full md:w-[30%] flex flex-col gap-5">
        <div class="box">
          <div class="box-title">Shipping Details</div>
          <div class="box-body text-sm">
            <div class="flex">
              <div class="w-[20%] font-semibold">Name:</div>
              <div>Nipun Avishka</div>
            </div>
            <div class="flex">
              <div class="w-[20%] font-semibold">Phone:</div>
              <div class="w-[80%]">Nipun Avishka</div>
            </div>
            <div class="flex">
              <div class="w-[20%] font-semibold">Email:</div>
              <div class="w-[80%]">Nipun Avishka</div>
            </div>
            <div class="flex">
              <div class="w-[20%] font-semibold">Address:</div>
              <div class="w-[80%]">
                Lorem ipsum dolor sit amet consectetur, adipisicing elit. Quis,
                placeat! Nisi, repellendus fugit? Tenetur iure?
              </div>
            </div>
          </div>
        </div>
        <div class="box">
          <div class="box-title">Customer Details</div>
          <div class="box-body">
            <a
              href="#"
              class="flex gap-2 items-center hover:bg-gray-200 p-2 rounded-lg duration-300 ease-in-out"
            >
              <div><i class="fa-regular fa-user text-3xl"></i></div>
              <div>
                <div class="font-semibold">Nipun Avishka</div>
                <div class="text-sm">nipunavishka123@gmail.com</div>
              </div>
            </a>
          </div>
        </div>
        <div class="box">
          <div class="box-title">Status</div>
          <div class="box-body">
            <form action="#">
              <select name="status" id="status" class="inputs">
                <option value="2">Inprogress</option>
                <option value="3">Shipped</option>
                <option value="4">Completed</option>
                <option value="5">Canceled</option>
              </select>
              <input
                type="submit"
                class="bg-primary text-white p-2 w-full rounded-lg mt-2"
                value="Save Changes"
              />
            </form>
          </div>
        </div>
      </div>
    </div>
    <jsp:include page="../../WEB-INF/components/adminBottom.jsp" />
  </body>
</html>
<%}%>