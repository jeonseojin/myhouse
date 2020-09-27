<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${member.name!=null&&member.auth=='ADMIN'}">
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
	<textrea class="clcontent-box">
		${cl.cl_content}
	</textrea>
	<a href="<%=request.getContextPath() %>/admin/claim?page=${cri.page}&type=${cri.type}&search=${cri.search}" class="float-left"><button type="button" class="btn btn-outline-secondary">목록</button></a>
	<div class="float-right">
		<c:if test="${cl.cl_auth=='ADMIN'}">
			<a href="<%=request.getContextPath()%>/admin/clmodify?num=${cl.cl_num}"><button type="button" class="btn btn-primary">수정</button></a>
		</c:if>
		<c:if test="${cl.cl_auth=='USER'}">
			<a href="<%=request.getContextPath()%>/admin/answer?num=${cl.cl_num}"><button type="button" class="btn btn-link">답변등록</button></a>
		</c:if>
	</div>
</c:if>
<c:if test="${member.name==null||member.auth!='ADMIN'}">
	<h1>접근할 수 없는 경로 입니다.</h1>
</c:if>