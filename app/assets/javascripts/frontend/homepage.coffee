$(document).ready ->
  previousScroll = 0
  d = 0
  s = 0
  # parallax script
  $(window).scroll ->
    currentScroll = $(this).scrollTop()
    if currentScroll > previousScroll
      d = s - .5
      $('.parallax').css 'background-position-y', d
    else
      d = s + .5
      $('.parallax').css 'background-position-y', d
    previousScroll = currentScroll
    s = d
    return
  return