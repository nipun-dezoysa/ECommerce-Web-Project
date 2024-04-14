
<% 
String path = request.getParameter("path");
%>

<meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="<%=path%>../js/tailwindconfig.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
      integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    
    <style type="text/tailwindcss">
      @layer utilities {
        .inputs {
          @apply border rounded-lg p-2 outline-primary w-full placeholder:text-gray-400;
        }
        .image {
          @apply block w-full file:text-gray-400 border border-gray-200 rounded-lg focus:z-10 focus:border-blue-500 focus:ring-blue-500 disabled:opacity-50 disabled:pointer-events-none file:bg-gray-50 file:border-0 file:me-4 file:py-2 file:px-2;
        }
        .remove {
          @apply text-red-700 hover:text-white border border-red-700 hover:bg-red-800 focus:ring-4 focus:outline-none focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center cursor-pointer;
        }
        .normal {
          @apply text-white bg-primary hover:bg-primaryLight focus:ring-4 focus:outline-none focus:ring-primaryLight font-medium rounded-lg text-sm px-5 py-2.5 text-center cursor-pointer;
        }
        .box {
          @apply bg-white rounded-lg border flex flex-col;
        }
        .box-title {
          @apply font-bold text-xl font-mono py-2 px-5 border-b;
        }
        .box-body {
          @apply p-5 flex flex-col gap-3;
        }
        .input-lable {
          @apply block mb-1 text-sm font-medium text-gray-900;
        }
      }
    </style>
