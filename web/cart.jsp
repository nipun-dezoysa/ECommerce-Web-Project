<!DOCTYPE html>
<html>
  <head>
    <title>Cart</title>
    <jsp:include page="./WEB-INF/components/Imports.jsp" />
  </head>
  <body>
    <div class="frameBox">
      <jsp:include page="./WEB-INF/components/nav.jsp" />

      <div class="container mx-auto mt-10">
        <div class="flex flex-col md:flex-row shadow-md my-10">
          <div class="w-full md:w-3/4 bg-white px-10 py-10">
            <div class="flex justify-between border-b pb-8">
              <h1 class="font-semibold text-xl">Shopping Cart</h1>
              <h2 class="font-semibold text-xl">3 Items</h2>
            </div>

            <div
              class="md:flex items-stretch py-8 md:py-10 lg:py-8 border-t border-gray-50"
            >
              <div class="md:w-4/12 2xl:w-1/4 w-full">
                <img
                  src="data:image/jpeg;base64,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"
                  alt="Black Leather Purse"
                  class="h-full object-center object-cover md:block hidden"
                />
                <img
                  src="https://www.google.com/imgres?imgurl=https%3A%2F%2Fassets.adidas.com%2Fimages%2Fw_940%2Cf_auto%2Cq_auto%2F0c49e2e2b1774c1c820faf540092425a_9366%2FHP7556_01_standard.jpg&tbnid=L9fsCDOprKJd1M&vet=12ahUKEwiogr7g0Z2FAxWI6jgGHRZCAuMQMygAegQIARBy..i&imgrefurl=https%3A%2F%2Fwww.adidas.com%2Flk%2Frunfalcon-3.0-shoes%2FHP7556.html&docid=DzcVhrVAn9wxLM&w=940&h=940&q=adidas%20shoes%20images&ved=2ahUKEwiogr7g0Z2FAxWI6jgGHRZCAuMQMygAegQIARBy"
                  alt="Black Leather Purse"
                  class="md:hidden w-full h-full object-center object-cover"
                />
              </div>
              <div
                class="md:pl-3 md:w-8/12 2xl:w-3/4 flex flex-col justify-center"
              >
                <p class="text-xs leading-3 text-gray-800 md:pt-0 pt-4">
                  RF293
                </p>
                <div class="flex items-center justify-between w-full">
                  <p class="text-base font-black leading-none text-gray-800">
                    Luxe card holder
                  </p>
                  <select
                    aria-label="Select quantity"
                    class="py-2 px-1 border border-gray-200 mr-6 focus:outline-none"
                  >
                    <option>01</option>
                    <option>02</option>
                    <option>03</option>
                  </select>
                </div>
                <p class="text-xs leading-3 text-gray-600 pt-2">
                  Height: 10 inches
                </p>
                <p class="text-xs leading-3 text-gray-600 py-4">Color: Black</p>
                <p class="w-96 text-xs leading-3 text-gray-600">
                  Composition: 100% calf leather
                </p>
                <div class="flex items-center justify-between pt-5">
                  <div class="flex items-center">
                    <p
                      class="text-xs leading-3 underline text-gray-800 cursor-pointer"
                    >
                      Add to favorites
                    </p>
                    <p
                      class="text-xs leading-3 underline text-red-500 pl-5 cursor-pointer"
                    >
                      Remove
                    </p>
                  </div>
                  <p class="text-base font-black leading-none text-gray-800">
                    5000
                  </p>
                </div>
              </div>
            </div>

            <div
              class="md:flex items-stretch py-8 md:py-10 lg:py-8 border-t border-gray-50"
            >
              <div class="md:w-4/12 2xl:w-1/4 w-full">
                <img
                  src="data:image/jpeg;base64,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"
                  alt="Black Leather Purse"
                  class="h-full object-center object-cover md:block hidden"
                />
                <img
                  src="https://i.ibb.co/TTnzMTf/Rectangle-21.png"
                  alt="Black Leather Purse"
                  class="md:hidden w-full h-full object-center object-cover"
                />
              </div>
              <div
                class="md:pl-3 md:w-8/12 2xl:w-3/4 flex flex-col justify-center"
              >
                <p class="text-xs leading-3 text-gray-800 md:pt-0 pt-4">
                  RF293
                </p>
                <div class="flex items-center justify-between w-full">
                  <p class="text-base font-black leading-none text-gray-800">
                    Luxe card holder
                  </p>
                  <select
                    aria-label="Select quantity"
                    class="py-2 px-1 border border-gray-200 mr-6 focus:outline-none"
                  >
                    <option>01</option>
                    <option>02</option>
                    <option>03</option>
                  </select>
                </div>
                <p class="text-xs leading-3 text-gray-600 pt-2">
                  Height: 10 inches
                </p>
                <p class="text-xs leading-3 text-gray-600 py-4">Color: Black</p>
                <p class="w-96 text-xs leading-3 text-gray-600">
                  Composition: 100% calf leather
                </p>
                <div class="flex items-center justify-between pt-5">
                  <div class="flex items-center">
                    <p
                      class="text-xs leading-3 underline text-gray-800 cursor-pointer"
                    >
                      Add to favorites
                    </p>
                    <p
                      class="text-xs leading-3 underline text-red-500 pl-5 cursor-pointer"
                    >
                      Remove
                    </p>
                  </div>
                  <p class="text-base font-black leading-none text-gray-800">
                    5000
                  </p>
                </div>
              </div>
            </div>

            <a
              href="hero.jsp"
              class="flex font-semibold text-black text-sm mt-10"
            >
              <svg
                class="fill-current mr-2 text-black w-4"
                viewBox="0 0 448 512"
              >
                <path
                  d="M134.059 296H436c6.627 0 12-5.373 12-12v-56c0-6.627-5.373-12-12-12H134.059v-46.059c0-21.382-25.851-32.09-40.971-16.971L7.029 239.029c-9.373 9.373-9.373 24.569 0 33.941l86.059 86.059c15.119 15.119 40.971 4.411 40.971-16.971V296z"
                />
              </svg>
              Continue Shopping
            </a>
          </div>

          <div id="summary" class="w-full md:w-1/4 px-8 py-10">
            <h1 class="font-semibold text-xl border-b pb-8">Order Summary</h1>
            <div class="flex justify-between mt-10 mb-5">
              <span class="font-semibold text-sm uppercase">Items</span>
              <span class="font-semibold text-sm">3</span>
            </div>
            <div>
              <label class="font-medium inline-block mb-3 text-sm uppercase">
                Shipping
              </label>
              <select class="block p-2 text-gray-600 w-full text-sm">
                <option>Standard shipping - $10.00</option>
              </select>
            </div>
            <div class="py-10">
              <label
                for="promo"
                class="font-semibold inline-block mb-3 text-sm uppercase"
              >
                Promo Code
              </label>
              <input
                type="text"
                id="promo"
                placeholder="Enter your code"
                class="p-2 text-sm w-full"
              />
            </div>
            <button
              class="bg-black hover:bg-gray-900 px-5 py-2 text-sm text-white uppercase"
            >
              Apply
            </button>
            <div class="border-t mt-8">
              <div
                class="flex font-semibold justify-between py-6 text-sm uppercase"
              >
                <span>Total cost</span>
                <span>$600</span>
              </div>
              <a href="checkout.jsp">
                <button
                  class="bg-black hover:bg-gray-900 font-semibold py-3 text-sm text-white uppercase w-full"
                >
                  Checkout
                </button>
              </a>
            </div>
          </div>
        </div>
      </div>

      <jsp:include page="./WEB-INF/components/footer.jsp" />
    </div>
  </body>
</html>
