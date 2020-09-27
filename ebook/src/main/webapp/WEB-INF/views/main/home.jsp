<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	    <div class="main-banner">
           <div class="banner-swiper">
           		<c:forEach var="evlist" items="${evlist}">
           			<c:if test="${evlist.ev_engtitle!='pay'}">
		               <div class="banner-item">
		                   <a href="<%=request.getContextPath()%>/event${evlist.ev_url}/?title=${evlist.ev_engtitle}" class="banner-link">
		                       	<div class="banner-img banner-img-big">
		                           	<img src="/ebook/resources/img${evlist.ev_banner}" alt="">
		                       	</div>
		                       	<div class="banner-img banner-img-small display-none">
		                           	<img class="banner-img-small display-none" src="/ebook/resources/img${evlist.ev_img}">
		                       	</div>
		                   </a>
		               </div>
	               </c:if>
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
            	<h4 class="main-rank-title">연재 랭킹</h4>
            	<c:forEach var="uprank" items="${uprank}" varStatus="status">
            		<span class="mainrank-rank">${status.count}</span>
	            	<a class="main-rank-list" href="<%=request.getContextPath()%>/toon/ep?Title=${uprank.t_title}">
	            		<img src="/ebook/resources/img${uprank.t_img}">
	            		<span class="mainrank-title">${uprank.title}</span>
	            		<span class="mainrank-artist">${uprank.artist}</span>
	            		<span class="mainrank-t_type">${uprank.t_type}</span>
	            	</a>
            	</c:forEach>
            </div>
            <div class="main-right">
            	<h4 class="main-rank-title">조회수 랭킹</h4>
            	<c:forEach var="viewrank" items="${viewrank}" varStatus="status">
	            	<span class="mainrank-rank">${status.count}</span>
	            	<a class="main-rank-list" href="<%=request.getContextPath()%>/toon/ep?Title=${viewrank.t_title}">
	            		<img alt="" src="/ebook/resources/img${viewrank.t_img}">
	            		<span class="mainrank-title">${viewrank.title}</span>
	            		<span class="mainrank-artist">${viewrank.artist}</span>
	            		<span class="mainrank-t_type">${viewrank.t_type}</span>
	            	</a>
            	</c:forEach>
            </div>
        </div>
        <div class="main-box">
        </div>
	<script>
		$('.banner-next').click(function(e){
			e.preventDefault();
			if(!$('.banner-item').is(':animated')){
				$('.banner-item').first().animate({'margin-left':'-1180px'},3000,function(){
                    $(this).detach().appendTo('.banner-swiper').removeAttr('style');
                })
			}
		})
		$('.banner-prev').click(function(e){
			e.preventDefault();
			if(!$('.banner-item').is(':animated')){
				$('.banner-item').last().detach().prependTo('.banner-swiper');
				$('.banner-item').first().css('margin-left','-1180px');
				$('.banner-item').first().animate({'margin-left':'0'},3000)
			}
		})
        
	</script>