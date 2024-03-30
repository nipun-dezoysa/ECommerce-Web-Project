    <meta charset="UTF-8" />
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="./js/tailwindconfig.js"></script>
    <script src="https://kit.fontawesome.com/296e3cb483.js" crossorigin="anonymous"></script>
  </head>
  <body class="flex justify-center">
    <div class="relative w-full max-w-[1920px] min-h-screen flex flex-col">
      
<!--navbar code starts here-->
    <div class="bg-primary py-1 font-mono text-white flex justify-center">Just arrived. Hurry up!</div>
    <div class="sticky top-0 text-primary bg-white flex justify-between py-3 lg:px-[100px] md:px-[50px] px-5 w-full border-b">
      <a href="index.jsp" class="text-2xl font-bold text-primary">E-Commerce</a>
      <div class="flex items-center gap-5 max-sm:gap-3 relative">
        <div class="block flex items-center w-[200px] rounded-md border-0 py-1.5 px-2 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 focus:ring-2 focus:ring-inset focus:outline-none focus:ring-primaryLight sm:text-sm sm:leading-6">
          <input class="focus:outline-none w-full placeholder:text-gray-400" type="text" name="search" id="search" placeholder="Search Product" />
          <i class="fa-solid fa-magnifying-glass"></i>
        </div>
        <div class="border-r-2 h-[80%]"></div>
        <a href="#" class="flex items-center gap-2 hover:text-primaryLight">
          <div class="text-2xl"><i class="fa-solid fa-cart-shopping"></i></div>
          <div class="text-sm max-sm:hidden">
            <div>Cart</div>
            <div class="font-bold font-mono">Rs 13,000</div>
          </div>
        </a>
        <div class="border-r-2 h-[80%]"></div>
        <a href="#" class="flex items-center gap-2 hover:text-primaryLight">
          <div class="text-2xl"><i class="fa-solid fa-user"></i></div>
          <div class="text-sm max-sm:hidden">
            <div>User</div>
            <div class="font-bold font-mono">Account</div>
          </div>
        </a>
      </div>
    </div>
    
<!--navbar code end here-->