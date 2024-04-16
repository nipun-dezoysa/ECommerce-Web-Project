<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <title>Orders</title>
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
              >Orders</span
            >
          </div>
        </li>
      </ol>
    </nav>

    <div class="flex flex-col lg:flex-row gap-5">
      <div class="lg:w-[50%] flex flex-col gap-5">
        <div class="box">
          <div class="box-title">New Orders</div>
          <div class="box-body">
            <div class="flex justify-between text-center font-semibold text-sm">
              <div class="w-[20%]">Order ID</div>
              <div class="w-[20%]">User</div>
              <div class="w-[20%]">Date</div>
              <div class="w-[20%]">Amount</div>
              <div class="w-[20%]">Action</div>
            </div>
            <div class="flex flex-col gap-1">
              
              <div
                class="flex items-center border rounded-lg py-2 justify-between text-center font-semibold text-sm"
              >
                <div class="w-[20%]">#22</div>
                <a href="#" class="w-[20%] line-clamp-1"
                  >nipunavishka@gmail.com</a
                >
                <div class="w-[20%]">2024/02/15</div>
                <div class="w-[20%]">LKR 18000.00</div>
                <div class="w-[20%] flex justify-center">
                  <a
                    href="#"
                    class="bg-primary px-2 py-1 rounded-lg text-white"
                  >
                    <i class="fa-solid fa-eye"></i>
                  </a>
                </div>
              </div>
              <div
                class="flex items-center border rounded-lg py-2 justify-center text-center font-semibold text-sm"
              >
                No Records found
              </div>
            </div>
          </div>
        </div>
        <div class="box">
          <div class="box-title">Accepted Orders</div>
          <div class="box-body">
            <div class="flex justify-between text-center font-semibold text-sm">
              <div class="w-[20%]">Order ID</div>
              <div class="w-[20%]">User</div>
              <div class="w-[20%]">Date</div>
              <div class="w-[20%]">Amount</div>
              <div class="w-[20%]">Action</div>
            </div>
            <div class="flex flex-col gap-1">
              <div
                class="flex items-center border rounded-lg py-2 justify-between text-center font-semibold text-sm"
              >
                <div class="w-[20%]">#22</div>
                <a href="#" class="w-[20%] line-clamp-1"
                  >nipunavishka@gmail.com</a
                >
                <div class="w-[20%]">2024/02/15</div>
                <div class="w-[20%]">LKR 18000.00</div>
                <div class="w-[20%] flex justify-center">
                  <a
                    href="#"
                    class="bg-primary px-2 py-1 rounded-lg text-white"
                  >
                    <i class="fa-solid fa-eye"></i>
                  </a>
                </div>
              </div>
              <div
                class="flex items-center border rounded-lg py-2 justify-center text-center font-semibold text-sm"
              >
                No Records found
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="lg:w-[50%] flex flex-col gap-5">
        <div class="box">
          <div class="box-title">Shipped Orders</div>
          <div class="box-body">
            <div class="flex justify-between text-center font-semibold text-sm">
              <div class="w-[20%]">Order ID</div>
              <div class="w-[20%]">User</div>
              <div class="w-[20%]">Date</div>
              <div class="w-[20%]">Amount</div>
              <div class="w-[20%]">Action</div>
            </div>
            <div class="flex flex-col gap-1">
              <div
                class="flex items-center border rounded-lg py-2 justify-between text-center font-semibold text-sm"
              >
                <div class="w-[20%]">#22</div>
                <a href="#" class="w-[20%] line-clamp-1"
                  >nipunavishka@gmail.com</a
                >
                <div class="w-[20%]">2024/02/15</div>
                <div class="w-[20%]">LKR 18000.00</div>
                <div class="w-[20%] flex justify-center">
                  <a
                    href="#"
                    class="bg-primary px-2 py-1 rounded-lg text-white"
                  >
                    <i class="fa-solid fa-eye"></i>
                  </a>
                </div>
              </div>
              <div
                class="flex items-center border rounded-lg py-2 justify-center text-center font-semibold text-sm"
              >
                No Records found
              </div>
            </div>
          </div>
        </div>
        <div class="box">
          <div class="box-title">cancelled Orders</div>
          <div class="box-body">
            <div class="flex justify-between text-center font-semibold text-sm">
              <div class="w-[20%]">Order ID</div>
              <div class="w-[20%]">User</div>
              <div class="w-[20%]">Date</div>
              <div class="w-[20%]">Amount</div>
              <div class="w-[20%]">Action</div>
            </div>
            <div class="flex flex-col gap-1">
              <div
                class="flex items-center border rounded-lg py-2 justify-between text-center font-semibold text-sm"
              >
                <div class="w-[20%]">#22</div>
                <a href="#" class="w-[20%] line-clamp-1"
                  >nipunavishka@gmail.com</a
                >
                <div class="w-[20%]">2024/02/15</div>
                <div class="w-[20%]">LKR 18000.00</div>
                <div class="w-[20%] flex justify-center">
                  <a
                    href="#"
                    class="bg-primary px-2 py-1 rounded-lg text-white"
                  >
                    <i class="fa-solid fa-eye"></i>
                  </a>
                </div>
              </div>
              <div
                class="flex items-center border rounded-lg py-2 justify-center text-center font-semibold text-sm"
              >
                No Records found
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <jsp:include page="../../WEB-INF/components/adminBottom.jsp" />
  </body>
</html>
