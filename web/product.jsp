<!DOCTYPE html>
<html>
  <head>
    <title>Product</title>

    <jsp:include page="./WEB-INF/components/nav.jsp" />

    <div class="bg-white py-8">
      <div class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex flex-col md:flex-row -mx-4">
          <div class="md:flex-1 px-4">
            <div class="h-[450px] mb-4">
              <img class="w-full h-full object-cover" src="./img/demo.jpg" />
            </div>
            <div class="flex -mx-2 mb-4">
              <div class="w-1/2 px-2">
                <button
                  class="w-full dark:bg-cyan-500 text-white py-2 px-4 rounded-full font-bold dark:hover:bg-black"
                >
                  Add to Cart
                </button>
              </div>
              <div class="w-1/2 px-2">
                <button
                  class="w-full dark:bg-cyan-500 text-white py-2 px-4 rounded-full font-bold dark:hover:bg-black"
                >
                  Add to Wishlist
                </button>
              </div>
            </div>
          </div>
          <div class="md:flex-1 px-4">
            <h2 class="text-2xl font-bold text-black">Nike Air Max</h2>
            <p class="text-black mb-4">Sleek design, maximum comfort</p>
            <div class="flex mb-4">
              <div class="mr-4">
                <span class="font-bold text-black">Price:</span>
                <span class="text-black">$29.99</span>
              </div>
              <div>
                <span class="font-bold text-black">Availability:</span>
                <span class="text-black">In Stock</span>
              </div>
            </div>
            <div class="mb-4">
              <span class="font-bold text-black">Select Color:</span>
              <div class="flex items-center mt-2">
                <button class="w-6 h-6 rounded-full bg-gray-400 mr-2"></button>
                <button class="w-6 h-6 rounded-full bg-red-700 mr-2"></button>
                <button class="w-6 h-6 rounded-full bg-sky-600 mr-2"></button>
                <button class="w-6 h-6 rounded-full bg-lime-500 mr-2"></button>
              </div>
            </div>
            <div class="mb-4">
              <span class="font-bold text-black">Select Size:</span>
              <div class="flex items-center mt-2">
                <button
                  class="bg-gray-700 text-white py-2 px-4 rounded-full font-bold mr-2 hover:bg-black"
                >
                  35
                </button>
                <button
                  class="bg-gray-700 text-white py-2 px-4 rounded-full font-bold mr-2 hover:bg-black"
                >
                  36
                </button>
                <button
                  class="bg-gray-700 text-white py-2 px-4 rounded-full font-bold mr-2 hover:bg-black"
                >
                  37
                </button>
                <button
                  class="bg-gray-700 text-white py-2 px-4 rounded-full font-bold mr-2 hover:bg-black"
                >
                  38
                </button>
                <button
                  class="bg-gray-700 text-white py-2 px-4 rounded-full font-bold mr-2 hover:bg-black"
                >
                  39
                </button>
                <br />
                <button
                  class="bg-gray-700 text-white py-2 px-4 rounded-full font-bold mr-2 hover:bg-black"
                >
                  40
                </button>
                <button
                  class="bg-gray-700 text-white py-2 px-4 rounded-full font-bold mr-2 hover:bg-black"
                >
                  41
                </button>
                <button
                  class="bg-gray-700 text-white py-2 px-4 rounded-full font-bold mr-2 hover:bg-black"
                >
                  42
                </button>
                <button
                  class="bg-gray-700 text-white py-2 px-4 rounded-full font-bold mr-2 hover:bg-black"
                >
                  43
                </button>
                <button
                  class="bg-gray-700 text-white py-2 px-4 rounded-full font-bold mr-2 hover:bg-black"
                >
                  44
                </button>
              </div>
            </div>
            <div>
              <span class="font-bold text-black">Product Description:</span>
              <p class="text-black text-sm mt-2">
                Nike Air Max is a line of shoes produced by Nike, Inc., with the
                first model released in 1987. Air Max shoes are identified by
                their midsoles incorporating flexible urethane pouches filled
                with pressurized gas, visible from the exterior of the shoe and
                intended to provide cushioning to the underfoot.
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  
    <jsp:include page="./WEB-INF/components/showcase.jsp">
        <jsp:param name="title" value="You may also like"/>
    </jsp:include>

    <jsp:include page="./WEB-INF/components/footer.jsp" />