<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${member.name!=null&&member.auth=='ADMIN'}">
	<form action="<%=request.getContextPath()%>/admin/clmodify" method="post">
		<table class="table table-hover">
			<thead>
				<tr>
					<th class="ad-not-t">공지사항 제목</th>
					<th><input class="ad-notice-title" type="text" name="cl_title" value="${cl.cl_title}"></th>
					<th>관리자</th>
					<th>${member.name}</th>
				</tr>
			</thead>
		</table>
		<select class="ad-notice-type" onchange="clType(this.value)">
			<option value="서비스 공지사항">서비스 공지사항</option>
			<option value="약관/방침 개정 공지">약관/방침 개정 공지</option>
			<option value="연재 관련 공지">연재 관련 공지</option>
			<option value="common">자주 묻는 질문</option>
			<option value="auth">로그인/계정</option>
			<option value="payment">결제/환불</option>
			<option value="etc">기타문의 / 제안</option>
		</select>
		<div class="ad-notice-content-box">
		 	<textarea name="cl_content">${cl.cl_content}</textarea>
		</div>
		<input type="hidden" name="cl_num" value="${cl.cl_num}">
		<input type="hidden" name="cl_type" value="서비스 공지사항">
		<button type="submit" class="btn btn-light float-right">등록</button>
	</form>
	<a href="<%=request.getContextPath() %>/admin/claim?page=${cri.page}&type=${cri.type}&search=${cri.search}" class="float-left"><button type="button" class="btn btn-outline-secondary">목록</button></a>
</c:if>
<c:if test="${member.name==null||member.auth=='USER'}">
	<h1>접근할 수 없는 경로 입니다.</h1>
</c:if>
<script>
	$(function(){
		$('.ad-notice-title').focus();
	})
	function clType(input){
		var value=$('.ad-notice-type').val();
		$('input[name=cl_type]').val(value);
	}
</script>