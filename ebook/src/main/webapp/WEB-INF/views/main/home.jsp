<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body>
	    <div class="main-banner">
           <div class="banner-swiper">
	               <div class="banner-item">
	                   <a href="#" class="banner-link">
	                   		<div class="banner-img banner-img-small display-none">
	                   			<img src="https://cdn.lezhin.com/v2/inventory_items/4648237082935296/media/upperBannerMobile.webp?updated=1596435070000&amp;width=688">
	                   		</div>
	                       	<div class="banner-img banner-img-big">
	                           	<img src="https://cdn.lezhin.com/v2/inventory_items/4648237082935296/media/upperBanner.webp?updated=1596435070000&width=1180" alt="">
	                       	</div>
	                   </a>
	               </div>
	               <div class="banner-item">
	                   <a href="#" class="banner-link">
	                   		<div class="banner-img banner-img-small display-none">
	                   			<img class="banner-img-small display-none" src="https://cdn.lezhin.com/v2/inventory_items/4874818982313984/media/upperBannerMobile.webp?updated=1596373734000&amp;width=688">
	                   		</div>
	                       	<div class="banner-img banner-img-big">
	                          	<img clas="banner-img-big" src="https://cdn.lezhin.com/v2/inventory_items/4874818982313984/media/upperBanner.webp?updated=1596373734000&width=1180" alt="">
	                       	</div>
	                   </a>
	               </div>
	               <div class="banner-item">
	                   <a href="#" class="banner-link">
	                   		<div class="banner-img banner-img-small display-none">
	                   			<img class="banner-img-small display-none" src="https://cdn.lezhin.com/v2/inventory_items/5708691536412672/media/upperBannerMobile.webp?updated=1597138018000&amp;width=688">
	                   		</div>
	                       	<div class="banner-img banner-img-big">
	                            <img clas="banner-img-big" src="https://cdn.lezhin.com/v2/inventory_items/5708691536412672/media/upperBanner.webp?updated=1597138018000&width=1180" alt="">
	                        </div>
	                   </a>    
	               </div>
	            </div>
            <div class="banner-nav">
                <button class="banner-btn banner-prev">
                    <i class="fas fa-caret-left"></i>
                </button>
                <button class="banner-btn banner-next">
                    <i class="fas fa-caret-right"></i>
                </button>
            </div>
        </div>
        <div class="main-ranking">
            <div class="main-left"></div>
            <div class="main-right"></div>
        </div>
        <div class="main-box">
            <div class="main-new"></div>
            <div class="main-update"></div>
        </div>
	<script>
        function bannerRolling(){
           return setInterval(function(){
                $('.banner-item').first().animate({'margin-left':'-1180px'},300,function(){
                    $(this).detach().appendTo('.banner-swiper').removeAttr('style');
                })
            },3000)
        }
        
	</script>
</body>
