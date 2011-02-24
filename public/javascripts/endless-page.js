// endless_page.js

//If we're here, javascript is enabled. Hide regular pagination.
$(document).ready(function(){
		$(".pagination").hide();

		var currentPage = 1;
		var loading = false;
		
		var scroll = function() {
			if(nearBottomOfPage() && !loading)
			{
				if($("#ajax-loader").length==0)
				{
					$("div.entry").last().after("<div id='ajax-loader'><img src='images/ajax-loader.gif'/></div>");
				}
					
				loading=true;
				currentPage++;
				$.ajax({
					url: '/posts.js',
					data: 'page=' + currentPage,
					dataType: 'script',
					complete: function(){
						$("#ajax-loader").remove();
						loading=false;	
					}
				});
			}		
		};
		
		$(window).bind('scroll resize', scroll).trigger('scroll');
		
		function nearBottomOfPage() {
		  return $(window).scrollBottom() < 150;
		}
});