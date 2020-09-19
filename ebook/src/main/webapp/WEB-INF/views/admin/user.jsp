<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link active" data-toggle="tab" aria-selected="true" data-target="ad-user-all">전체회원조회</a>
  </li>
</ul>
<c:if test="${member.auth!='ADMIN'}">
	<h1 class="user-admin">접근할 수 없는 정보입니다.</h1>
</c:if>
<c:if test="${member.auth=='ADMIN'}">
	<div class="user-box ad-user-all">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>회원 번호</th>
					<th>회원 ID</th>
					<th>회원 별명</th>
					<th>회원 Email</th>
					<th>가입일자</th>
					<th>탈퇴여부</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${list.size()!=0}">
					<c:forEach var="member" items="${list}">
						<tr>
							<td>${member.m_num}</td>
							<td>${member.id}</td>
							<td>${member.name}</td>
							<td>${member.email}</td>
							<td>${member.signup_date}</td>
							<td>${member.isDel}</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
</c:if>
<!-- 페이지네이션 -->
<ul class="pagination justify-content-center" style="margin:20px 0">
	<li class="page-item <c:if test="${!pm.prev}">disabled</c:if>"><a class="page-link" href="<%=request.getContextPath()%>/admin/user?page=${pm.startPage-1}&type=${pm.cri.type}&search=${pm.cri.search}"><i class="fas fa-chevron-left"></i></a></li>
	<c:forEach var="index" begin="${pm.startPage}" end="${pm.endPage}">
		<li class="page-item <c:if test="${index==pm.cri.page}">active</c:if>"><a class="page-link" href="<%=request.getContextPath()%>/admin/user?page=${index}&type=${pm.cri.type}&search=${pm.cri.search}">${index}</a></li>
	</c:forEach>
	<li class="page-item <c:if test="${!pm.next}">disabled</c:if>"><a class="page-link" href="<%=request.getContextPath()%>/admin/user?page=${pm.endPage+1}&type=${pm.cri.type}&search=${pm.cri.search}"><i class="fas fa-chevron-right"></i></a></li>
</ul>
<!-- 검색창 -->
<form action="<%=request.getContextPath()%>/admin/user">
	<div class="input-group mb-3">
		<select class="form-control " id="sell" name="type">
			<option value="0" <c:if test="${pm.cri.type==1}">selected</c:if>>전체</option>
			<option value="1" <c:if test="${pm.cri.type==2}">selected</c:if>>아이디</option>
			<option value="2" <c:if test="${pm.cri.type==3}">selected</c:if>>이메일</option>
			<option value="3" <c:if test="${pm.cri.type==4}">selected</c:if>>탈퇴여부</option>
		</select>
		<input type="text" class="form-control" placeholder="회원 검색" name="search" value="${pm.cri.search}">
		<div class="input-group-append">
			<button class="btn btn-success " type="submit">검색</button>
		</div>
	</div>
</form>
    <script>
	    $(function(){
	        $('.nav .nav-link').click(function(e){
	            e.preventDefault();
	            $('.nav .nav-link').attr('aria-selected','false');
	            $(this).attr('aria-selected','true');
	            adtoonView();
	        })
	    })
        function adtoonView(){
            var target = $('.nav-item .nav-link[aria-selected=true]').attr('data-target');
            $('.ad-toon>.ad-toon-list').addClass('display-none');
            $('.ad-toon .'+target).removeClass('display-none');
        }
        adtoonView();
    </script>