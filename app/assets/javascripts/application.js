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
  makeScrollable("#category_container","#category_menu");
  makeScrollable("#product_container","#product_menu");  

  //Function to change the circle border color when category is selected
  $('#category_menu table tr td a').click(function(e) {
        e.preventDefault();
        var $this = $(this);
        //alert($this.attr("value"));
        if($this.attr("value") != ""){
          var categoryId = $this.attr("value");
          $.ajax({
              type: 'GET',
              url: '/categories/add_products',
              data: 'category_id='+categoryId,
              success: function(msg){                
              }
          });    
          //$('#category_selectedcategoryid').attr("value",$this.attr("value")); 
          //alert($('#category_selectedcategoryid').attr("value"));               
          var spanclass = '#gc'+$this.text().replace(/ /g,'');          
          $('#category_menu table tr td span').removeClass('gray-circle-red');
          $(spanclass).addClass('gray-circle-red');
          makeScrollable("#product_container","#product_menu");
          $('#categorynext').removeAttr('disabled');
          //return false;
        }        
    });      
  //Function to change the circle border color when product is selected  
  $('#product_menu table tr td a').click(function(e) {        
        e.preventDefault();
        var $this = $(this);
        var spanclass = '#gc'+$this.text().replace(/ /g,'');
        $('#product_menu table tr td span').removeClass('gray-circle-red');
        $(spanclass).addClass('gray-circle-red');
    });  
});
//function linkclicked(circleid)
//{
//  var circle = $(circleid);
//  $('.sc_menu table tr td span').addClass("gray-circle");  
//  circle.addClass("gray-circle-red");
//}  