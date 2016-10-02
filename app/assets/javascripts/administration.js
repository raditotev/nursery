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
//= require turbolinks
//= require jquery.blueimp-gallery.min
//= require bootstrap-image-gallery
//= require_tree ./administration

var ready;
ready = function() {
  // Photo preview on album create
  var preview = $("#image-preview");
  $("#images_").change(function(event){
     var input = $(event.currentTarget);
     var files = input[0].files;
     for (var i = 0; i < files.length; i++){
      var file = files[i]
      var reader = new FileReader();
      reader.onload = function(e){
           image_base64 = e.target.result;
           var html = "<img src=" + image_base64 + " style='max-width: 200px;'>"
           preview.append(html);
       };
       reader.readAsDataURL(file);
     };
  });
  // Clear images when Browse is click again
  $("#images_").click(function(){
    $("#image-preview img").remove();
  });
};

// $(document).ready(ready);
$(document).on('turbolinks:load', ready);
