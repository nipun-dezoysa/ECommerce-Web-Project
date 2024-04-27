<!DOCTYPE html>
<html>
  <head>
    <title>Search</title>
    <jsp:include page="./WEB-INF/components/Imports.jsp" />
  </head>
  <body>
    <jsp:include page="./WEB-INF/components/nav.jsp" />

    <!-- content starts here-->

    <div class="main-container mb-5">
        <h1 class="text-3xl my-10">Displaying results for "call of duty 4".</h1>
        <div class="flex w-full">
          <form
            id="filter"
            class="w-[25%] border p-5 rounded-lg shadow flex flex-col gap-3"
          >
            <h2 class="text-lg font-semibold">Shop by</h2>
            <div>
              <label
                for="category"
                class="block mb-1 text-sm font-medium text-gray-900"
                >Category</label
              >
              <select
                id="category"
                name="category"
                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
              >
                <option selected>Any country</option>
                <option value="men">Men's Shoes</option>
                <option value="women">Men's Shoes</option>
                <option value="kid">Men's Shoes</option>
              </select>
            </div>
            <div>
              <label
                for="color"
                class="block mb-1 text-sm font-medium text-gray-900"
                >Color</label
              >
              <select
                id="color"
                name="color"
                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
              >
                <option selected>Any color</option>
                <option value="men">Men's Shoes</option>
                <option value="women">Men's Shoes</option>
                <option value="kid">Men's Shoes</option>
              </select>
            </div>
            <div>
              <label
                for="brand"
                class="block mb-1 text-sm font-medium text-gray-900"
                >Brand</label
              >
              <select
                id="brand"
                name="brand"
                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
              >
                <option selected>Any Brand</option>
                <option value="men">Men's Shoes</option>
                <option value="women">Men's Shoes</option>
                <option value="kid">Men's Shoes</option>
              </select>
            </div>
            <div>
              <label class="block mb-1 text-sm font-medium text-gray-900"
                >Size</label
              >
              <div class="flex flex-wrap gap-1">
                <div>
                  <input
                    type="radio"
                    name="size"
                    id="size"
                    class="hidden peer"
                  />
                  <label
                    for="size"
                    class="peer-checked:bg-primary peer-checked:text-white hover:bg-primary hover:text-white duration-300 p-2.5 block bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg"
                    >44</label
                  >
                </div>
                <div>
                  <input
                    type="radio"
                    name="size"
                    id="size"
                    class="hidden peer"
                  />
                  <label
                    for="size"
                    class="peer-checked:bg-primary peer-checked:text-white hover:bg-primary hover:text-white duration-300 p-2.5 block bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg"
                    >44</label
                  >
                </div>
              </div>
            </div>
            <button
              type="submit"
              class="p-2.5 block bg-primary border border-gray-300 text-white hover:bg-primaryLight duration-300 text-sm rounded-lg"
            >
              Filter
            </button>
          </form>
          <div class="w-[75%] px-5 flex flex-col">
            <p class="text-sm text-gray-400">Showing 1?12 of 28 results</p>
            <div></div>
            <!-- Pagination -->
            <nav class="flex items-center gap-x-1 justify-center">
              <button
                type="button"
                class="min-h-[38px] min-w-[38px] py-2 px-2.5 inline-flex justify-center items-center gap-x-1.5 text-sm rounded-lg text-gray-800 hover:bg-gray-100 focus:outline-none focus:bg-gray-100 disabled:opacity-50 disabled:pointer-events-none"
                disabled=""
              >
                <svg
                  class="flex-shrink-0 size-3.5"
                  xmlns="http://www.w3.org/2000/svg"
                  width="24"
                  height="24"
                  viewBox="0 0 24 24"
                  fill="none"
                  stroke="currentColor"
                  stroke-width="2"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                >
                  <path d="m15 18-6-6 6-6"></path>
                </svg>
                <span>Previous</span>
              </button>
              <div class="flex items-center gap-x-1">
                <button
                  type="button"
                  class="min-h-[38px] min-w-[38px] flex justify-center items-center bg-gray-200 text-gray-800 py-2 px-3 text-sm rounded-lg focus:outline-none focus:bg-gray-300 disabled:opacity-50 disabled:pointer-events-none"
                  aria-current="page"
                >
                  1
                </button>
                <button
                  type="button"
                  class="min-h-[38px] min-w-[38px] flex justify-center items-center text-gray-800 hover:bg-gray-100 py-2 px-3 text-sm rounded-lg focus:outline-none focus:bg-gray-100 disabled:opacity-50 disabled:pointer-events-none"
                >
                  2
                </button>
              </div>
              <button
                type="button"
                class="min-h-[38px] min-w-[38px] py-2 px-2.5 inline-flex justify-center items-center gap-x-1.5 text-sm rounded-lg text-gray-800 hover:bg-gray-100 focus:outline-none focus:bg-gray-100 disabled:opacity-50 disabled:pointer-events-none"
              >
                <span>Next</span>
                <svg
                  class="flex-shrink-0 size-3.5"
                  xmlns="http://www.w3.org/2000/svg"
                  width="24"
                  height="24"
                  viewBox="0 0 24 24"
                  fill="none"
                  stroke="currentColor"
                  stroke-width="2"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                >
                  <path d="m9 18 6-6-6-6"></path>
                </svg>
              </button>
            </nav>
            <!-- End Pagination -->
          </div>
        </div>
      </div>

    <!-- contents end here -->
   
    <jsp:include page="./WEB-INF/components/footer.jsp" />
  </body>
</html>

