$(document).ready(function () {
  $(".addr").submit(function (e) {
    e.preventDefault();
    var formData = new FormData(this);
    Swal.fire({
      title: "Are you sure?",
      text: "Are you sure you want to remove this address.",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "Remove",
    }).then((result) => {
      if (result.isConfirmed) {
        $.ajax({
          type: "POST",
          url: "../removeAddress",
          data: formData,
          processData: false,
          contentType: false,
          success: function (response) {
            Swal.fire({
              title: "Removed",
              text: "Address removed from Address Book.",
              icon: "success",
              confirmButtonColor: "#3085d6",
              cancelButtonColor: "#d33",
              confirmButtonText: "Ok",
            }).then((r) => {
              location.reload();
            });
          },
          error: function (xhr, status, error) {
            console.error(xhr.responseText);
          },
        });
      }
    });
  });
});
