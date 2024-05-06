$(document).ready(function () {
  $(".remforms").submit(function (e) {
    e.preventDefault();
    var formData = new FormData(this);
    Swal.fire({
      title: "Are you sure?",
      text: "Are you sure you want to remove the following product from the cart?",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "Yes, remove it!",
    }).then((result) => {
      if (result.isConfirmed) {
        $.ajax({
          type: "POST",
          url: "removeFromCart",
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

  $(".quentforms").submit(function (e) {
    e.preventDefault();
    var formData = new FormData(this);
    $.ajax({
      type: "POST",
      url: "addToCart",
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
});
