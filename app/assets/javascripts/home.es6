function setHeaderHeight() {
  var windowHeight = $(window).height()
  $('#header').css('height', windowHeight + 'px')
}

$(window).resize(() => { setHeaderHeight() })
$(document).ready(() => { setHeaderHeight() })
