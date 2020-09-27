<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form method="post" action="<%=request.getContextPath()%>/mail/mailSending">
	<div class="form-group">
		<input class="form-control" type="text" name="tomail" placeholder="비밀번호 받을 이메일을 입력하세요.">
	</div>
	<div class="form-group">
		<input class="form-control" type="text" name="title" placeholder="제목">
	</div>
	<div class="form-group">
		<input class="form-control" name="content" placeholder="회원님의 아이디를 입력하세요.">
	</div>
	<button class="btn btn-outline-success col-12">메일 보내기</button>
</form>