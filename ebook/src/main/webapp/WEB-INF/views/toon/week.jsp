<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form action="<%=request.getContextPath()%>/toon">
    <div class="toon-week-box">
        <button class="toon-week" type="button" value="1" data-target="Mon" name="cweek" aria-selected="true">월</button>
        <button class="toon-week" type="button" value="2" data-target="Tue" name="cweek">화</button>
        <button class="toon-week" type="button" value="3" data-target="Wed" name="cweek">수</button>
        <button class="toon-week" type="button" value="4" data-target="Thur" name="cweek">목</button>
        <button class="toon-week" type="button" value="5" data-target="Fri" name="cweek">금</button>
        <button class="toon-week" type="button" value="6" data-target="Sat" name="cweek">토</button>
        <button class="toon-week" type="button" value="7" data-target="Sun" name="cweek">일</button>
        <button class="toon-week" type="button" value="8" data-target="Ten" name="cweek">열흘</button>
    </div>
    <div class="toon-box">
    	<c:forEach var="toon" items="${wlist}">
	    	<c:if test="${toon.t_week==1}">
			    <ul class="toon-list Mon">
					 <li class="toon-item">
						<a class="toon-link" href="<%=request.getContextPath()%>/toon/ep?Title=${toon.t_title}&page=${pm.cri.page}&type=${pm.cri.type}&search=${pm.cri.search}">
						    <img src="/ebook/resources/img${toon.t_img}" height="140" class="img_thumb">
						    <span class="toon-title">${toon.title}</span>
							<span class="toon-artist">${toon.artist}</span>
						</a>
					</li>
			    </ul>
		    </c:if>
	    	<c:if test="${toon.t_week==2}">
			    <ul class="toon-list Tue">
					 <li class="toon-item">
						<a class="toon-link" href="<%=request.getContextPath()%>/toon/ep?Title=${toon.t_title}&page=${pm.cri.page}&type=${pm.cri.type}&search=${pm.cri.search}">
						    <img src="/ebook/resources/img${toon.t_img}" height="140" class="img_thumb">
						    <span class="toon-title">${toon.title}</span>
							<span class="toon-artist">${toon.artist}</span>
						</a>
					</li>
			    </ul>
		    </c:if>
		    <c:if test="${toon.t_week==3}">
			    <ul class="toon-list Wed">
					 <li class="toon-item">
						<a class="toon-link" href="<%=request.getContextPath()%>/toon/ep?Title=${toon.t_title}&page=${pm.cri.page}&type=${pm.cri.type}&search=${pm.cri.search}">
						    <img src="/ebook/resources/img${toon.t_img}" height="140" class="img_thumb">
						    <span class="toon-title">${toon.title}</span>
							<span class="toon-artist">${toon.artist}</span>
						</a>
					</li>
			    </ul>
		    </c:if>
		    <c:if test="${toon.t_week==4}">
			    <ul class="toon-list Thur">
					 <li class="toon-item">
						<a class="toon-link" href="<%=request.getContextPath()%>/toon/ep?Title=${toon.t_title}&page=${pm.cri.page}&type=${pm.cri.type}&search=${pm.cri.search}">
						    <img src="/ebook/resources/img${toon.t_img}" height="140" class="img_thumb">
						    <span class="toon-title">${toon.title}</span>
							<span class="toon-artist">${toon.artist}</span>
						</a>
					</li>
			    </ul>
		    </c:if>
		    <c:if test="${toon.t_week==5}">
			    <ul class="toon-list Fri">
					 <li class="toon-item">
						<a class="toon-link" href="<%=request.getContextPath()%>/toon/ep?Title=${toon.t_title}&page=${pm.cri.page}&type=${pm.cri.type}&search=${pm.cri.search}">
						    <img src="/ebook/resources/img${toon.t_img}" height="140" class="img_thumb">
						    <span class="toon-title">${toon.title}</span>
							<span class="toon-artist">${toon.artist}</span>
						</a>
					</li>
			    </ul>
		    </c:if>
		    <c:if test="${toon.t_week==6}">
			    <ul class="toon-list Sat">
					 <li class="toon-item">
						<a class="toon-link" href="<%=request.getContextPath()%>/toon/ep?Title=${toon.t_title}&page=${pm.cri.page}&type=${pm.cri.type}&search=${pm.cri.search}">
						    <img src="/ebook/resources/img${toon.t_img}" height="140" class="img_thumb">
						    <span class="toon-title">${toon.title}</span>
							<span class="toon-artist">${toon.artist}</span>
						</a>
					</li>
			    </ul>
		    </c:if>
		    <c:if test="${toon.t_week==7}">
			    <ul class="toon-list Sun">
					 <li class="toon-item">
						<a class="toon-link" href="<%=request.getContextPath()%>/toon/ep?Title=${toon.t_title}&page=${pm.cri.page}&type=${pm.cri.type}&search=${pm.cri.search}">
						    <img src="/ebook/resources/img${toon.t_img}" height="140" class="img_thumb">
						    <span class="toon-title">${toon.title}</span>
							<span class="toon-artist">${toon.artist}</span>
						</a>
					</li>
			    </ul>
		    </c:if>
		    <c:if test="${toon.t_week==8}">
			    <ul class="toon-list Ten">
					 <li class="toon-item">
						<a class="toon-link" href="<%=request.getContextPath()%>/toon/ep?Title=${toon.t_title}&page=${pm.cri.page}&type=${pm.cri.type}&search=${pm.cri.search}">
						    <img src="/ebook/resources/img${toon.t_img}" height="140" class="img_thumb">
						    <span class="toon-title">${toon.title}</span>
							<span class="toon-artist">${toon.artist}</span>
						</a>
					</li>
			    </ul>
		    </c:if>
	    </c:forEach>
    </div>	
</form>
<script>
    $(function(){
    	 $('.toon-week-box .toon-week').on('click',function(){
	        $('.toon-week-box .toon-week').attr('aria-selected','false');
            $(this).attr('aria-selected','true');
            var week = $(this).val();
            toonW();
        })
    })
    function toonW(){
	    var target = $('.toon-week-box .toon-week[aria-selected=true]').attr('data-target');
	    $('.toon-box>.toon-list').addClass('display-none');
	    $('.toon-box .'+target).removeClass('display-none');
	}
    toonW();
</script>