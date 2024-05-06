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
    $.ajax({
      type: "POST",
      url: "../../WishlistServlet",
      data: formData,
      processData: false,
      contentType: false,
      success: function (response) {
        var obj = JSON.parse(response);
        if (obj.st == "added") {
          var coll = document.getElementsByClassName("picon" + id);
          for (var i = 0; i < coll.length; i++) {
            coll[i].classList.remove("fa-regular");
            coll[i].classList.add("fa-solid");
          }
          Toast.fire({
            icon: "success",
            title: "Item added to Wishlist",
          });
          document.getElementById("wishno").innerHTML = obj.qt;
        } else if (obj.st == "removeds") {
          var coll = document.getElementsByClassName("picon" + id);
          for (var i = 0; i < coll.length; i++) {
            coll[i].classList.remove("fa-solid");
            coll[i].classList.add("fa-regular");
          }
          Toast.fire({
            icon: "success",
            title: "Item removed frm Wishlist",
          });
          document.getElementById("wishno").innerHTML = obj.qt;
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
  });
});
