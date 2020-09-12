<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--  -->

<div class="epscroll-box">
	<ul>
		<c:forEach var="eplist" items="${eplist}">
		<li><img src="/ebook/resources/img${eplist.e_img}"></li>
		</c:forEach>
	</ul>	
</div>

<div class="epcomment-box">
	<div class="eptit-cmt">댓글
		<span class="eptit-cmt-count">(<span>${cmtnum}</span>)</span>
		<a class="eptit-i-btn"><i class="fas fa-exclamation-circle"></i></a>
	</div>
	<div class="box-comment">
		<c:if test="${member.name!=null}">
			<div class="epcomment-regist">
				<div class="epcomment-submit">
					<textarea class="epregist-text notmem-reg">주제와 무관한 댓글이나 스포일러, 악플은 경고조치 없이 삭제되며 징계 대상이 될 수 있습니다</textarea>
					<button class="epcomment-btn-submit">댓글달기</button>
				</div>
			</div>
		</c:if>
		<c:if test="${member.name==null}">
		<form action="<%=request.getContextPath()%>/toon/comic" method="post">
			<div class="epcomment-regist">
				<span class="epregist-name">${member.name}</span>
				<div class="epcomment-submit">
					<textarea class="epregist-text" name="co_content"></textarea>
					<button class="epcomment-btn-submit">댓글달기</button>
				</div>
			</div>
			<input type="hidden" name="co_member" value="${member.name}">
		</form>
		</c:if>
	</div>
	<div class="epcmt-box">
		<c:forEach var="cmtlist" items="${cmtlist}">
		<div class="epcmt-list">
			<span class="epcmt-name">${cmtlist.co_member}</span>
			<div class="epcmt-text">${cmtlist.co_content}</div>
			<div class="epcmt-end">
				<span class="epcmt-date">${cmtlist.co_date}</span>
				<div class="epcmt-btnbox">
					<button class="epcmt-up"><i class="far fa-hand-point-up"></i>${cmtlist.co_up}</button>
					<button class="epcmt-down"><i class="far fa-hand-point-down "></i>${cmtlist.co_down}</button>
				</div>
			</div>
		</div>
		</c:forEach>
	</div>
</div>
<script>
	$(function(){
		$('.notmem-reg').click(function(){
			alert("댓글 작성은 로그인 후에 사용하실 수 있습니다.");
		})
	})
</script>