<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${member.name!=null&&member.auth=='ADMIN'}">
	<div class="ad-event-list ad-event-record">
		<table class="table">
			<thead>
				<tr class="textline-center">
					<th class="adm-evTitle">제목</th>
					<th>${event.ev_title}</th>
					<th>영어 제목</th>
					<th>${event.ev_engtitle}</th>
					<th>등록일</th>
					<th>${event.ev_date}</th>
					<th class="adm-evTitle">등록자</th>
					<th class="adm-evTitle">${event.ev_member}</th>
				</tr>
			</thead>
		</table>
		<table class="table">
			<thead>
				<tr>
					<th class="adm-ev-url">이벤트 주소</th>
					<c:if test="${event.ev_url==null}">
						<th>URL 주소가 없습니다.</th>
					</c:if>
					<c:if test="${event.ev_url!=null}">
						<th>${event.ev_url}</th>
					</c:if>
				</tr>
			</thead>
		</table>
		<table class="table">
			<thead>
				<tr>
					<th class="adm-ev-url">이벤트 작품</th>
					<c:if test="${event.ev_t_title==null}">
						<th>이벤트 연관 작품이 없습니다.</th>
					</c:if>
					<c:if test="${event.ev_t_title!=null}">
						<th>${event.ev_t_title}</th>
					</c:if>
				</tr>
			</thead>
		</table>
		<table class="table">
			<thead>
				<tr>
					<th style="line-height: 150px; text-align: center;"> 이미지 미리 보기</th>
					<th class="adev-imgtable"><img src="/ebook/resources/img${event.ev_img}" ></th>
					<th class="adev-imgtable"><img src="/ebook/resources/img${event.ev_banner}"></th>
					<th class="adev-imgtable"><img src="/ebook/resources/img${event.ev_page}"></th>
				</tr>
			</thead>
		</table>
		<a href="<%=request.getContextPath() %>/admin/event?page=${cri.page}&type=${cri.type}&search=${cri.search}" class="float-left"><button type="button" class="btn btn-outline-secondary">목록</button></a>
		<div class="float-right">
			<a href="<%=request.getContextPath()%>/admin/evmodify?title=${event.ev_engtitle}"><button type="button" class="btn btn-primary">수정</button></a>
		</div>
		<input type="hidden" id="title" value="${event.ev_engtitle}">
	</div>
</c:if>
<c:if test="${member.name==null||member.auth=='USER'}">
	<h1>접근할 수 없는 경로 입니다.</h1>
</c:if>
<script>

</script>