// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
$(document).ready(function() {
  $("#new_url_form").on("submit", function(event){
    event.preventDefault();

    // var valid_url_pattern = new RegExp("^https?:\/\/.+(\..{2,5}).*$");
    var valid_url_pattern = /^https?:\/\/.+(\..{2,5}).*$/i
    var input_url = $("#url_original_url").val();

    is_valid_url = valid_url_pattern.test(input_url);

    if(is_valid_url) {
      var data = $(this).serialize();
      var create_url = "/urls"

      $.post(create_url, data, function(response){
        $(".url_list").append(response);
      });
    }
    else {
      alert("URL is not valid!");
    }

  });
});