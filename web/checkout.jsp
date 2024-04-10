
<!DOCTYPE html>
<html>
  <head>
    <title>Shoetopia</title>
    <jsp:include page="./WEB-INF/components/Imports.jsp" />
  </head>
  <body>
    <div class="frameBox">
<jsp:include page="./WEB-INF/components/nav.jsp" />

<div class="font-[sans-serif] bg-white">
    <div class="max-lg:max-w-xl mx-auto w-full">
        <div class="grid lg:grid-cols-3 gap-6">
            <div class="bg-gray-100 lg:h-screen lg:sticky lg:top-0">
                <div class="relative h-full">
                    <div class="p-8 lg:overflow-auto lg:h-[calc(100vh-60px)] max-lg:mb-8">
                        <h2 class="text-2xl font-extrabold text-[#333]">Order Summary</h2>
                        <div class="space-y-6 mt-10">
                            <div class="grid sm:grid-cols-2 items-start gap-6">
                                <div class="max-w-[190px] px-4 py-6 shrink-0 bg-gray-200 rounded-md">
                                    <img src='https://readymadeui.com/images/product10.webp' class="w-full object-contain" />
                                </div>
                                <div>
                                    <h3 class="text-base text-[#333]">Naruto: Split Sneakers</h3>
                                    <ul class="text-xs text-[#333] space-y-2 mt-2">
                                        <li class="flex flex-wrap gap-4">Size <span class="ml-auto">37</span></li>
                                        <li class="flex flex-wrap gap-4">Quantity <span class="ml-auto">2</span></li>
                                        <li class="flex flex-wrap gap-4">Total Price <span class="ml-auto">$40</span></li>
                                    </ul>
                                </div>
                            </div>
                           
                            <div class="grid sm:grid-cols-2 items-start gap-6">
                                <div class="max-w-[190px] px-4 py-6 shrink-0 bg-gray-200 rounded-md">
                                    <img src='https://readymadeui.com/images/product11.webp' class="w-full object-contain" />
                                </div>
                                <div>
                                    <h3 class="text-base text-[#333]">VelvetGlide Boots</h3>
                                    <ul class="text-xs text-[#333] space-y-2 mt-2">
                                        <li>Size <span class="float-right">37</span></li>
                                        <li>Quantity <span class="float-right">2</span></li>
                                        <li>Total Price <span class="float-right">$40</span></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="grid sm:grid-cols-2 items-start gap-6">
                                <div class="max-w-[190px] px-4 py-6 shrink-0 bg-gray-200 rounded-md">
                                    <img src='https://readymadeui.com/images/product14.webp' class="w-full object-contain" />
                                </div>
                                <div>
                                    <h3 class="text-base text-[#333]">Echo Elegance</h3>
                                    <ul class="text-xs text-[#333] space-y-2 mt-2">
                                        <li>Size <span class="float-right">37</span></li>
                                        <li>Quantity <span class="float-right">2</span></li>
                                        <li>Total Price <span class="float-right">$40</span></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="absolute left-0 bottom-0 bg-gray-200 w-full p-4">
                        <h4 class="flex flex-wrap gap-4 text-base text-[#333] font-bold">Total <span class="ml-auto">$240.00</span></h4>
                    </div>
                </div>
            </div>
            <div class="lg:col-span-2 max-lg:order-1 p-6 max-w-4xl mx-auto w-full">
                <div class="text-center max-lg:hidden">
                    <h2 class="text-3xl font-extrabold text-[#333] inline-block border-b-4 border-[#333] pb-1">Checkout</h2>
                </div>
                <form class="lg:mt-12">
                    <div>
                        <h2 class="text-2xl font-extrabold text-[#333]">Shipping info</h2>
                       <div class="grid grid-cols-2 gap-6 mt-8">
    <input type="text" placeholder="Name"
        class="px-2 py-3.5 bg-white text-[#333] w-full text-sm border-b-3 border-[#333] focus:border-[#333] outline-none rounded-md" />
    <input type="email" placeholder="Email address"
        class="px-2 py-3.5 bg-white text-[#333] w-full text-sm border-b-3 border-[#333] focus:border-[#333] outline-none rounded-md" />
    <input type="text" placeholder="Street address"
        class="px-2 py-3.5 bg-white text-[#333] w-full text-sm border-b-3 border-[#333] focus:border-[#333] outline-none rounded-md" />
    <input type="text" placeholder="City"
        class="px-2 py-3.5 bg-white text-[#333] w-full text-sm border-b-3 border-[#333] focus:border-[#333] outline-none rounded-md" />
    <input type="text" placeholder="State"
        class="px-2 py-3.5 bg-white text-[#333] w-full text-sm border-b-3 border-[#333] focus:border-[#333] outline-none rounded-md" />
    <input type="number" placeholder="Postal code"
        class="px-2 py-3.5 bg-white text-[#333] w-full text-sm border-b-3 border-[#333] focus:border-[#333] outline-none rounded-md" />
</div>

                    </div>
                    <div class="mt-12 ">
                        <h2 class="text-2xl font-extrabold text-[#333] ">Payment method</h2>
                        <div class="grid gap-4 sm:grid-cols-2 mt-8">
                            <div class="flex items-center">
                                <input type="radio" class="w-5 h-5 cursor-pointer" id="card" checked />
                                <label for="card" class="ml-3 flex gap-2 cursor-pointer">
                                    Cash on Delivery
                                    <img src="data:image/png;base64,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" class="w-12" alt="card1" />
                                </label>
                            </div>
                           
                        </div>
                    <div class="flex flex-wrap gap-4 mt-8 justify-end">
                        <a href="shoppingCart.jsp"><button type="button" class="min-w-[150px] px-6 py-3.5 text-sm bg-gray-100 text-[#333] rounded-md hover:bg-gray-200">Back</button></a>
                        <button type="button" class="min-w-[150px] px-6 py-3.5 text-sm bg-[#333] text-white rounded-md hover:bg-[#111]">Confirm payment $240</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<jsp:include page="./WEB-INF/components/footer.jsp" />
</div>
  </body>
</html>
