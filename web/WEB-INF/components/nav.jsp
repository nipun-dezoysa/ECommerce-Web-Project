    <meta charset="UTF-8" />
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
    <script src="./js/tailwindconfig.js"></script>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
      integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
  </head>
  <body class="flex justify-center">
    <div class="relative w-full max-w-[1920px] min-h-screen flex flex-col">
      
<!--navbar code starts here-->
    <div class="bg-primary py-1 font-mono text-white flex justify-center z-50">Just arrived. Hurry up!</div>
    <div class="sticky top-0 text-primary bg-white flex justify-between items-center py-3 lg:px-[100px] md:px-[50px] px-5 w-full border-b z-50">
      <a href="index.jsp"><img class="h-[30px] lg:h-[40px]" src="./img/1.png" alt=""></a>
      <div class="flex items-center gap-5 max-sm:gap-3 relative">
        <div class="block flex items-center w-[200px] rounded-md border-0 py-1.5 px-2 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 focus:ring-2 focus:ring-inset focus:outline-none focus:ring-primaryLight sm:text-sm sm:leading-6">
          <input class="focus:outline-none w-full placeholder:text-gray-400 border-0 focus:ring-0 p-0" type="text" name="search" id="search" placeholder="Search Product" />
          <i class="fa-solid fa-magnifying-glass"></i>
        </div>
        <div class="border-r-2 h-[80%]"></div>
        <a href="checkout.jsp" class="flex items-center gap-2 hover:text-primaryLight">
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