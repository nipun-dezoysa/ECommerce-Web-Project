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
  $("#signup").submit(function (e) {
    e.preventDefault();
    var formData = new FormData(this);
    if (
      document.getElementById("confirm-password").value ==
      document.getElementById("password").value
    ) {
      $.ajax({
        type: "POST",
        url: "SignUpServlet",
        data: formData,
        processData: false,
        contentType: false,
        success: function (response) {
          if (response == "ok") {
            Swal.fire({
              title: "You're all set!",
              text: "Your account has been successfully created.",
              icon: "success",
              confirmButtonColor: "#1b2330",
            }).then(() => location.replace("signin.jsp"));
          } else {
            Swal.fire({
              title: "Oops!",
              text: " It looks like that email address is already registered. ",
              icon: "error",
              confirmButtonColor: "#1b2330",
            });
          }
        },
        error: function (xhr, status, error) {
          console.error(xhr.responseText);
        },
      });
    } else {
      Toast.fire({
        icon: "warning",
        title: "Passwords do not match.",
      });
    }
  });
});
