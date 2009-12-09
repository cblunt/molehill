(function($){
  jQuery.fn.idle = function(time) {
    var o = $(this);
    return o.queue(function() {
      setTimeout(function() {
        o.dequeue();
      }, time);
    });
  }
})(jQuery);
