<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body>
	    <div class="main-banner">
           <div class="banner-swiper">
           		<c:forEach var="evlist" items="${evlist}">
	               <div class="banner-item">
	                   <a href="#" class="banner-link">
	                       	<div class="banner-img banner-img-big">
	                           	<img src="/ebook/resources/img${evlist.ev_banner}" alt="">
	                       	</div>
	                   </a>
	               </div>
				</c:forEach>
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
            <div class="main-left">
            	<c:forEach var="uprank" items="${uprank}">
            		<img alt="" src="/ebook/resources/img${uprank.t_img}">
            	</c:forEach>
            </div>
            <div class="main-right">
            <c:forEach var="viewrank" items="${viewrank}">
            		<img alt="" src="/ebook/resources/img${viewrank.t_img}">
            	</c:forEach>
            </div>
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