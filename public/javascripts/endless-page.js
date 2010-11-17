// endless_page.js

//If we're here, javascript is enabled. Hide regular pagination.
$(document).ready(function(){
		$(".pagination").hide();

		var currentPage = 1;
		var loading = false;
		
		var scroll = function() {
			if(nearBottomOfPage() && !loading)
			{
				loading=true;
				currentPage++;
				$.ajax({
					url: '/posts.js',
					data: 'page=' + currentPage,
					dataType: 'script',
					complete: function(){
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