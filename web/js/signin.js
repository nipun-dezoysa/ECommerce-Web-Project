$(document).ready(function () {
  $("#signin").submit(function (e) {
    e.preventDefault();
    var formData = new FormData(this);
    $.ajax({
      type: "POST",
      url: "SignInServlet",
      data: formData,
      processData: false,
      contentType: false,
      success: function (response) {
        if (response == "bad") {
          Swal.fire({
            title: "Oops!",
            text: "It seems like the username you entered is incorrect. Please double-check and try again.",
            icon: "error",
            confirmButtonColor: "#1b2330",
          });
        } else if (response == "banned") {
          Swal.fire({
            title: "Banned Account!",
            text: "Your account is blocked. Contact Shoetopia to more details.",
            icon: "error",
            confirmButtonColor: "#1b2330",
          });
        } else {
          Swal.fire({
            title: "Welcome back!",
            text: "You're now signed in to your account.",
            icon: "success",
            confirmButtonColor: "#1b2330",
          }).then(() => {
            if (response == "ok") {
              location.replace("index.jsp");
            } else {
              location.replace(response);
            }
          });
        }
      },
      error: function (xhr, status, error) {
        console.error(xhr.responseText);
      },
    });
  });
});
