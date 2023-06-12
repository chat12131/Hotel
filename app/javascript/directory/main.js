$(function() {
  $(".dropdown-button").hover(
    function() {
      var dropdownContent = $(this).siblings(".dropdown-content");
      dropdownContent.css("display", "block");

      dropdownContent.hover(
        function() {
          $(this).css("display", "block");
        },
        function() {
          $(this).css("display", "none");
        }
      );
    },
    function() {
      var dropdownContent = $(this).siblings(".dropdown-content");
      dropdownContent.css("display", "none");
    }
  );

  $(document).click(function() {
    $(".dropdown-content").css("display", "none");
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

