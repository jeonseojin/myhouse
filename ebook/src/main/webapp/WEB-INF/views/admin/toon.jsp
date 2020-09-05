<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <ul class="nav nav-tabs">
        <li class="nav-item ad-toon-l">
          <a class="nav-link active" href="#" data-target="ad-toon-all">전체작품조회</a>
        </li>
        <li class="nav-item ad-toon-l">
          <a class="nav-link" data-toggle="tab" href="#" data-target="ad-toon-data">작품정보</a>
        </li>
        <li class="nav-item ad-toon-l">
          <a class="nav-link" data-toggle="tab" href="#" data-target="ad-toon-record">작품등록</a>
        </li>
        <li class="nav-item ad-toon-l">
          <a class="nav-link" data-toggle="tab" href="#" aria-selected="true" data-toggle="tab" data-target="ad-toon-episode">작품연재등록</a>
        </li>
        <li class="nav-item ad-toon-l">
          <a class="nav-link" data-toggle="tab" href="#" data-target="ad-toon-mo-del">작품수정/삭제</a>
        </li>
      </ul>
<div class="ad-toon">
	<div class="ad-toon-list ad-toon-all">
		<table class="table table-borderless">
			<thead>
				<tr>
					<th>번호</th>
					<th class="adt-plot">제목</th>
					<th>작가</th>
					<th class="adt-plot">줄거리</th>
					<th>찜</th>
					<th>좋아요</th>
					<th>완결여부</th>
					<th>등록일</th>
				</tr>
			</thead>
			<c:if test="${tlist.size()!=0}">
				<tbody>
					<c:forEach var="toon" items="${tlist}">
						<tr class="textling-center">
							<td>${toon.t_num}</td>
							<td>${toon.title}</td>
							<td>${toon.artist}</td>
							<td>${toon.plot}</td>
							<td>${toon.choice}</td>
							<td>${toon.like}</td>
							<td>${toon.lastEpisode}</td>
							<td>${toon.t_date}</td>
						</tr>
					</c:forEach>
				</tbody>
			</c:if>
		</table>
		<c:if test="${tlist.size()==0}"><h2 style="text-align: center;">검색하신 결과가 없습니다.</h2></c:if>
	<div class="pagination-box">
		<!-- 페이지네이션 -->
		<ul class="pagination justify-content-center" style="margin:20px 0">
			<li class="page-item <c:if test="${!pm.prev}">disabled</c:if>"><a class="page-link" href="<%=request.getContextPath()%>/admin/toon?page=${pm.startPage-1}&type=${pm.cri.type}&search=${pm.cri.search}"><i class="fas fa-chevron-left"></i></a></li>
			<c:forEach var="index" begin="${pm.startPage}" end="${pm.endPage}">
				<li class="page-item <c:if test="${index==pm.cri.page}">active</c:if>"><a class="page-link" href="<%=request.getContextPath()%>/admin/toon?page=${index}&type=${pm.cri.type}&search=${pm.cri.search}">${index}</a></li>
			</c:forEach>
			<li class="page-item <c:if test="${!pm.next}">disabled</c:if>"><a class="page-link" href="<%=request.getContextPath()%>/admin/toon?page=${pm.endPage+1}&type=${pm.cri.type}&search=${pm.cri.search}"><i class="fas fa-chevron-right"></i></a></li>
		</ul>
		<!-- 검색창 -->
		<form action="<%=request.getContextPath()%>/admin/toon">
			<div class="input-group mb-3">
				<select class="form-control " id="sell" name="type">
					<option value="0" <c:if test="${pm.cri.type==0}">selected</c:if>>전체</option>
					<option value="1" <c:if test="${pm.cri.type==1}">selected</c:if>>제목</option>
					<option value="2" <c:if test="${pm.cri.type==2}">selected</c:if>>작가</option>
					<option value="3" <c:if test="${pm.cri.type==3}">selected</c:if>>완결여부</option>
				</select>
				<input type="text" class="form-control adt-input" placeholder="작품 검색" name="search" value="${pm.cri.search}">
				<div class="input-group-append">
					<button class="btn btn-success " type="submit">검색</button>
				</div>
			</div>
		</form>
	</div>
</div>
	
	<div class="ad-toon-list ad-toon-record">
		<form action="<%=request.getContextPath()%>/admin/toon" method="post" enctype="multipart/form-data">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>제목</th>
						<th><input type="text" class="toon-text-box toon-text-title" name="title" placeholder="제목을 입력하세요"></th>
						<th>작가</th>
						<th><input type="text" class="toon-text-box" name="artist" placeholder="작가를 입력하세요"></th>
						<th>등록관리자</th>
						<th>${member.name}(${member.id})</th>
					</tr>
				</thead>
			</table>
			<div class="ad-plot-box">
				<h4 class="ad-plot-h">줄거리</h4>
				<textarea name="plot" class="ad-plot"></textarea>
				<h4 class="ad-plot-h">대표 이미지</h4>
				<input type="file" name="file2" name="t-img">
				<h4 class="ad-plot-h">연재 요일</h4>
				<select class="t_week-box" onchange="Selinput(this.value)">
					<option value="1">월요일</option>
					<option value="2">화요일</option>
					<option value="3">수요일</option>
					<option value="4">목요일</option>
					<option value="5">금요일</option>
					<option value="6">토요일</option>
					<option value="7">일요일</option>
					<option value="8">열흘</option>
				</select>
				<input type="hidden" id="t_week" name="t_week">
				<h4 class="ad-plot-h">장르선택</h4>
				<div class="check-box display-none"><input type="checkbox" name="g_code" value="#1" class="checkbox" checked="checked">전체</div>
				<div class="check-box"><input type="checkbox" name="g_code" value="#2" class="checkbox">로맨스</div>
				<div class="check-box"><input type="checkbox" name="g_code" value="#3" class="checkbox">드라마</div>
				<div class="check-box"><input type="checkbox" name="g_code" value="#4" class="checkbox">판타지</div>
				<div class="check-box"><input type="checkbox" name="g_code" value="#5" class="checkbox">개그</div>
				<div class="check-box"><input type="checkbox" name="g_code" value="#6" class="checkbox">액션</div>
				<div class="check-box"><input type="checkbox" name="g_code" value="#7" class="checkbox">학원</div>
				<div class="check-box"><input type="checkbox" name="g_code" value="#8" class="checkbox">미스터리</div>
				<div class="check-box"><input type="checkbox" name="g_code" value="#9" class="checkbox">일상</div>

			</div>
			<button class="btn btn-primary float-right">등록</button>
		</form>
	</div>
	
	<div class="ad-toon-list ad-toon-data">
		<table class="table table-borderless">
				<thead>
					<tr class="textline-center">
						<th>번호</th>
						<th class="adt-plot">대표이미지</th>
						<th class="adt-plot">제목</th>
						<th>작가</th>
						<th>찜</th>
						<th>좋아요</th>
						<th>등록일</th>
					</tr>
				</thead>
				<c:if test="${tlist.size()!=0}">
					<tbody>
						<c:forEach var="toon" items="${tlist}">
							<tr class="textline-center adt-line">
								<td>${toon.t_num}</td>
								<th class="adt-thbox"><a  href="<%=request.getContextPath()%>/toon/list"><img class="adt-img-box" src="/ebook/resources/img${toon.t_img}"></a></th>
								<td>${toon.title}</td>
								<td>${toon.artist}</td>
								<td>${toon.choice}</td>
								<td>${toon.like}</td>
								<td>${toon.t_date}</td>
							</tr>
						</c:forEach>
					</tbody>
				</c:if>
			</table>
	</div>
	
	<div class="ad-toon-list ad-toon-episode">
		<form action="<%=request.getContextPath()%>/admin/ep" method="post" enctype="multipart/form-data">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>제목</th>
						<th><input type="text" class="toon-text-box toon-text-title" name="e_t_title" placeholder="제목을 입력하세요"></th>
						<th>부제목</th>
						<th><input type="text" class="toon-text-box" name="e_title" placeholder="부 제목을 입력하세요"></th>
						<th><input type="text" class="toon-text-edition" name="e_edition"><span>회</span></th>
						<th>등록관리자</th>
						<th>${member.name}(${member.id})</th>
					</tr>
				</thead>
			</table>
			<div class="ad-plot-box">
				<h4 class="ad-plot-h">연재이미지</h4>
				<input type="file" name="file2" name="e-img" multiple="multiple">
				
			</div>
			<button class="btn btn-primary float-right">등록</button>
		</form>
	</div>
	
	<div class="ad-toon-list ad-toon-mo_del"></div>
</div>

    <script>
    function Selinput(input){
        document.getElementById("t_week").value =input;
    }


    </script> 