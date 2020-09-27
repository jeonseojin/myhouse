<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${member==null}">
	<form  action="<%=request.getContextPath()%>/signin" method="post">
		<div class="signin-box">
			<h1>
				로 그 인 
			</h1>
			<div class="signin-input">
				<input type="text" class="form-control" name="id" placeholder="아이디">
			</div>
			<div class="signin-input">
				<input type="password" class="form-control" name="pw" placeholder="비밀번호">
			</div>
			<button type="submit" class="signin-btn">로 그 인</button>
			<a class="btn-link" href="<%=request.getContextPath()%>/mail">비밀번호 찾기</a>
			<p class="signin-help">이용 중 도움이 필요하시면 [<a href="#">고객지원</a>] 페이지로 문의해주세요</p>
			<input type="hidden" value="${isLogin}" id="isLogin">
			<input type="hidden" value="${id}" id="id">
		</div>
	</form>
	
</c:if>
<c:if test="${member!=null}">
	<h1>로그인 페이지입니다. ${member.name}님은 이미 로그인 중이므로 접근할 수 없습니다.</h1>
</c:if>
