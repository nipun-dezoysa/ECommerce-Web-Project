const Toast = Swal.mixin({
  toast: true,
  position: "top-end",
  showConfirmButton: false,
  timer: 3000,
  timerProgressBar: true,
  didOpen: (toast) => {
    toast.onmouseenter = Swal.stopTimer;
    toast.onmouseleave = Swal.resumeTimer;
  },
});

$(document).ready(function () {
  $("#pform").submit(function (e) {
    e.preventDefault();
    var ss = document.getElementById("sc1");
    var cc = document.getElementById("cc1");
    if (ss == null) {
      Toast.fire({
        icon: "warning",
        title: "Please add sizes",
      });
      return;
    } else if (cc == null) {
      Toast.fire({
        icon: "warning",
        title: "Please add colors",
      });
      return;
    } else {
      var formData = new FormData(this);
      Swal.fire({
        title: "New Product!",
        text: "Do you want to add this product?",
        icon: "info",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Add product",
      }).then((result) => {
        if (result.isConfirmed) {
          $.ajax({
            type: "POST",
            url: "../../addProduct",
            data: formData,
            processData: false,
            contentType: false,
            success: function (response) {
              Swal.fire({
                title: "New Product!",
                text: "Product successfully added to the inevtory.",
                icon: "success",
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "Ok",
              }).then((result) => {
                location.reload();
              });
            },
            error: function (xhr, status, error) {
              console.error(xhr.responseText);
            },
          });
        }
      });
    }
  });

  $(".dform").submit(function (e) {
    e.preventDefault();
    var formData = new FormData(this);
    Swal.fire({
      title: "Are you sure?",
      text: "Are you sure you want to delete the following product?",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "Yes, Delete it!",
    }).then((result) => {
      if (result.isConfirmed) {
        $.ajax({
          type: "POST",
          url: "../../deleteProduct",
          data: formData,

          processData: false,
          contentType: false,
          success: function (response) {
            location.reload();
          },
          error: function (xhr, status, error) {
            console.error(xhr.responseText);
          },
        });
      }
    });
  });
});

//input image functions
var loadFile = function (event, id) {
  var output = document.getElementById(id);
  output.src = URL.createObjectURL(event.target.files[0]);
  output.onload = function () {
    URL.revokeObjectURL(output.src);
  };
};