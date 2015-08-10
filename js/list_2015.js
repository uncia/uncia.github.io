

$(document).ready(function(){
   //Ãªµã
   $(".menu li").click(function(){
        var href = $(this).find('a').attr("href");
        var pos = $(href).offset().top;
        $("html,body").animate({scrollTop: pos}, 200); 
      return false
    });
	
	
	$(function(){
	$(".searchipt").focus(function(){
	$(this).addClass("ipt-focus");
	if($(this).val() ==this.defaultValue){
	$(this).val("");
	}
	}).blur(function(){
	$(this).removeClass("ipt-focus");
    if ($(this).val() == '') {
	$(this).val(this.defaultValue);
	}
	else{$(this).addClass("ipt-focus");}
	});
	})
	
   $(".menu li:first").addClass('m1')
   $(".menu li:nth-child(11)").addClass('m1')
   $(".menu li:nth-child(13)").addClass('m3')
   $(".menu li:nth-child(15)").addClass('m4')
   $(".menu li:nth-child(17)").addClass('m3')
   $(".menu li:nth-child(7n)").addClass('m2')
   $(".menu li:nth-child(2n)").addClass('m2')
   $(".menu li:nth-child(3n)").addClass('m3')
   $(".menu li:nth-child(4n)").addClass('m4')
   $(".menu li:nth-child(5n)").addClass('m5')
   $(".widget_archive li").hover(function(){
      $(this).toggleClass('item-hover')
   })		
	

$('.menu li').click(function(){
   $(this).addClass("current").siblings().removeClass("current");
   $(".main .list-1,.main .panel").eq($(".menu  li").index(this)).css({"opacity":"1"}).addClass('list-1-cur').siblings().removeClass('list-1-cur');
});
			
})

  

