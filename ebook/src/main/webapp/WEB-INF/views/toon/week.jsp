<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form action="<%=request.getContextPath()%>/toon">
    <div class="toon-week-box">
        <button type="button" name="week" value="0" class="toon-week" aria-selected="true">월</button>
        <button type="button" name="week" value="1" class="toon-week">화</button>
        <button type="button" name="week" value="2" class="toon-week">수</button>
        <button type="button" name="week" value="3" class="toon-week">목</button>
        <button type="button" name="week" value="4" class="toon-week">금</button>
        <button type="button" name="week" value="5" class="toon-week">토</button>
        <button type="button" name="week" value="6" class="toon-week">일</button>
        <button type="button" name="week" value="7" class="toon-week">열흘</button>
    </div>
    <div class="toon-box">
    	<c:if test="${tlist.size()!=0}">
	        <ul class="toon-list">
	        	<c:forEach var="toon" items="${wlist}">
		            <li class="toon-item">
		                <a class="toon-link" href="<%=request.getContextPath()%>/toon/ep?title=${toon.title}&page=${pm.cri.page}&type=${pm.cri.type}&search=${pm.cri.search}">
		                    <img src="/ebook/resources/img${toon.t_img}" height="140" class="img_thumb">
		                    <span class="toon-title">${toon.title}</span>
		                    <span class="toon-artist">${toon.artist}</span>
		                </a>
		            </li>
	            </c:forEach>
	        </ul>
	    </c:if>
    </div>
</form>
<script>
    $(function(){
        $('.toon-week-box .toon-week').click(function(){
	        $('.toon-week-box .toon-week').attr('aria-selected','false');
            $(this).attr('aria-selected','true');
        })
    })
</script>