$(document).on('turbolinks:load', function() {
  $(document).on('mouseenter', '.dropdown-button', function() {
    var dropdownContent = $(this).find(".dropdown-content");
    dropdownContent.css("display", "block");
  });

  $(document).on('mouseleave', '.dropdown-button', function() {
    var dropdownContent = $(this).find(".dropdown-content");
    dropdownContent.css("display", "none");
  });
});

$(document).ready(function() {
  var showChar = 43;
  var ellipsestext = "...";

  $('.reservation-details').each(function() {
      var content = $(this).html();

      if (content.length > showChar) {
          var c = content.substr(0, showChar);
          var h = content.substr(showChar, content.length - showChar);
          var html = c + '<span class="moreellipses">' + ellipsestext + '</span><span class="morecontent"><span style="display: none;">' + h + '</span></span>';

          $(this).html(html);
      }
  });
});



