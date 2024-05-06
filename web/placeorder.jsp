<%@page import="mainPackage.Tools"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="mainPackage.DatabaseLogIn, models.*, java.util.ArrayList" %>
<% 
    if(session.getAttribute("cart")==null){
        response.sendRedirect("./cart.jsp");
    }else if(session.getAttribute("user")==null){
        session.setAttribute("logreq", "./placeorder.jsp");
        response.sendRedirect("./signin.jsp");
    }else{
        ArrayList<CartItem> cart = (ArrayList<CartItem>)session.getAttribute("cart");
        if(cart.size()==0)response.sendRedirect("./cart.jsp");
        DatabaseLogIn db = new DatabaseLogIn();   
        DecimalFormat formatter = new DecimalFormat("#,###.00");
        User user = (User)session.getAttribute("user");
        ArrayList<Address> addr = db.getAddresses(user.getId()+"");
%>
<!DOCTYPE html>
<html>
  <head>
    <title>Place Order</title>
    <jsp:include page="./WEB-INF/components/Imports.jsp" />
  </head>
  <body>
    <jsp:include page="./WEB-INF/components/nav.jsp" />

    <!-- content starts here-->

    <form id="order" class="main-container flex flex-col gap-2 lg:flex-row justify-evenly py-5">
      <div class="w-full lg:w-[60%] flex flex-col gap-3">
        <div class="flex justify-between">
          <h1 class="font-semibold text-2xl">Shipping Details</h1>
          <select class="text-gray-400 outline-none border-none focus:ring-0">
            <option disabled hidden selected>Choose from address book</option>
            <% for(int i=0;i<addr.size();i++){%>
            <option value="<%= i %>"><%= addr.get(i).getAddress().substring(0,25)+"..." %></option>
            <%}%>
          </select>
        </div>
        <div class="input-row">
          <div class="w-full">
            <label for="firstname" class="input-lable">First Name</label>
            <input
              type="text"
              name="firstname"
              id="firstname"
              class="inputs"
              required
              placeholder="Enter your first name"
            />
          </div>
          <div class="w-full">
            <label for="lastname" class="input-lable">Last Name</label>
            <input
              type="text"
              name="lastname"
              id="lastname"
              class="inputs"
              required
              placeholder="Enter your last name"
            />
          </div>
        </div>
        <div class="input-row">
          <div class="w-full">
            <label for="email" class="input-lable">Email Address</label>
            <input
              type="email"
              name="email"
              id="email"
              class="inputs"
              required
              placeholder="Enter your email"
            />
          </div>
          <div class="w-full">
            <label for="phone" class="input-lable">Mobile Phone Number</label>
            <input
              type="text"
              name="phone"
              id="phone"
              class="inputs"
              required
              placeholder="Enter your phone number"
            />
          </div>
        </div>
        <div class="w-full">
          <label for="address" class="input-lable">Address</label>
          <input
            type="text"
            name="address"
            id="address"
            class="inputs"
            required
            placeholder="Enter your address"
          />
        </div>
        <div class="input-row">
          <div class="w-full">
            <label for="city" class="input-lable">Town/City</label>
            <input
              type="text"
              name="city"
              id="city"
              class="inputs"
              required
              placeholder="Enter your Town/City"
            />
          </div>
          <div class="w-full">
            <label for="province" class="input-lable">Province</label>
            <input
              type="text"
              name="province"
              id="province"
              class="inputs"
              required
              placeholder="Enter your Province"
            />
          </div>
        </div>
        <div class="w-full">
          <label for="note" class="input-lable">Note</label>
          <textarea
            class="inputs resize-none"
            name="note"
            id="note"
            cols="30"
            rows="5"
            placeholder="Enter your note here..."
          ></textarea>
        </div>
        <div>
          <input type="checkbox" name="add" id="add" value="ok" />
          <label class="text-gray-400" for="add"
            >Save this address to my address book</label
          >
        </div>
      </div>
      <div class="w-full lg:w-[27%]">
        <div
          class="border shadow border-gray-300 rounded-lg flex flex-col gap-3 p-5"
        >
          <h1>My Orders</h1>

          <%
            double total = 0;
            for(int i=0;i<cart.size();i++){ 
            Product product = db.getProduct(cart.get(i).getId()+"");
            total+= product.getDisPrice() * cart.get(i).getQuantity();
            String[] res = db.getColorSize(cart.get(i).getColor(), cart.get(i).getSize());
          %>
          <div class="flex text-sm">
            <div class="w-[10%] font-semibold font-mono"><%= cart.get(i).getQuantity() %>x</div>
            <div class="w-[50%] text-gray-400 font-semibold">
                <%= product.getName() %> <br>
                <%= res[0]+" "+res[1] %>
            </div>
            <div class="w-[40%] text-end font-semibold font-mono">
                LKR <%= formatter.format(product.getDisPrice()*cart.get(i).getQuantity()) %>
            </div>
          </div>
          <% } %>

          <div
            class="text-sm border-t border-b py-3 flex flex-col gap-3 font-semibold"
          >
            <div class="flex justify-between">
              <div class="text-gray-400">Subtotal</div>
              <div class="font-mono">LKR <%= formatter.format(total) %></div>
            </div>
            <div class="flex justify-between">
              <div class="text-gray-400">Shipping</div>
              <div class="font-mono">LKR 30.00</div>
            </div>
          </div>
          <div class="flex justify-between items-center">
            <div class="font-semibold">Order Total</div>
            <div class="font-bold text-xl text-primary font-mono">
              LKR <%= formatter.format(total+30) %>
            </div>
          </div>
          <button
            class="py-3 bg-primary rounded-lg text-white font-semibold"
            type="submit"
          >
            PLACE ORDER
          </button>
            <a href="./cart.jsp" class="text-sm w-full text-center font-semibold">back to cart</a>  
        </div>
      </div>
    </form>

    <!-- contents end here -->

    <jsp:include page="./WEB-INF/components/footer.jsp" />

    <script>
      var address = <%= Tools.getAddressArray(addr) %>;
    </script>
    <script src="./js/placeOrder.js"></script>
  </body>
</html>
<% db.closeDb(); %>
<% } %>