//==============================================================
// CUSTOM SCRIPTS
// ==============================================================
$(window).bind("load resize",function(e){
  $('#primary, #secondary')
    .theiaStickySidebar({
    additionalMarginTop: 5,
    additionalMarginBottom: 5
  });
});

jQuery(document).ready(function($) {
  $(".back-to-top a").click(function() {
    $("html, body").animate({ scrollTop: 0 }, "medium");
    return false;
  });

  $('.slider-gallery .owl-carousel').owlCarousel({
      margin:4,
      autoWidth:true,
      autoplay: true,
      items:4,
      smartSpeed:1000,
      loop: true,
  })

	$('.featured-slider .owl-carousel').owlCarousel({
	    items: 1,
	    animateOut: 'fadeOut',
	    loop: true,
	    autoplay: true,
	    margin: 0,
      nav: true,
	    smartSpeed:1000,
	    autoplaySpeed: 1000,
      autoplayHoverPause: true, // Stops autoplay
	    navText : ['' , ''],
	 });

  var owl = $('.brands-area');
      owl.owlCarousel({
        autoplay: true,
        margin: 2,
        smartSpeed:600,
        autoplayHoverPause: true, // Stops autoplay
        nav: true,
        loop: true,
        autoplaySpeed: 600,
        autoplayTimeout:3000,
         navText : ['' , ''],
        responsive: {
          0: {
            items: 3
          },
          768: {
            items: 3
          },
          991: {
            items: 4
          },
          1199: {
            items: 4
          }
        }
     })

	var owl = $('.product-carousel5');
      owl.owlCarousel({
        autoplay: true,
        margin: 10,
        smartSpeed:600,
        loop: true,
        autoplaySpeed: 600,
        autoplayHoverPause: true, // Stops autoplay
        autoplayTimeout:3000,
        navText : ['' , ''],
        responsive: {
          0: {
            items: 3
          },
          480: {
            items: 3
          },
          991: {
            items: 4
          },
          1199: {
            items: 5
          }
        }
     })
});

$(window).load(function() { 
  $('.adrs-content-section').showMore({
    speedDown: 300,
    speedUp: 300,
    height: '165px',
    showText: 'More <i class="fas fa-angle-down"></i>',
    hideText: 'Less <i class="fas fa-angle-up"></i>'
  });

  $('.fact-moreless-content').showMore({
    speedDown: 300,
    speedUp: 300,
    height: '300px',
    showText: 'See More Facts and Features <i class="fas fa-angle-down"></i>',
    hideText: 'See Less Facts and Features <i class="fas fa-angle-up"></i>'
  });
});




$(window).scroll(function() {    
    var scrollCustom = $(window).scrollTop();
    var mrHeight = 500;

     //>=, not <=
    if (scrollCustom >= mrHeight) {
        //clearHeader, not clearheader - caps H
        $(".back-to-top").addClass("scrolled");
    }
    else {
        //clearHeader, not clearheader - caps H
        $(".back-to-top").removeClass("scrolled");
    }
}); //missing );


//Form validation
$('#carForm').on('submit', function(){
	let formPrice = $('#priceMjl').val();
	let formMakeYear = $('#makeYearMjl').val();
	let formKilometers = $('#kilometersMjl').val(); 
	let formEngine = $('#engineMjl').val(); 
	
	
	if (!formPrice || isNaN( formPrice )) {
		$('#priceErrMsg').text("Please enter a number.");
		return false;
	}else{
		if(formPrice<10){
			$('#priceErrMsg').text("Price should be more than or equal to 10");
			return false;
		}else{
			$('#priceErrMsg').text("");
			// Price completed | makeYear start
			if (!formMakeYear || isNaN( formMakeYear )) {
 			$('#makeYearErrMsg').text("Please enter a number.");
 			return false;
 		}else{
 			$('#makeYearErrMsg').text("");
 			if(!formKilometers || isNaN( formKilometers )){
 				$('#kilometerErrMsg').text("Please enter a number.");
 				return false;
 			}else{
 				$('#kilometerErrMsg').text("");
 				if(!formEngine || isNaN( formEngine )){
     				$('#engineErrMsg').text("Please enter a number.");
     				return false;
     			}
 			}
 		}
			
		}
	}
});



