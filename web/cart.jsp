<%@page import="models.CartItem, java.util.ArrayList" %>
<% 
    ArrayList<CartItem> cart;
         if(session.getAttribute("cart")==null){
             cart = new ArrayList<CartItem>();
         }else{
             cart = (ArrayList<CartItem>)session.getAttribute("cart");
         }
%>
<!DOCTYPE html>
<html>
  <head>
    <title>Cart</title>
    <jsp:include page="./WEB-INF/components/Imports.jsp" />
  </head>
  <body>
    <jsp:include page="./WEB-INF/components/nav.jsp" />

    <div class="main-container flex justify-evenly py-5">
      <div class="w-[60%] flex flex-col gap-3">
        <div
          class="w-full font-semibold border shadow border-gray-300 rounded-lg flex items-center p-5 justify-between text-sm"
        >
          <div class="flex items-center gap-5 text-lg">My Cart</div>
          <div class="flex">
            <a class="text-primary pr-5 border-r-2" href="#">UPDATE CART</a>
            <div class="text-primary pl-5" type="submit"><%=cart.size()%> Items</div>
          </div>
        </div>
<% for(int i=0;i<cart.size();i++){ %>
        <div
          class="w-full border shadow border-gray-300 rounded-lg flex items-center py-2 px-4 gap-5"
        >
          <img class="w-[100px] rounded-lg" src="./img/demo.jpg" alt="" />
          <div class="w-full h-full flex flex-col">
            <div class="flex justify-between font-semibold text-xl">
              <h1 class="text-gray-600">Nike Air Jordan 2</h1>
              <div class="text-gray-300">SKU 12</div>
            </div>
            <div class="flex w-full h-full justify-between">
              <div class="flex flex-col justify-end">
                <div class="text-sm">
                  LKR 3,000
                  <span class="bg-green-200 rounded-full px-2 text-green-600"
                    >15%</span
                  >
                </div>
                <div class="text-xl font-mono text-gray-700">LKR 2,500</div>
              </div>
              <div class="flex flex-col justify-end">
                <div>
                  Color:
                  <span class="font-semibold font-mono text-gray-600"
                    >Black</span
                  >
                </div>
                <div>
                  Size:
                  <span class="font-semibold font-mono text-gray-600">44</span>
                </div>
              </div>
              <div class="flex flex-col justify-end">
                <div class="flex items-center gap-2">
                  <div
                    class="border-2 rounded-lg flex items-center w-[110px] h-[40px] px-2 justify-between text-gray-500"
                  >
                    <input
                      id="quantity"
                      type="hidden"
                      name="quantity"
                      value="1"
                    />
                    <button
                      type="button"
                      onclick="updateQuantity('rem','quantity','no')"
                    >
                      <i class="fa-solid fa-minus"></i>
                    </button>
                    <div id="no"><%= cart.get(i).getQuantity() %></div>
                    <button
                      type="button"
                      onclick="updateQuantity('add','quantity','no')"
                    >
                      <i class="fa-solid fa-plus"></i>
                    </button>
                  </div>
                  <form action="removeFromCart" method="POST">
                    <input type="hidden" name="id" value="<%= i %>">
                    <button
                    type="submit"
                    class="w-[40px] h-[40px] bg-red-500 rounded-lg text-white"
                  >
                    <i class="fa-solid fa-trash"></i>
                  </button>
                  </form>
                  <button
                    type="button"
                    class="w-[40px] h-[40px] border-2 rounded-lg text-gray-500"
                  >
                    <i class="fa-solid fa-heart"></i>
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>

<% } %>
      </div>
      <div class="w-[25%]">
        <div
          class="w-full border shadow border-gray-300 rounded-lg flex flex-col gap-3 p-5"
        >
          <h1 class="font-semibold">Shopping Summary</h1>
          <div class="flex items-center justify-between">
            <div class="font-semibold">Total</div>
            <div class="font-bold text-xl font-mono">LKR 13,000</div>
          </div>
          <button
            class="py-3 bg-primary rounded-lg text-white font-semibold"
            type="submit"
          >
            CHECKOUT
          </button>
          <a href="#" class="font-semibold text-sm text-center"
            >Back to Shopping</a
          >
        </div>
      </div>
    </div>

    <jsp:include page="./WEB-INF/components/footer.jsp" />
  </body>
</html>
