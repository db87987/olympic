	
$('.owl-carousel').owlCarousel({ 
    loop:true,
    margin:10,
    nav:true,
	 autoplay:true,
    autoplayTimeout:5000,
    responsive:{
      
        1000:{
            items:4
        }
    }
    })

function funcTab(n) {
   var NTab = document.getElementsByClassName('tab').length;
  for (var i=1; i < NTab+1; i++) {
    if (i != n){
     document.getElementById('tab'+i).className = 'tab';
     document.getElementById('tab_content'+i).className = 'tab_content'
     }
  }
   document.getElementById('tab'+n).className = 'tab active';
   document.getElementById('tab_content'+n).className = 'tab_content active';
}

