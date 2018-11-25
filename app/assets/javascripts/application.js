//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require activestorage
//= require semantic-ui
//= require_tree ./application

$(document).ready(function () {
  $('.menu-toggle').click(function (event) {
    event.preventDefault();
    $('.items').toggle();
  });
});
