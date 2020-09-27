$(function(){
                           
            $('.search-btn').click(function(e){
                e.stopPropagation();
                $('.logNav').stop().slideUp(); 
                $('.search').stop().slideToggle(); 
                $('.search-input').focus();
            })
	        $('.search-filed-btn').click(function(){
	        	$('.search-list').removeClass('display-none');
	        })
            $('.logNav-btn').click(function(e){
                e.stopPropagation();
                $('.search').stop().slideUp(); 
                $('.logNav').stop().slideToggle(); 
            })
            $('.search').click(function(e){
                e.stopPropagation();
                $('.search').slideDown();
            })
            $('.logNav').click(function(e){
 				e.stopPropagation();
                $('.logNav').slideDown();
            })
            $('.login-btn').click(function(){
            	$('.login-form').submit();
            })
        
        $(document).click(function(e){
                $('.search').stop().slideUp(); 
                $('.logNav').stop().slideUp(); 
        })
        
        $(function(){
	        $('.nav .nav-link').click(function(e){
	            e.preventDefault();
	            $('.nav .nav-link').attr('aria-selected','false');
	            $(this).attr('aria-selected','true');
	            adtoonView();
	        })
	    })

        function adtoonView(){
            var target = $('.nav-item .nav-link[aria-selected=true]').attr('data-target');
            $('.ad-toon>.ad-toon-list').addClass('display-none');
            $('.ad-toon .'+target).removeClass('display-none');
        }
        adtoonView();
})