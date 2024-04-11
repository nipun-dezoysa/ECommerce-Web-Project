document.addEventListener("DOMContentLoaded", function() {
    var removeButtons = document.querySelectorAll(".remove-button");
    removeButtons.forEach(function(button) {
      button.addEventListener("click", function() {
        var wishlistItem = this.closest(".wishlist-item");
        wishlistItem.parentNode.removeChild(wishlistItem);
      });
    });
  });
  