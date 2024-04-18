<!DOCTYPE html>
<html>
  <head>
    <title>Shoetopia</title>
    <jsp:include page="./WEB-INF/components/Imports.jsp" />
  </head>
  <body>
    <jsp:include page="./WEB-INF/components/nav.jsp" />

    <!-- content starts here-->

    <jsp:include page="./WEB-INF/components/hero.jsp" />

    <jsp:include page="./WEB-INF/components/showcase.jsp">
      <jsp:param name="title" value="New Arrivals" />
    </jsp:include>

    <jsp:include page="./WEB-INF/components/saleCountdown.jsp" />

    <%--<jsp:include page="./WEB-INF/components/showcase.jsp">--%>
      <%--<jsp:param name="title" value="NIKE" />--%>
    <%--</jsp:include>--%>

    <%--<jsp:include page="./WEB-INF/components/showcase.jsp">--%>
      <%--<jsp:param name="title" value="POLGAHA SEREPPU" />--%>
    <%--</jsp:include>--%>

    <!-- contents end here -->
   
    <jsp:include page="./WEB-INF/components/footer.jsp" />
    
    <script>
        
        const Toast = Swal.mixin({
  toast: true,
  position: "top-end",
  showConfirmButton: false,
  timer: 1500,
  timerProgressBar: true,
  didOpen: (toast) => {
    toast.onmouseenter = Swal.stopTimer;
    toast.onmouseleave = Swal.resumeTimer;
  }
});
        $(document).ready(function () {
        $(".wforms").submit(function (e) {
          e.preventDefault();
          var formData = new FormData(this);
          var id = formData.get("id");
            $.ajax({
              type: "POST",
              url: "WishlistServlet",
              data: formData,
              processData: false,
              contentType: false,
              success: function (response) {
                 var obj = JSON.parse(response);
                 if(obj.st=="added"){
                    document.getElementById("picon"+id).className = "fa-solid fa-heart group-hover:mb-2 duration-300 ease-in-out";
                    Toast.fire({
                        icon: "success",
                        title: "Item added to Wishlist"
                    });
                    document.getElementById("wishno").innerHTML = obj.qt;
                 }else if(obj.st=="removeds"){
                    document.getElementById("picon"+id).className = "fa-regular fa-heart group-hover:mb-2 duration-300 ease-in-out";
                    Toast.fire({
                        icon: "success",
                        title: "Item removed frm Wishlist"
                    }); 
                    document.getElementById("wishno").innerHTML = obj.qt;
                 }else{
                    Toast.fire({
                        icon: "warning",
                        title: "You are not login."
                    }); 
                 }
                
              },
              error: function (xhr, status, error) {
                console.error(xhr.responseText);
              },
            });
        });
        
      });
    </script>
    
  </body>
</html>
