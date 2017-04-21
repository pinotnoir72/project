$( document ).on('turbolinks:load', function() {
  $(".alert, .notice").delay(4000).fadeOut(1000);
})