// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function() {
  $('.post').live('mouseover', function() {
    $(this).find('.context_sensitive').css('visibility', 'visible')
  });

  $('.post').live('mouseout', function() {
    $(this).find('.context_sensitive').css('visibility', 'hidden')
  });
});
