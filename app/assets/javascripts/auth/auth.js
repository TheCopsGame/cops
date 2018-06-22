function setHeaderHeight() {
  var windowHeight = $(window).height()
  $('#header').css('height', windowHeight + 'px')
}

$(window).resize(function() { setHeaderHeight() })
$(document).ready(function() { setHeaderHeight() })
