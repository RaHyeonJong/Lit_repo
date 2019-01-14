$(document).ready(function() {
	
	$( ".extra-controls" ).delegate( "input", "focus blur", function() {
	  var elem = $( this );
	  setTimeout(function() {
	    elem.parent().toggleClass( "unminimised", elem.is( ":focus" ) );
	  }, 0 );
	});
	
	
	var min = 0,
	    max = 999,
	    from = 0,
	    to = 999;   
	
	blam('js-range-slider1', 'js-from', 'js-to', 0, 200000, 10000, 190000);
	blam('js-range-slider2', 'js-from', 'js-to', min, max, from, to);
	
	
	function blam($range, $from, $to, min, max, from, to) {
	  
	  $from = $('.' + $range).parent().find('.' + $from);
	  $to = $('.' + $range).parent().find('.' + $to);
	  $range = $('.' + $range);
	  
	    $range.ionRangeSlider({
	      type: "double",
	      min: min,
	      max: max,
	      from: from,
	      to: to,
	      prefix: "￦",
	      onChange: function (data) {
	        from = data.from;
	        to = data.to;
	        updateValues();
	      }
	    });
	 	var slider = $range.data("ionRangeSlider");
	
	    $from.on("change", function () {
	      from = $(this).prop("value");
	      if (from < min) {
	        from = min;
	      }
	      if (from > to) {
	        from = to;
	      }
	      updateValues();    
	      updateRange();
	    });
	
	    $to.on("change", function () {
	      to = $(this).prop("value");
	      if (to > max) {
	        to = max;
	      }
	      if (to < from) {
	        to = from;
	      }
	      updateValues();    
	      updateRange();
	    });
	
	    var updateRange = function () {
	      slider.update({
	        from: from - (from%1000),
	        to: to - (to % 1000)
	      });
	    };
	
	    var updateValues = function () {
	      $from.prop("value", from - (from%1000));
	      $to.prop("value", to - (to % 1000));
	    };
	}
});