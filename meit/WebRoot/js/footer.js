;(function($){
	function rec(name){
		$(name).bind("mouseover",function(){
			$(this).css({"background":"#EEEEEE"});
		}).bind("mouseout",function(){
			$(this).css({"background":"#F9F9F9"});
		});
	}
	rec(".recommend li");
})(jQuery);