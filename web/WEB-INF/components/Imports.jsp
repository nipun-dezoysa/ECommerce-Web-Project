<%
    String path = request.getParameter("path");
    if(path==null){
        path="./";
    }
%>
<meta charset="UTF-8" />
<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
<script src="https://cdn.tailwindcss.com"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="<%=path%>js/tailwindconfig.js"></script>
<link
  rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
  integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
  crossorigin="anonymous"
  referrerpolicy="no-referrer"
/>

<link rel="icon" type="image/x-icon" href="<%=path%>img/favicon.ico" />

<style type="text/tailwindcss">
  @layer utilities {
    body {
      @apply flex justify-center;
    }
    .frameBox {
      @apply relative w-full max-w-[1920px] min-h-screen flex flex-col;
    }
    .main-container {
      @apply lg:px-[100px] md:px-[50px] px-5 w-full;
    }
  }
</style>
