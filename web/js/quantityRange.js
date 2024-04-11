function updateQuantity(action, inputId, displayId) {
  var quantity = document.querySelector("#" + inputId);
  var no = document.querySelector("#" + displayId);
  if (action === "add") {
    quantity.value = parseInt(quantity.value) + 1;
    no.innerHTML = parseInt(no.innerHTML) + 1;
  } else {
    if (parseInt(quantity.value) > 1) {
      quantity.value = parseInt(quantity.value) - 1;
      no.innerHTML = parseInt(no.innerHTML) - 1;
    }
  }
}
