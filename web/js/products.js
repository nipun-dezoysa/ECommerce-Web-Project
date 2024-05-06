$(document).ready(function () {
  $("#filter").submit(function (e) {
    e.preventDefault();
    var formData = new FormData(this);
    if (formData.get("category") == "any") {
      formData.delete("category");
    }
    if (formData.get("color") == "any") {
      formData.delete("color");
    }
    if (formData.get("brand") == "any") {
      formData.delete("brand");
    }
    const asString = new URLSearchParams(formData).toString();
    location.href = "./products.jsp?" + asString;
  });
});
