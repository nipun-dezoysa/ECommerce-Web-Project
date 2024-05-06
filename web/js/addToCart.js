$(document).ready(function () {
  $("#cartform").submit(function (e) {
    e.preventDefault();
    var formData = new FormData(this);
    $.ajax({
      type: "POST",
      url: "addToCart",
      data: formData,
      processData: false,
      contentType: false,
      success: function (response) {
        Toast.fire({
          icon: "success",
          title: "Item added successfully",
        });

        document.getElementById("cartno").innerHTML = response;
        document.getElementById("cartno").classList.remove("hidden");
      },
      error: function (xhr, status, error) {
        console.error(xhr.responseText);
      },
    });
  });
});
