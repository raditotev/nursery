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

    // Will also work for relative and absolute hrefs
    var url = window.location;
    $('#navbar-collapse .navbar-nav li a').filter(function() {
        return this.href == url;
    }).parent().addClass('active');

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

    // Rotate Testimonials
    $('#testimonials li').hide().eq(0).show();

    function next(){
      $('#testimonials li:visible').delay(5000).fadeOut('slow',function(){
        if ($('#testimonials li:visible').length > 0){
          return
        }
        var $next = $(this).next();
        if ($next.length == 0) { $next = $('#testimonials ul li:first') }
        $next.fadeIn('slow', next);
      });
     }
    next();
  });
}

$(document).on('turbolinks:load', ready);

// $(document).ready(function() {
//   $(function() {
//     $('#navbar-collapse .navbar-nav li').click(function(e) {
//       $('#navbar-collapse .navbar-nav li.active').removeClass('active');
//       var $this = $(this);
//       if (!$this.hasClass('active')) {
//         $this.addClass('active');
//       }
//       // e.preventDefault();
//     });
//   });
// });
