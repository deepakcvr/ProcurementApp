//= require jquery
//= require jquery_ujs


// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require_tree .

function makeScrollable(wrapper, scrollable){
  // Get jQuery elements
  var wrapper = $(wrapper), scrollable = $(scrollable);

  // Hide images until they are not loaded
  scrollable.hide();
  var loading = $("<div class='loading'>Loading...</div>").appendTo(wrapper);

  // Set function that will check if all images are loaded
  var interval = setInterval(function(){
    var images = scrollable.find("img");
    var completed = 0;

    // Counts number of images that are succesfully loaded
    images.each(function(){
      if (this.complete) completed++;   
    });

    if (completed == images.length){
      clearInterval(interval);
      // Timeout added to fix problem with Chrome
      setTimeout(function(){

        loading.hide();
        // Remove scrollbars    
        wrapper.css({overflow: "hidden"});

        scrollable.slideDown("slow", function(){
          enable(); 
        });                 
      }, 1000); 
    }
  }, 100);

  function enable(){
    // height of area at the top at bottom, that don't respond to mousemove
    var inactiveMargin = 100;         
    // Cache for performance
    var wrapperWidth = wrapper.width();
    var wrapperHeight = wrapper.height();
    // Using outer height to include padding too
    var scrollableHeight = scrollable.outerHeight() + 2*inactiveMargin;
    // Do not cache wrapperOffset, because it can change when user resizes window
    // We could use onresize event, but it&#39;s just not worth doing that 
    // var wrapperOffset = wrapper.offset();

    //When user move mouse over menu          
    wrapper.mousemove(function(e){
      var wrapperOffset = wrapper.offset();
      // Scroll menu
      var top = (e.pageY -  wrapperOffset.top) * (scrollableHeight - wrapperHeight) / wrapperHeight  - inactiveMargin;

      if (top < 0){
        top = 0;
      }

      wrapper.scrollTop(top);
    });                
  }
}

$(function()
{
  makeScrollable("div#category_container","div#category_menu");
  makeScrollable("div#product_container","div#product_menu");
});