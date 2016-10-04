// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
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

var ready
ready = function(){
  // Disable send request button if required fields empty
  $(function() {
    $('#send_request').hover(function() {
      if($("#request_name").val() != "" &&
          $("#request_email").val() !="" &&
          $("#request_date").val() !=""){
        $('#send_request').prop("disabled", false);
      } else {
        $('#send_request').prop("disabled", true);
      }
    });
    // Date picker for viewing request modal
    $('#request_date').datepicker({dateFormat: 'dd/mm/yy'});
  });
}

$(document).on('turbolinks:load', ready);
