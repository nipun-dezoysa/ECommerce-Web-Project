
$(document).ready(function () {
  $("#filter").submit(function (e) {
    location.href = "/products?search=" + $("#search").val();
  });
});
