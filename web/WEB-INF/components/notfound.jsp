<%-- 
    Document   : notfound
    Created on : Apr 14, 2024, 7:47:36 PM
    Author     : samee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>JSP Page</title>
    <script src="https://cdn.tailwindcss.com"></script>
  </head>
  <body>
    <body
      class="flex flex-col h-screen justify-center items-center bg-gray-100"
    >
      <div class="flex flex-col items-center">
        <img
          class="h-auto max-w-xl dark:shadow-gray-800 size-20 animate-bounce"
          src="nike.png"
          alt="nike"
        />

        <h1 class="text-[120px] font-extrabold text-gray-700 -mt-10">404</h1>
        <p class="text-2xl font-medium text-gray-600 mb-6">Page Not Found</p>
        <a
          href="./img/nike.png"
          class="px-4 py-2 font-medium text-white bg-gray-900 rounded-md hover:bg-indigo-600 transition-all duration-200 ease-in-out"
        >
          Go Home
        </a>
      </div>
    </body>
  </body>
</html>
