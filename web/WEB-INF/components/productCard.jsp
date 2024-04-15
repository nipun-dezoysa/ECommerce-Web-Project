<div
  class="rounded-xl overflow-hidden bg-white p-2 hover:shadow-md duration-300 shrink-0 border"
>
  <div
    class="w-[184px] h-[184px] relative overflow-hidden rounded-lg"
  >
    <img src="<%= request.getParameter("src") %>" alt="" class="w-full h-full"
    />
    <div
      class="absolute overflow-hidden group top-1 right-1 w-6 h-6 hover:top-0 hover:right-0 hover:w-full hover:h-full hover:rounded-none bg-gray-100 rounded-md flex justify-center items-center duration-300 ease-in-out"
    >
      <i class="fa-solid fa-info text-sm group-hover:hidden"></i>
      <div class="absolute invisible group-hover:visible text-sm text-gray-400">
        <div class="font-semibold">Colors</div>
        <div>White</div>
        <div>Black</div>
        <div>Brown</div>
      </div>
    </div>
  </div>
  <div class="max-md:text-sm font-semibold font-mono mt-1">
    <%= request.getParameter("name") %>
  </div>
  <div class="flex justify-between items-center mt-1">
    <div class="">
      <div class="flex text-xs gap-1">
        <div class="text-gray-600 line-through">LKR 2,500</div>
        <div class="bg-green-200 px-1 rounded-lg text-green-600">15%</div>
      </div>
      <div class="md:text-lg font-semibold">LKR 2,000</div>
    </div>
    <div class="w-10 h-10 flex justify-center items-center p-2   text-black group cursor-pointer hover:bg-gray-100  duration-300 ease-in-out"
    >
      <i class="fa-regular fa-heart group-hover:text-black group-hover:mb-2 duration-300 ease-in-out"></i>
    </div>
  </div>
</div>
