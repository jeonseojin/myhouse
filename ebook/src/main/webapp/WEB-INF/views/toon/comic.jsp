<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="epscroll-box">
	<ul>
		<c:forEach var="eplist" items="${eplist}">
		<li><img src="/ebook/resources/img${eplist.e_img}"></li>
		</c:forEach>
	</ul>	
</div>
<%@ include file="../toon/comment.jsp" %>