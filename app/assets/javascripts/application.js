//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require jquery-ui
//= require turbolinks
//= require jquery.blueimp-gallery.min
//= require bootstrap-image-gallery
//= require jquery.blueimp-gallery.min.js
//= require_tree ./application
//= require_self

$(function() {
  // Hide flash messages after 3 seconds
  var flashCallback;
  flashCallback = function() {
    return $(".alert").fadeOut();
  };
  $(".alert").bind('click', (function(_this) {
    return function(ev) {
      return $(".alert").fadeOut();
    };
  })(this));
  return setTimeout(flashCallback, 3000);
});


var ready;
ready = function(){
  $(function() {

    var disable_button = function(button, field1, field2, field3){
        $(button).hover(function() {
        if($(field1).val() != "" &&
            $(field2).val() !="" &&
            $(field3).val() !=""){
          $(button).prop("disabled", false);
        } else {
          $(button).prop("disabled", true);
        }
      });
    }

    // Disable send request button if required fields empty (Request Viewing)
    disable_button("#send_request", "#request_name",
                               "#request_email", "#request_date");
    // Disable send message button if required fields empty (Contact Form)
    disable_button("#send_message", "#contact_form",
                               "#contact_subject", "#contact_content");
    // Date picker for viewing request modal
    $('#request_date').datepicker({dateFormat: 'dd/mm/yy'});
  });
}

$(document).on('turbolinks:load', ready);
