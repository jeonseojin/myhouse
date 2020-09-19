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
	   		<th>관리자</th>
	   		<th>${cl.cl_member}</th>
		</tr>
	</thead>
</table>
<div class="table table-hover">
	${cl.cl_content}
</div>
<a href="<%=request.getContextPath() %>/admin/claim?page=${cri.page}&type=${cri.type}&search=${cri.search}" class="float-left"><button type="button" class="btn btn-outline-secondary">목록</button></a>
<div class="float-right">
	<a href="<%=request.getContextPath()%>/admin/clmodify?num=${cl.cl_num}&Title=${cl.cl_title}"><button type="button" class="btn btn-primary">수정</button></a>
	<a href="<%=request.getContextPath()%>/admin/cldelete?Title=${cl.cl_title}"><button type="button" class="btn btn-danger">삭제</button></a>
</div>