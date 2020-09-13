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
<script>
	$(function(){
		$('.notmem-reg').click(function(){
			alert("댓글 작성은 로그인 후에 사용하실 수 있습니다.");
		})
	})
</script>