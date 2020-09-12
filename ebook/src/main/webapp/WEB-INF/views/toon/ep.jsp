<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
${toon.title}
<ul class="toon-list">
	<li class="toon-item">
		<a class="toon-link" href="<%=request.getContextPath()%>/toon/ep">
			<img src="/ebook/resources/img${toon.t_img}" height="140" class="img_thumb">
			<span class="toon-title">${toon.title}</span>
			<span class="toon-artist">${toon.artist}</span>
		</a>
	</li>
</ul>
