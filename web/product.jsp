<!DOCTYPE html>
<html>
  <head>
    <title>Product</title>

    <jsp:include page="./WEB-INF/components/nav.jsp" />

    <div class="main-container flex p-5 h-[500px] gap-5 justify-center">
      <div class="flex h-full gap-1 shrink-0">
        <div class="flex h-full flex-col justify-between">
          <div class="h-[24%]">
            <img
              class="h-full rounded-xl"
              src="./img/demo.jpg"
              alt="product image"
            />
          </div>
          <div class="h-[24%]">
            <img
              class="h-full rounded-xl"
              src="./img/demo.jpg"
              alt="product image"
            />
          </div>
          <div class="h-[24%]">
            <img
              class="h-full rounded-xl"
              src="./img/demo.jpg"
              alt="product image"
            />
          </div>
          <div class="h-[24%]">
            <img
              class="h-full rounded-xl"
              src="./img/demo.jpg"
              alt="product image"
            />
          </div>
        </div>
        <div class="h-full">
          <img
            class="h-full rounded-xl"
            src="./img/demo.jpg"
            alt="product image"
          />
        </div>
      </div>
      <div class="w-[40%] flex flex-col gap-1">
        <h1 class="text-4xl font-bold font-mono">Nike Air Max</h1>
        <div>
          <div class="text-2xl font-mono">LKR 2,500</div>
          <div class="flex gap-2">
            <div class="text-gray-500 line-through">LKR 3,000</div>
            <div class="bg-green-200 px-2 rounded-full text-green-500">15%</div>
          </div>
        </div>

        <p class="font-mono text-sm">
          Nike Air Max is a line of shoes produced by Nike, Inc., with the first
          model released in 1987. Air Max shoes are identified by their midsoles
          incorporating flexible urethane pouches filled with pressurized gas,
          visible from the exterior of the shoe and intended to provide
          cushioning to the underfoot.
        </p>
        <form action="#" class="flex flex-col gap-1">
          <div class="flex flex-col">
            <div class="font-semibold">Colors</div>
            <div class="mt-1 flex gap-1">
              <div>
                <input
                  type="radio"
                  id="color1"
                  name="color"
                  value="black"
                  class="hidden peer"
                />
                <label
                  for="color1"
                  class="block px-5 py-2 border-2 rounded-full peer-checked:bg-primary peer-checked:text-white"
                  >Black</label
                >
              </div>
              <div>
                <input
                  type="radio"
                  id="color2"
                  name="color"
                  value="white"
                  class="hidden peer"
                />
                <label
                  for="color2"
                  class="block px-5 py-2 border-2 rounded-full peer-checked:bg-primary peer-checked:text-white"
                  >White</label
                >
              </div>
              <div>
                <input
                  type="radio"
                  id="color3"
                  name="color"
                  value="red"
                  class="hidden peer"
                />
                <label
                  for="color3"
                  class="block px-5 py-2 border-2 rounded-full peer-checked:bg-primary peer-checked:text-white"
                  >Red</label
                >
              </div>
              <div>
                <input
                  type="radio"
                  id="color4"
                  name="color"
                  value="yellow"
                  class="hidden peer"
                />
                <label
                  for="color4"
                  class="block px-5 py-2 border-2 rounded-full peer-checked:bg-primary peer-checked:text-white"
                  >Yellow</label
                >
              </div>
            </div>
          </div>
          <div class="flex flex-col">
            <div class="font-semibold">Sizes</div>
            <div class="mt-1 flex gap-1">
              <div>
                <input
                  type="radio"
                  id="size1"
                  name="size"
                  value="35"
                  class="hidden peer"
                />
                <label
                  for="size1"
                  class="block px-5 py-2 border-2 rounded-full peer-checked:bg-primary peer-checked:text-white"
                  >35</label
                >
              </div>
              <div>
                <input
                  type="radio"
                  id="size2"
                  name="size"
                  value="36"
                  class="hidden peer"
                />
                <label
                  for="size2"
                  class="block px-5 py-2 border-2 rounded-full peer-checked:bg-primary peer-checked:text-white"
                  >36</label
                >
              </div>
              <div>
                <input
                  type="radio"
                  id="size3"
                  name="size"
                  value="37"
                  class="hidden peer"
                />
                <label
                  for="size3"
                  class="block px-5 py-2 border-2 rounded-full peer-checked:bg-primary peer-checked:text-white"
                  >37</label
                >
              </div>
              <div>
                <input
                  type="radio"
                  id="size4"
                  name="size"
                  value="38"
                  class="hidden peer"
                />
                <label
                  for="size4"
                  class="block px-5 py-2 border-2 rounded-full peer-checked:bg-primary peer-checked:text-white"
                  >38</label
                >
              </div>
            </div>
          </div>
          <div class="flex mt-1 gap-1">
            <button
              class="bg-primary text-white px-5 py-2 rounded-xl"
              type="submit"
            >
              Add to Cart
            </button>
            <a class="bg-primary text-white px-5 py-2 rounded-xl" href="#"
              >Add to Wishlist</a
            >
          </div>
        </form>
      </div>
    </div>

    <jsp:include page="./WEB-INF/components/showcase.jsp">
      <jsp:param name="title" value="You may also like" />
    </jsp:include>

    <jsp:include page="./WEB-INF/components/footer.jsp" />
