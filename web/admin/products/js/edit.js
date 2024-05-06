//input image functions
var loadFile = function (event, id) {
  document
    .getElementById(id + "ok")
    .setAttribute(
      "class",
      "absolute peer-checked:visible top-2 right-2 p-1 bg-gray-200 rounded-full w-7 h-7 flex items-center justify-center hover:bg-green-500 hover:text-white cursor-pointer"
    );
  var output = document.getElementById(id + "img");

  output.src = URL.createObjectURL(event.target.files[0]);
  output.onload = function () {
    URL.revokeObjectURL(output.src);
  };
};

$(document).ready(function () {
  $(".ssforms").submit(function (e) {
    e.preventDefault();
    var formData = new FormData(this);
    Swal.fire({
      title: "Are you sure?",
      text: "Are you sure you want to remove the following Size from the product?",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "Yes, remove it!",
    }).then((result) => {
      if (result.isConfirmed) {
        $.ajax({
          type: "POST",
          url: "../../productSize",
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

  $("#sizeadd").submit(function (e) {
    e.preventDefault();
    var formData = new FormData(this);
    $.ajax({
      type: "POST",
      url: "../../productSize",
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
  });

  $(".ccforms").submit(function (e) {
    e.preventDefault();
    var formData = new FormData(this);
    Swal.fire({
      title: "Are you sure?",
      text: "Are you sure you want to remove the following Color from the product?",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "Yes, remove it!",
    }).then((result) => {
      if (result.isConfirmed) {
        $.ajax({
          type: "POST",
          url: "../../productColor",
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

  $("#coloradd").submit(function (e) {
    e.preventDefault();
    var formData = new FormData(this);
    $.ajax({
      type: "POST",
      url: "../../productColor",
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
  });

  $("#mainform").submit(function (e) {
    e.preventDefault();
    var formData = new FormData(this);
    Swal.fire({
      title: "Are you sure?",
      text: "Are you want to save the following details to the product?",
      icon: "question",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "Save changes",
    }).then((result) => {
      if (result.isConfirmed) {
        $.ajax({
          type: "POST",
          url: "../../productDetails",
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

  $(".imgclass").submit(function (e) {
    e.preventDefault();
    var formData = new FormData(this);
    Swal.fire({
      title: "Are you sure?",
      text: "Are you want to upload the following image to the product?",
      icon: "question",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "Upload the image",
    }).then((result) => {
      if (result.isConfirmed) {
        $.ajax({
          type: "POST",
          url: "../../changeImg",
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
