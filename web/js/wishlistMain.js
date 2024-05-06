const Toast = Swal.mixin({
  toast: true,
  position: "top-end",
  showConfirmButton: false,
  timer: 1500,
  timerProgressBar: true,
  didOpen: (toast) => {
    toast.onmouseenter = Swal.stopTimer;
    toast.onmouseleave = Swal.resumeTimer;
  },
});
$(document).ready(function () {
  $(".wforms").submit(function (e) {
    e.preventDefault();
    var formData = new FormData(this);
    var id = formData.get("id");
    Swal.fire({
      title: "Are you sure?",
      text: "Do you want to remove the following product from the wishlist?",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "Yes, remove it!",
    }).then((result) => {
      if (result.isConfirmed) {
        $.ajax({
          type: "POST",
          url: "WishlistServlet",
          data: formData,
          processData: false,
          contentType: false,
          success: function (response) {
            var obj = JSON.parse(response);
            if (obj.st == "removeds") {
              document.getElementById("card" + id).classList.add("hidden");
              Toast.fire({
                icon: "success",
                title: "Item removed frm Wishlist",
              });
              document.getElementById("wishno").innerHTML = obj.qt;
              document.getElementById("count").innerHTML = obj.qt;
            } else {
              Toast.fire({
                icon: "warning",
                title: "You are not login.",
              });
            }
          },
          error: function (xhr, status, error) {
            console.error(xhr.responseText);
          },
        });
      }
    });
  });
});
