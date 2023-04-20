$(document).ready(function() {
  $(".dropdown-button").click(function(event) {
    event.stopPropagation();
    $(this).siblings(".dropdown-content").css("display", "block");
  });

  $(document).click(function() {
    $(".dropdown-content").css("display", "none");
  });
});
