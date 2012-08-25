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

$(function(){
  $.fn.readmore.defaults.substr_len = 50;
  $.fn.readmore.defaults.more_link  = '<a class="more">すべて読む</a>';
  $(".movie_outline").readmore();
});

$(function(){
  setTimeout("scrollTo(0,1)", 100);
});

$(function(){
  $('#headline_search_trigger').click(
    function() {
      $('#service_logo').toggle();
      $('#headline_search').toggle();
      $('#left_line').toggle();
      if ($('#headline_search').css('display') == 'block') {
        $('#headline').css('height', '32')
        $('.headline_search_box').focus();
      }
    }
  )
  $('#headline_search_reverse').click(
    function() {
      $('#service_logo').toggle();
      $('#headline_search').toggle();
      $('#left_line').toggle();
      if ($('#headline_search').css('display') == 'block') {
        $('#headline').css('height', '32')
        $('.headline_search_box').focus();
      }
    }
  )
});
