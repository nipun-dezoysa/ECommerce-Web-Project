<%@page import="java.text.DecimalFormat"%>
<%@page import="mainPackage.DatabaseLogIn, models.*, java.util.ArrayList" %>
<% 
    ArrayList<CartItem> cart;
         if(session.getAttribute("cart")==null){
             cart = new ArrayList<CartItem>();
         }else{
             cart = (ArrayList<CartItem>)session.getAttribute("cart");
         }
    DatabaseLogIn db = new DatabaseLogIn();   
    DecimalFormat formatter = new DecimalFormat("#,###.00");
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
<%
    double total = 0;
    for(int i=0;i<cart.size();i++){ 
    Product product = db.getProduct(cart.get(i).getId()+"");
    total+= product.getDisPrice() * cart.get(i).getQuantity();
%>
        <div
          class="w-full border shadow border-gray-300 rounded-lg flex items-center py-2 px-4 gap-5"
        >
          <img class="w-[100px] rounded-lg aspect-square" src="./img/products/<%= product.getImg1() %>" alt="" />
          <div class="w-full h-full flex flex-col">
            <div class="flex justify-between font-semibold text-xl">
              <h1 class="text-gray-600"><%= product.getName() %></h1>
              <div class="text-gray-300">SKU <%= product.getId() %></div>
            </div>
            <div class="flex w-full h-full justify-between">
              <div class="flex flex-col justify-end">
                
                <% if(product.getDiscount()>0 && product.getDiscount()<=100){ %>  
                <div class="text-sm flex gap-1">
                    <div class="line-through text-gray-700">LKR <%= product.getformatPrice() %></div>
                  <div class="bg-green-200 rounded-full px-2 text-green-600"><%= product.getDiscount() %>%</div>
                </div>
                <div class="text-xl font-mono text-gray-700">LKR <%= product.getformatDis() %></div>
                <%}else{%>
                <div class="text-xl font-mono text-gray-700">LKR <%= product.getformatPrice() %></div>
                <%}%>
                
              </div>
              <div class="flex flex-col justify-end">
                 
                <%
                    String[] res = db.getColorSize(cart.get(i).getColor(), cart.get(i).getSize());
                %>  
                  
                <div>
                  Color:
                  <span class="font-semibold font-mono text-gray-600"
                    ><%= res[0] %></span
                  >
                </div>
                <div>
                  Size:
                  <span class="font-semibold font-mono text-gray-600"><%= res[1] %></span>
                </div>
              </div>
              <div class="flex flex-col justify-end">
                <div class="flex items-center gap-2">
                  <div
                    class="border-2 rounded-lg flex items-center w-[110px] h-[40px] px-2 justify-between text-gray-500"
                  >
                    <form class="quentforms">
                        <input type="hidden" name="quantity" value="<%= (cart.get(i).getQuantity()-1) %>"/>
                        <input type="hidden" name="id" value="<%= cart.get(i).getId() %>"/>
                        <input type="hidden" name="color" value="<%= cart.get(i).getColor() %>"/>
                        <input type="hidden" name="size" value="<%= cart.get(i).getSize() %>"/>
                        <button
                      type="<%= cart.get(i).getQuantity()>1? "submit" : "button" %>"
                      onclick="updateQuantity('add','quantity','no')"
                    >
                      <i class="fa-solid fa-minus"></i>
                    </button>
                    </form>
                    <div id="no"><%= cart.get(i).getQuantity() %></div>
                    <form class="quentforms">
                        <input type="hidden" name="quantity" value="<%= (cart.get(i).getQuantity()+1) %>"/>
                        <input type="hidden" name="id" value="<%= cart.get(i).getId() %>"/>
                        <input type="hidden" name="color" value="<%= cart.get(i).getColor() %>"/>
                        <input type="hidden" name="size" value="<%= cart.get(i).getSize() %>"/>
                        <button
                      type="submit"
                      onclick="updateQuantity('add','quantity','no')"
                    >
                      <i class="fa-solid fa-plus"></i>
                    </button>
                    </form>
                  </div>
                    <form class="remforms" action="removeFromCart" method="POST">
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
            <div class="font-bold text-xl font-mono">LKR <%= formatter.format(total) %></div>
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
    
    <script>    
      $(document).ready(function () {
        $(".remforms").submit(function (e) {
          e.preventDefault();
          var formData = new FormData(this);
          Swal.fire({
  title: "Are you sure?",
  text: "Are you sure you want to remove the following product from the cart?",
  icon: "warning",
  showCancelButton: true,
  confirmButtonColor: "#3085d6",
  cancelButtonColor: "#d33",
  confirmButtonText: "Yes, remove it!"
}).then((result) => {
  if (result.isConfirmed) {
    $.ajax({
              type: "POST",
              url: "removeFromCart",
              data: formData,
              processData: false,
              contentType: false,
              success: function (response) {
                location.reload();
              },
              error: function (xhr, status, error) {
                console.error(xhr.responseText);
              },
            });
  }
});
            
        });
        
        $(".quentforms").submit(function (e) {
          e.preventDefault();
          var formData = new FormData(this);
            $.ajax({
              type: "POST",
              url: "addToCart",
              data: formData,
              processData: false,
              contentType: false,
              success: function (response) {
                location.reload();
              },
              error: function (xhr, status, error) {
                console.error(xhr.responseText);
              },
            });
        });
      });
      
    </script>
  </body>
</html>
