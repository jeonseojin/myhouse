<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<table class="table table-hover">
	<thead>
	   	<tr>
	   		<th>제목</th>
	   		<th>${cl.cl_title}</th>
	   		<th>등록일</th>
	   		<th>${cl.cl_date}</th>
	   		<th>등록자</th>
	   		<th>${cl.cl_member}</th>
		</tr>
	</thead>
</table>
<div class="clcon-box">
	${cl.cl_content}
</div>
<form method="post" action="<%=request.getContextPath()%>/admin/answer">
	<table class="table table-hover">
		<thead>
		   	<tr>
		   		<th>제목</th>
		   		<th><input class="ad-notice-title" type="text" name="cl_title"></th>
		   		<th>등록자</th>
		   		<th>${member.name}</th>
			</tr>
		</thead>
	</table>
	<div class="ad-notice-content-box">
		<textarea name="cl_content"></textarea>
	</div>
	<input type="hidden" name="cl_member" value="${member.name}">
	<input type="hidden" name="cl_auth" value="${member.auth}">
	<input type="hidden" name="cl_type" value="answer">
	<input type="hidden" name="cl_answer" value="${cl.cl_num}">
	<button class="btn btn-secondary float-right">답변하기</button>
</form>
<a href="<%=request.getContextPath() %>/admin/claim?page=${cri.page}&type=${cri.type}&search=${cri.search}" class="float-left"><button type="button" class="btn btn-outline-secondary">목록</button></a>
