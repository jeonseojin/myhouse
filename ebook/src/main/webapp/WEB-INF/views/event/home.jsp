<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form action="<%=request.getContextPath()%>/event">
	<ul class="event-list">
		<c:forEach var="evlist" items="${evlist}">
			<c:if test="${evlist.ev_engtitle!='pay'}">
				<li class="event-item"><a class="event-link" href="<%=request.getContextPath()%>/event${evlist.ev_url}?title=${evlist.ev_engtitle}">
					<img src="/ebook/resources/img${evlist.ev_img}"></a></li>
			</c:if>
		</c:forEach>
	</ul>
</form>