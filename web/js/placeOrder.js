$(document).ready(function () {
  $("select").on("change", function () {
    $("#firstname").val(address[this.value].fname);
    $("#lastname").val(address[this.value].lname);
    $("#email").val(address[this.value].email);
    $("#phone").val(address[this.value].phone);
    $("#address").val(address[this.value].addr);
    $("#city").val(address[this.value].city);
    $("#province").val(address[this.value].provi);
  });

  $("#order").submit(function (e) {
    e.preventDefault();
    var formData = new FormData(this);
    Swal.fire({
      title: "Are you sure?",
      text: "Are you sure you want to remove the following product from the cart?",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "Place the order",
    }).then((result) => {
      if (result.isConfirmed) {
        $.ajax({
          type: "POST",
          url: "placeOrder",
          data: formData,
          processData: false,
          contentType: false,
          success: function (response) {
            Swal.fire({
              title: "Thankyou!",
              text: "Your order is placed!",
              icon: "success",
            }).then((result) => {
              if (result.isConfirmed) {
                window.location.replace("./");
              }
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
