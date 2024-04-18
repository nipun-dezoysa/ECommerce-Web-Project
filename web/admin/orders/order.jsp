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
              >Orders</a
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
      
    <div class="flex flex-col md:flex-row gap-5 w-full items-start">
      <div class="box w-full md:w-[70%]">
        <div class="px-5 py-2 flex border-b">
          <div>
            <div class="flex gap-2">
              <div class="font-semibold">
                Order <span class="text-gray-400">#<%= order.getId() %></span>
              </div>
              <%
                  String c="";
                  String stt = "";
                  if(order.getStatus()==1){
                      c="text-xs rounded-full bg-yellow-200 text-yellow-400 px-2 py-1";
                      stt="New";
                  }else if(order.getStatus()==2){
                      c="text-xs rounded-full bg-purple-200 text-purple-400 px-2 py-1";
                      stt="Inprogress";
                  }else if(order.getStatus()==3){
                      c="text-xs rounded-full bg-blue-200 text-blue-400 px-2 py-1";
                      stt="Shipped";
                  }else if(order.getStatus()==4){
                      c="text-xs rounded-full bg-green-200 text-green-400 px-2 py-1";
                      stt="Completed";
                  }else{
                      c="text-xs rounded-full bg-red-200 text-red-400 px-2 py-1";
                      stt="Canceled";
                  }
              %>
              <div
                class="<%= c %>"
              >
                <%= stt %>
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
             <% for(int i=0;i<order.getItems().size();i++){ %> 
            <div
              class="flex justify-between text-xs text-center border py-2 rounded-lg"
            >
                <div class="w-[10%]"><%= order.getItems().get(i).getPid() %></div>
              <div class="w-[10%]"><%= order.getItems().get(i).getName() %></div>
              <div class="w-[10%]"><%= order.getItems().get(i).getColor() %></div>
              <div class="w-[10%]"><%= order.getItems().get(i).getSize() %></div>
              <div class="w-[10%] max-md:hidden"><%= order.getItems().get(i).getformatPrice() %></div>
              <div class="w-[10%]"><%= order.getItems().get(i).getQuantity() %></div>
              <div class="w-[10%] max-md:hidden"><%= order.getItems().get(i).getDiscount() %></div>
              <div class="w-[10%]"><%= order.getItems().get(i).getformatTotal() %></div>
            </div>
            <%}%>
          </div>
          <div class="flex flex-col md:flex-row gap-2 justify-between">
            <div class="w-full md:w-[60%] text-gray-400">
              <h1 class="font-semibold">Other Notes</h1>
              <p class="text-sm">
                <%= order.getNote() %>
              </p>
            </div>
            <div class="w-full md:w-[30%]">
              <div
                class="text-gray-400 font-semibold text-sm flex justify-between"
              >
                <div>Subtotal</div>
                <div>LKR <%= order.getTotal() %></div>
              </div>
              <div
                class="text-gray-400 font-semibold text-sm flex justify-between"
              >
                <div>Shipping</div>
                <div>LKR 30.00</div>
              </div>
              <div
                class="text-gray-400 font-semibold flex justify-between border-t pt-2 mt-2"
              >
                <div>Total</div>
                <div>LKR <%= order.getFTotal() %></div>
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
              <div><%= order.getName() %></div>
            </div>
            <div class="flex">
              <div class="w-[20%] font-semibold">Phone:</div>
              <div class="w-[80%]"><%= order.getPhone() %></div>
            </div>
            <div class="flex">
              <div class="w-[20%] font-semibold">Email:</div>
              <div class="w-[80%]"><%= order.getEmail() %></div>
            </div>
            <div class="flex">
              <div class="w-[20%] font-semibold">Address:</div>
              <div class="w-[80%]">
                <%= order.getAddress() %>
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
                <div class="text-sm"><%= order.getUser().getEmail() %></div>
              </div>
            </a>
          </div>
        </div>
        <div class="box">
          <div class="box-title">Status</div>
          <div class="box-body">
              <form id="formss" action="../../orderStatus" method="POST">
                  <input type="hidden" name="id" value="<%= order.getId() %>"/>
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
    
    <script>    
      $(document).ready(function () {
        $("#formss").submit(function (e) {
          e.preventDefault();
          var formData = new FormData(this);
          Swal.fire({
            title: "Are you sure?",
            text: "Are you sure you want to change the status of order?",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Yes, change it!"
          }).then((result) => {
            if (result.isConfirmed) {
              $.ajax({
              type: "POST",
              url: "../../orderStatus",
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
    });
      
    </script>
    
  </body>
</html>
<%}%>