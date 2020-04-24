document.addEventListener("turbolinks:load", function() {
    loadCarousel();
});

document.addEventListener("turbolinks:before-cache", function() {
    $('services-div').owlCarousel('destroy');
  });

function loadCarousel(){
    $('#services-div').owlCarousel({
        stagePadding: 50,
        responsiveClass:true,
        loop: true,
        nav:true,
        autoplay:true,      
        margin:10,      
        rewind:true,
        responsive:{
          0:{
            items:1,
            nav:true
           },
          600:{
           items:2,
           
           },        
          1000:{
              items:3                        
          }
         }
       });
}