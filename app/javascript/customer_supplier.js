$(document).on('change', '#search-checkbox', function(){
    if ($(this).is(':checked')) {
      $('.search-field').attr('name', 'q[supplier_or_passenger_name_or_reservation_num_cont]');
    } else {
      $('.search-field').attr('name', 'q[customer_or_passenger_name_or_reservation_num_cont]');
    }
  })
$(document).ready(function() {
  $("#mobile-menu-button").click(function() {
    $("#mobile-menu").toggleClass("hidden");
  });

  if ($('.flash-message').length > 0){
    var flashMessage = $(".flash-message");
    setTimeout(function () {
      flashMessage.fadeOut("slow", function () {
        flashMessage.remove();
      });
    }, 3000);
  }
});
