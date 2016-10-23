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

    // Underline active link in navbar
    var url = window.location;
    $('#navbar-collapse .navbar-nav li a').filter(function() {
        return this.href == url;
    }).parent().addClass('active');

    // Show full job description - careers.thml.erb
    $('.fadeout').click(function(e) {
      e.preventDefault();
      var el = $(this)
      el.parent().css('height', 'auto');
      el.remove();
    });

    // Email validation
    var re = /^[-a-z0-9~!$%^&*_=+}{\'?]+(\.[-a-z0-9~!$%^&*_=+}{\'?]+)*@([a-z0-9_][-a-z0-9_]*(\.[-a-z0-9_]+)*\.(aero|arpa|biz|com|coop|edu|gov|info|int|mil|museum|name|net|org|pro|travel|mobi|[a-z][a-z])|([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}))(:[0-9]{1,5})?$/i
    var validEmail = false;

    function validateEmail (target){
      $(target).change(function(){
        var match = re.test($(this).val());
        if (!match) {
          var selector = (target == '#contact_from') ? 'label:first' : 'label:eq(1)'
          $(selector).append("<span id='invalid-email'> Please enter valid email</span>")
          $(this).addClass("incorrect");
          validEmail = false;
        } else {
          $('#invalid-email').remove();
          $(this).removeClass("incorrect");
          validEmail = true;
        }
      });
    }
    validateEmail ("#contact_from");
    validateEmail ("#request_email");

    // Disable send button
    var disableButton = function(button, field1, field2, field3){
      $(field1).add(field2).add(field3).on("change keyup", function(){
        if($(field1).val() != "" && $(field2).val() != "" && $(field3).val() !="" && validEmail){
          $(button).prop("disabled", false);
        } else {
          $(button).prop("disabled", true);
        }
      });
    }
    // Request Viewing
    disableButton("#send_request", "#request_name",
                               "#request_email", "#request_date");
    // Contact Form
    disableButton("#send_message", "#contact_from",
                               "#contact_subject", "#contact_content");

    // Date picker for viewing request modal
    $('#request_date').datepicker({dateFormat: 'dd/mm/yy'});

    // Rotate Testimonials
    function rotateTestimonials(){
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
    }
    rotateTestimonials();

    // Accordion Footer Links on small screens
    $('#footer ul li').click(function() {
      if ($(window).width() < 768){
        $(this).find(">ul").toggle(1000);
      }
    });

  });
}

$(document).on('turbolinks:load', ready);
