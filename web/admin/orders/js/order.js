$(document).ready(function () {
  $(".formss").submit(function (e) {
    e.preventDefault();
    var formData = new FormData(this);
    Swal.fire({
      title: "Are you sure?",
      text: "Are you sure you want to change the status of order?",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "Yes, change it!",
    }).then((result) => {
      if (result.isConfirmed) {
        $.ajax({
          type: "POST",
          url: "../../orderStatus",
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
