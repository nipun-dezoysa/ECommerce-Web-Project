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
      <jsp:param name="specific" value="" />
    </jsp:include>

    
    <jsp:include page="./WEB-INF/components/saleCountdown.jsp" />
     <jsp:include page="./WEB-INF/components/heroSecond.jsp" />

    <jsp:include page="./WEB-INF/components/showcase.jsp">
      <jsp:param name="title" value="NIKE" />
      <jsp:param name="specific" value="WHERE brand = 'nike'" />
    </jsp:include>

    <jsp:include page="./WEB-INF/components/showcase.jsp">
      <jsp:param name="title" value="Adidas" />
      <jsp:param name="specific" value="WHERE brand = 'adidas'" />
    </jsp:include>
     
    <jsp:include page="./WEB-INF/components/showcase.jsp">
      <jsp:param name="title" value="Men's Shoes" />
      <jsp:param name="specific" value="WHERE type=1" />
    </jsp:include>

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
                    var coll = document.getElementsByClassName("picon"+id);
                    for(var i=0;i<coll.length;i++){
                        coll[i].classList.remove("fa-regular");
                        coll[i].classList.add("fa-solid");
                    }
                    Toast.fire({
                        icon: "success",
                        title: "Item added to Wishlist"
                    });
                    document.getElementById("wishno").innerHTML = obj.qt;
                 }else if(obj.st=="removeds"){
                    var coll = document.getElementsByClassName("picon"+id);
                    for(var i=0;i<coll.length;i++){
                        coll[i].classList.remove("fa-solid");
                        coll[i].classList.add("fa-regular");
                    }
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
