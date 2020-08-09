//blocs de même hauteur
var equalheight = function($target, callback) {

    var currentTallest = 0,
      currentRowStart = 0,
      rowDivs = new Array(),
      $el,
      topPosition = 0,
      nbEl = $target.length;

    $target.each(function(index, value) {
      $el = $(this);
      $el.css({ 'min-height': '0'});
      topPostion = $el.offset().top;

      if (currentRowStart != topPostion) {
        for (currentDiv = 0; currentDiv < rowDivs.length; currentDiv++) {
          rowDivs[currentDiv].css('min-height', currentTallest+1); // +1 to fix mystic IE bug...
        }
        rowDivs.length = 0; // empty the array
        currentRowStart = topPostion;
        currentTallest = $el.outerHeight();
        rowDivs.push($el);
      } else {
        rowDivs.push($el);
        currentTallest = (currentTallest < $el.outerHeight()) ? ($el.outerHeight()) : (currentTallest);
      }
      for (currentDiv = 0; currentDiv < rowDivs.length; currentDiv++) {
        rowDivs[currentDiv].css('min-height', currentTallest+1); // +1 to fix mystic IE bug...
      }
      if (callback && index == nbEl - 1) {
        callback();
      }
    });
}

/////////////////////////////////
/////////////////////////////////
/////////////////////////////////

var runEqualHeight = function() {
    equalheight($('.product .name'), function() {
    });
    equalheight($('.login-area .expandablebox'), function() {
    });
}


//Use equalHeight when images are loaded
$(window).load(function() {
    runEqualHeight('');
});

$(window).resize(function() {
    runEqualHeight('');
});