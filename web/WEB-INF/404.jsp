<%-- 
    Document   : notfound
    Created on : Apr 14, 2024, 7:47:36 PM
    Author     : samee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <title>Not Found</title>
  <jsp:include page="./components/Imports.jsp" />
  <style>
    /* Custom CSS for transitions and animations */
    .animate-fadeIn {
      animation: fadeIn 0.5s ease-in-out forwards;
    }

    @keyframes fadeIn {
      from {
        opacity: 0;
      }
      to {
        opacity: 1;
      }
    }
  </style>
</head>

<body>
  <jsp:include page="./components/nav.jsp" />
  <div class="flex flex-col items-center animate-fadeIn py-10">
    <h1 class="text-[120px] font-extrabold text-gray-700 -mt-10">404</h1>
    <p class="text-2xl font-medium text-gray-600 mb-6">Page Not Found</p>
    <a href="http://localhost:8080/ECommerce_Web_Project/index.jsp" class="px-4 py-2 font-medium text-white bg-gray-900 rounded-md hover:bg-indigo-600 transition-all duration-200 ease-in-out">
      Go Back
    </a>
  </div>
  <jsp:include page="./components/footer.jsp" />
</body>

</html>
