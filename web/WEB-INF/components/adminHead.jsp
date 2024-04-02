<%-- 
    Document   : adminHead
    Created on : Apr 2, 2024, 2:09:41 PM
    Author     : Nipun
--%>

<meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="../js/tailwindconfig.js"></script>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
      integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <style type="text/tailwindcss">
      @layer utilities {
        .inputs {
          @apply border rounded-lg p-2 outline-primary w-full;
        }
      }
    </style>
  </head>
  <body>
    <div class="flex min-h-screen">
      <div class="bg-primary w-[19%] py-5 flex flex-col">
        <div class="w-full flex flex-col items-center">
          <a class="w-[70%]" href="../"><img class="w-full" src="../img/2.png" alt="logo" /></a>
          <p class="text-white font-mono">Admin Dashboard</p>
        </div>
        <div class="px-5 text-white mt-10 flex flex-col">
          <a class="flex items-center py-2 px-3 hover:bg-primaryLight rounded-lg" href="./"
            ><i class="fa-solid fa-compass text-2xl w-10"></i>
            <div>Dashboard</div></a
          >
          <a class="flex items-center py-2 px-3 hover:bg-primaryLight rounded-lg" href="#"
            ><i class="fa-solid fa-bag-shopping text-2xl w-10"></i>
            <div>Orders</div></a
          >
          <a class="flex items-center py-2 px-3 hover:bg-primaryLight rounded-lg" href="./products"
            ><i class="fa-solid fa-tags text-2xl w-10"></i>
            <div>Products</div></a
          >
          <a class="flex items-center py-2 px-3 hover:bg-primaryLight rounded-lg" href="#"
            ><i class="fa-solid fa-person text-2xl w-10"></i>
            <div>Customers</div></a
          >
          <a class="flex items-center py-2 px-3 hover:bg-primaryLight rounded-lg" href="#"
            ><i class="fa-solid fa-user-tie text-2xl w-10"></i>
            <div>Administration</div></a
          >
        </div>
        <div class="px-5 text-white mt-auto flex flex-col">
          <a class="flex items-center py-2 px-3 hover:bg-primaryLight rounded-lg" href="#"
            ><i class="fa-solid fa-circle-info text-2xl w-10"></i>
            <div>Admin Pannel v 1.0</div></a
          >
        </div>
      </div>
      <div class="bg-gray-200 w-[81%] flex flex-col">
        <div class="bg-white py-5 px-10 flex justify-between">
          <div class="flex items-center">
            <i class="fa-solid fa-magnifying-glass gap-3"></i>
            <input
              class="focus:outline-none w-full placeholder:text-gray-400 border-0 focus:ring-0"
              type="text"
              name="search"
              id="search"
              placeholder="Search..."
            />
          </div>
          <div class="flex items-center gap-3">
            <div class="flex flex-col justify-center">
              <a class="font-semibold text-gray-500" href="#">Admin</a>
              <a class="text-red-700 font-mono" href="#">Log Out</a>
            </div>
            <div
              class="bg-gray-200 rounded-full w-12 h-12 flex items-center justify-center text-gray-400"
            >
              <i class="fa-regular fa-user"></i>
            </div>
          </div>
        </div>
        <div class="p-5">
          <!-- body strat here -->