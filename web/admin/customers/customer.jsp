<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@page
import="mainPackage.DatabaseLogIn, models.*, java.util.ArrayList" %> <% String
id = request.getParameter("id"); if(id==null){
response.sendRedirect("./index.jsp"); }else{ DatabaseLogIn db = new
DatabaseLogIn(); %>
<!DOCTYPE html>
<html>
  <head>
    <title>user</title>
    <jsp:include page="../../WEB-INF/components/adminImports.jsp">
      <jsp:param name="path" value="../" />
    </jsp:include>
    <style type="text/tailwindcss">
      @layer utilities {
        .list-header {
          @apply flex justify-between text-center font-semibold text-sm;
        }
        .list-item {
          @apply flex items-center  border rounded-lg py-2 text-center text-xs lg:text-sm hover:bg-gray-200 duration-300 ease-in-out;
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

    <div class="flex gap-5">
      <div class="w-[40%] flex flex-col gap-5">
        <div class="box">
          <div class="py-2 px-5 border-b flex justify-between bg-gray-100">
            <div class="font-bold text-xl font-mono text-gray-600">
              Customer Details<span class="text-gray-400">#12</span>
            </div>
            <div class="flex items-center gap-2">
              <span class="flex w-3 h-3 bg-green-500 rounded-full"></span>Active
            </div>
          </div>
          <div class="p-5 flex">
            <div class="flex flex-col gap-3 mr-5">
              <div class="flex gap-10">
                <div>
                  <div class="text-gray-400 font-semibold">First Name</div>
                  <div>Nipun</div>
                </div>
                <div>
                  <div class="text-gray-400 font-semibold">Last Name</div>
                  <div>Nipun</div>
                </div>
              </div>
              <div>
                <div class="text-gray-400 font-semibold">Email</div>
                <div>nipun123@gmail.com</div>
              </div>
              <div>
                <div class="text-gray-400 font-semibold">Birth Date</div>
                <div>2001-02-15</div>
              </div>
            </div>
            <div class="pl-5 border-l flex flex-col gap-3">
              <div>
                <div class="text-gray-400 font-semibold">Phone Number</div>
                <div>0715348561</div>
              </div>
              <div>
                <div class="text-gray-400 font-semibold">Last Login</div>
                <div>2001-02-15</div>
              </div>
              <div>
                <div class="text-gray-400 font-semibold">Registered Date</div>
                <div>2001-02-15</div>
              </div>
            </div>
          </div>
        </div>
        <div class="bg-white p-5 rounded-lg text-sm flex flex-col gap-2">
          <div class="flex justify-between">
            <div class="text-gray-400">
              Reset customer account password to default password.
            </div>
            <div class="normal">Reset</div>
          </div>
          <div class="flex justify-between">
            <div class="text-gray-400">Block customer account.</div>
            <div class="remove">Block</div>
          </div>
        </div>
        <div class="box">
          <div class="box-title">Most Viewed</div>
          <div class="box-body">
            <div class="flex gap-3 font-semibold text-gray-400">
              <div>1.</div>
              <img
                src="../../img/demo.jpg"
                class="w-[100px] rounded-lg"
                alt=""
              />
              <div>
                <div>Nike Air Force 1</div>
                <div>#22</div>
                <div>
                  LKR 7,000
                  <span class="bg-green-200 rounded-full px-2 text-green-400"
                    >15%</span
                  >
                </div>
                <div>View Count <span class="text-gray-600">22</span></div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="w-[60%] flex flex-col gap-5">
        <div class="box">
          <div class="box-title">Orders</div>
          <div class="box-body">
            <div class="list-header">
              <div class="item-width">Date</div>
              <div class="item-width">Time</div>
              <div class="item-width">No of items</div>
              <div class="item-width">Amount</div>
              <div class="item-width">Status</div>
            </div>
            <a href="#" class="list-item">
              <div class="item-width">Date</div>
              <div class="item-width">Time</div>
              <div class="item-width">No of items</div>
              <div class="item-width">Amount</div>
              <div class="item-width">Status</div>
            </a>
            <div class="list-item justify-center">No Records Found</div>
          </div>
        </div>

        <div class="box">
          <div class="box-title">Address Book</div>
          <div class="box-body text-sm">
            <div class="border py-3 px-5 rounded-lg flex flex-col gap-3">
              <div class="flex gap-10">
                <div>
                  <div class="text-gray-400 font-semibold">First Name</div>
                  <div>Nipun</div>
                </div>
                <div>
                  <div class="text-gray-400 font-semibold">Last Name</div>
                  <div>Avishka</div>
                </div>
                <div>
                  <div class="text-gray-400 font-semibold">Email</div>
                  <div>nipunavishka123@gmail.com</div>
                </div>
                <div>
                  <div class="text-gray-400 font-semibold">Phone</div>
                  <div>0715348561</div>
                </div>
              </div>
              <div>
                <div class="text-gray-400 font-semibold">Address</div>
                <div>
                  Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                  Excepturi placeat libero, voluptates omnis explicabo dolorem
                  accusantium. Architecto tenetur optio maiores et excepturi
                  fuga quam, quos laboriosam commodi, quo nemo ex?
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <jsp:include page="../../WEB-INF/components/adminBottom.jsp" />
  </body>
</html>
<%}%>
