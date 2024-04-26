<% String path = request.getParameter("path"); if(path==null){ path="./"; } %>
<footer class="mt-auto">
  <div class="bg-primary pt-2 pb-10 text-white">
    <div
      class="bg-primary py-5 text-white flex flex-col items-center justify-center"
    >
      <h1 class="text-xl lg:text-3xl font-bold mb-5 ">Subscribe to get our updates</h1>
      <form action="#">
        <div class="flex lg:w-[500px]">
          <input
            type="email"
            placeholder="Enter your email address..."
            class="bg-white text-white px-2 rounded-l-lg px-4 py-2 focus:outline-none w-full mr-3 rounded-r-lg"
          />
          <button
            type="submit"
            class="bg-blue-500 hover:bg-blue-600 font-bold py-2 px-4 rounded-r-lg focus:outline-none rounded-l-lg"
          >
            Subscribe
          </button>
        </div>
      </form>
    </div>
    <div class="container px-10 mx-auto">
      <div class="-mx-4 flex flex-wrap justify-between">
        <div class="px-2 my-4 w-full sm:w-auto">
          <div>
            <h2 class="inline-block text-2xl font-bold mb-3">Contact Us</h2>

          </div>
          <ul class="leading-8">
            <li class="flex items-center">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                class="w-4 h-4 mr-2 mb-0"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  d="M2.25 6.75c0 8.284 6.716 15 15 15h2.25a2.25 2.25 0 0 0 2.25-2.25v-1.372c0-.516-.351-.966-.852-1.091l-4.423-1.106c-.44-.11-.902.055-1.173.417l-.97 1.293c-.282.376-.769.542-1.21.38a12.035 12.035 0 0 1-7.143-7.143c-.162-.441.004-.928.38-1.21l1.293-.97c.363-.271.527-.734.417-1.173L6.963 3.102a1.125 1.125 0 0 0-1.091-.852H4.5A2.25 2.25 0 0 0 2.25 4.5v2.25Z"
                />
              </svg>
              0112 555555
            </li>

            <li class="flex items-center">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                class="w-4 h-4 mr-2 mb-0"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  d="M21.75 6.75v10.5a2.25 2.25 0 0 1-2.25 2.25h-15a2.25 2.25 0 0 1-2.25-2.25V6.75m19.5 0A2.25 2.25 0 0 0 19.5 4.5h-15a2.25 2.25 0 0 0-2.25 2.25m19.5 0v.243a2.25 2.25 0 0 1-1.07 1.916l-7.5 4.615a2.25 2.25 0 0 1-2.36 0L3.32 8.91a2.25 2.25 0 0 1-1.07-1.916V6.75"
                />
              </svg>
              <span> info.shoetopia.com</span>
            </li>
            <div>
              <div class="mb-0 mt-0">
                <li class="flex items-center mb-0">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke-width="1.5"
                    stroke="currentColor"
                    class="w-4 h-4 mr-2"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      d="M15 10.5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z"
                    />
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      d="M19.5 10.5c0 7.142-7.5 11.25-7.5 11.25S4.5 17.642 4.5 10.5a7.5 7.5 0 1 1 15 0Z"
                    />
                  </svg>
                  <address>NO 45, main street,</address>
                </li>
              </div>

              <div class="ml-6 pt-0">
                <address>Homagama.</address>
              </div>
            </div>
          </ul>
        </div>

        <div class="px-2 my-4 w-full sm:w-auto">
          <div>
            <h2 class="inline-block text-2xl font-bold mb-3">Category</h2>
          </div>
          <ul class="leading-8">
            <li><a href="#" class="hover:text-blue-400">Category 1</a></li>
            <li><a href="#" class="hover:text-blue-400">Category 2</a></li>
            <li><a href="#" class="hover:text-blue-400">Category 3</a></li>
            <li><a href="#" class="hover:text-blue-400">Category 4</a></li>
            <li><a href="#" class="hover:text-blue-400">Category 5</a></li>
            <li><a href="#" class="hover:text-blue-400">Category 6</a></li>
          </ul>
        </div>

        <div class="px-2 my-4 w-full sm:w-auto">
          <div>
            <h2 class="inline-block text-2xl font-bold mb-3">Supports</h2>
          </div>
          <ul class="leading-8">
            <li><a href="#" class="hover:text-blue-400">About Us</a></li>
            <li><a href="#" class="hover:text-blue-400">Privacy Policy</a></li>
            <li><a href="#" class="hover:text-blue-400">Return Policy</a></li>
            <li><a href="#" class="hover:text-blue-400">Help Center</a></li>
            <li><a href="#" class="hover:text-blue-400">Store Locations</a></li>
            <li><a href="#" class="hover:text-blue-400">Careers</a></li>
          </ul>
        </div>
        <div class="px-2 my-4 w-full sm:w-auto">
          <div>
            <h2 class="inline-block text-2xl font-bold mb-3">Links</h2>
          </div>
          <ul class="leading-8">
            <li><a href="#" class="hover:text-blue-400">Product List</a></li>
            <li><a href="#" class="hover:text-blue-400">Order Tracking</a></li>
            <li><a href="#" class="hover:text-blue-400">Product Guide</a></li>
            <li><a href="#" class="hover:text-blue-400">Shopping Cart</a></li>
            <li><a href="#" class="hover:text-blue-400">Tech Blog</a></li>
          </ul>
        </div>
        <div class="px-2 my-4 w-full sm:w-auto">
          <div>
            <h2 class="inline-block text-2xl font-bold mb-3">Follow Us</h2>
          </div>
          <ul class="leading-8">
            <li class="flex items-center">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                class="mr-2"
                width="16"
                height="16"
                fill="currentColor"
                class="bi bi-facebook"
                viewBox="0 0 16 16"
              >
                <path
                  d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951"
                /></svg
              ><a href="#" class="hover:text-blue-400">Facebook</a>
            </li>

            <li class="flex items-center">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="16"
                height="16"
                class="mr-2"
                fill="currentColor"
                class="bi bi-instagram"
                viewBox="0 0 16 16"
              >
                <path
                  d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.9 3.9 0 0 0-1.417.923A3.9 3.9 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.9 3.9 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.9 3.9 0 0 0-.923-1.417A3.9 3.9 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599s.453.546.598.92c.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.5 2.5 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.5 2.5 0 0 1-.92-.598 2.5 2.5 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233s.008-2.388.046-3.231c.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92s.546-.453.92-.598c.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92m-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217m0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334"
                /></svg
              ><a href="#" class="hover:text-blue-400">Instergram</a>
            </li>

            <li class="flex items-center">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="16"
                height="16"
                class="mr-2"
                fill="currentColor"
                class="bi bi-twitter-x"
                viewBox="0 0 16 16"
              >
                <path
                  d="M12.6.75h2.454l-5.36 6.142L16 15.25h-4.937l-3.867-5.07-4.425 5.07H.316l5.733-6.57L0 .75h5.063l3.495 4.633L12.601.75Zm-.86 13.028h1.36L4.323 2.145H2.865z"
                /></svg
              ><a href="#" class="hover:text-blue-400">Twitter</a>
            </li>
          </ul>
        </div>
      </div>
      <hr />
      <div class="flex justify-between w-full">
        <span>Copyright @ 2024 shoetopia. All Rights Reserved.</span>
        <span>Privacy Policy | Terms and Conditions | Sitemap</span>
      </div>
    </div>
  </div>
</footer>

<!-- dont delete below line -->
</div>
<!-- dont delete above line -->

<script>
    $(document).ready(function () {
      $(".logoutss").click(function () {
        $.ajax({
          type: "GET",
          url: "<%= path %>SignOutServelet",
          success: function (response) {
            location.reload();
          },
          error: function (xhr, status, error) {
            console.error(xhr.responseText);
          },
        });
      });
    });
  </script>