<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${member.name==null||member.auth=='USER'}">
	<h1>접근할 수 없는 경로 입니다.</h1>
</c:if>
<c:if test="${member.name!=null&&member.auth=='ADMIN'}">
	<form action="<%=request.getContextPath()%>/admin/evmodify" method="post" enctype="multipart/form-data">
		<div class="ad-event-list ad-event-record">
			<table class="table">
				<thead>
					<tr class="textline-center">
						<th class="adm-evTitle">제목</th>
						<th><input type="text" class="adm-ev-title" name="ev_title" value="${event.ev_title}"></th>
						<th>영어 제목</th>
						<th><input type="text" class="adm-ev-title" name="ev_engtitle" value="${event.ev_engtitle}"></th>
						<th class="adm-evTitle">등록자</th>
						<th class="adm-evTitle"><input type="text" class="adm-ev-title" name="ev_member" value="${event.ev_member}" readonly="readonly"></th>
					</tr>
				</thead>
			</table>
			<table class="table">
				<thead>
					<tr>
						<th class="adm-evTitle">이벤트 주소</th>
						<th><input type="text" class="adm-ev-title" name="ev_url" value="${event.ev_url}"></th>
					</tr>
				</thead>
			</table>
			<h3>이벤트 작품</h3>
			<ul class="adm-evtoon">
				<c:forEach var="toon" items="${tlist}">
					<li><input type="checkbox" class="adm-evtooncheck" name="ev_t_title" value="${toon.t_title}">${toon.title}</li>
				</c:forEach>
			</ul>
			<h4 class="ad-plot-h">페이지연결 이미지</h4>
			<div class="adm-p-evimg-box"></div>
			<input type="file" class="adm-p-evimg" name="file1">
			
			<h4 class="ad-plot-h">배너등록 이미지</h4>
			<div class="adm-b-evimg-box"></div>
			<input type="file" class="adm-b-evimg" name="file2">
				
			<h4 class="ad-plot-h">페이지 이미지</h4>
			<div class="adm-bp-evimg-box"></div>
			<input type="file" class="adm-bp-evimg" name="file3">
			<button class="btn btn-primary float-right">등록</button>
		</div>
		
		<input type="hidden" class="adm-toontitle" value="${event.ev_t_title}">
		<input type="hidden" name="ev_num" value="${event.ev_num}">
		<input type="hidden" name="ev_img" value="${event.ev_img}">
		<input type="hidden" name="ev_banner" value="${event.ev_banner}">
		<input type="hidden" name="ev_page" value="${event.ev_page}">
	</form>
</c:if>	
<script>
	var title=$('.adm-toontitle').val();
	genre = title.split(',');
	$('input[name=ev_t_title]').each(function(){
		if(genre.indexOf($(this).val())!= -1)
			$(this).attr('checked','true');
		console.log($(this).val())
	})
</script>