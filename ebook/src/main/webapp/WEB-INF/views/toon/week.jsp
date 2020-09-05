<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form action="<%=request.getContextPath()%>/toon">
    <div class="toon-week-box">
        <button class="toon-week" value="1" name="week" aria-selected="true">월</button>
        <button class="toon-week" value="2" name="week"<c:if test="${pm.cri.type==2}">selected</c:if>>화</button>
        <button class="toon-week" value="3" name="week">수</button>
        <button class="toon-week" value="4" name="week">목</button>
        <button class="toon-week" value="5" name="week">금</button>
        <button class="toon-week" value="6" name="week">토</button>
        <button class="toon-week" value="7" name="week">일</button>
        <button class="toon-week" value="8" name="week">열흘</button>
    </div>
    <div class="toon-box">
    	<c:if test="${tlist.size()!=0}">
	        <ul class="toon-list">
	        	<c:forEach var="toon" items="${wlist}">
		            <li class="toon-item">
		                <a class="toon-link" href="<%=request.getContextPath()%>/toon">
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