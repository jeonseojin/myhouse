<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<ul class="nav nav-tabs ad-event-nav">
    <li class="nav-item ad-event-l">
          <a class="nav-link ad-event-btn active" data-toggle="tab" aria-selected="true" data-target="ad-event-all">전체이벤트조회</a>
    </li>
    <li class="nav-item ad-event-l">
          <a class="nav-link ad-event-btn" data-toggle="tab" data-target="ad-event-record">이벤트등록</a>
    </li>
</ul>
<div class="ad-event">
	<div class="ad-event-list ad-event-all">
		<table class="table">
			<thead>
				<tr class="textline-center">
					<th>번호</th>
					<th class="adt-plot">제목</th>
					<th class="adt-plot">영어 제목</th>
					<th class="adt-plot">이미지</th>
					<th class="adt-plot">연관 작품</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${evlist.size()!=0}">
					<c:forEach var="evlist" items="${evlist}">
						<tr>
							<td>${evlist.ev_num}</td>
							<td>${evlist.ev_title}</td>
							<td>${evlist.ev_engtitle}</td>
							<td><img src="/ebook/resources/img${evlist.ev_img}" style="height: 120px;"></td>
							<td>${evlist.ev_t_title}</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${evlist.size()==0}">
					<h2 style="text-align: center;">검색하신 결과가 없습니다.</h2>
				</c:if>
			</tbody>
		</table>
		<div>
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
						<option value="0" <c:if test="${pm.cri.event==1}">selected</c:if>>전체</option>
						<option value="1" <c:if test="${pm.cri.event==2}">selected</c:if>>제목</option>
					</select>
					<input type="text" class="form-control adt-input" placeholder="작품 검색" name="search" value="${pm.cri.search}">
					<div class="input-group-append">
						<button class="btn btn-success " type="submit">검색</button>
					</div>
				</div>
				<input type="hidden" name="t_num" value="${toon.t_num}" readonly="readonly">
			</form>
		</div>
	</div>
	<form action="<%=request.getContextPath()%>/admin/event" method="post" enctype="multipart/form-data">
	<div class="ad-event-list ad-event-record">
		<table class="table">
			<thead>
				<tr class="textline-center">
					<th class="adm-evTitle">제목</th>
					<th><input type="text" class="adm-ev-title" name="ev_title"></th>
					<th>영어 제목</th>
					<th><input type="text" class="adm-ev-title" name="ev_engtitle"></th>
					<th class="adm-evTitle">등록자</th>
					<c:if test="${member.auth!=ADMIN}">
						<th class="adm-evTitle">${member.name}<input type="hidden" name="ev_member" value="${member.name}"></th>
					</c:if>
				</tr>
			</thead>
		</table>
		<table class="table">
			<thead>
				<tr>
					<th>이벤트 작품</th>
					</tr>
			</thead>
		</table>
		<table class="table">
			<thead>
				<tr>
					<c:forEach var="toon" items="${tlist}">
						<th class="adm-ev-t_title"><input type="checkbox" name="ev_t_title" value="${toon.t_title}">${toon.title}</th>
					</c:forEach>
				</tr>
			</thead>
		</table>
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
	</form>
</div>

<script>
	$(document).ready(function(){
		$('.adm-p-evimg').on("change",handlePFilesSelect);
	})
	$(document).ready(function(){
		$('.adm-b-evimg').on("change",handleBaFilesSelect);
	})
		$(document).ready(function(){
		$('.adm-bp-evimg').on("change",handleBpFilesSelect);
	})
	var sel_files=[];
	function handlePFilesSelect(e){
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		filesArr.forEach(function(f){
			$('.adm-p-evimg-box').empty();
			if(!f.type.match("image.*")){
				alert("확장자는 이미지 확장자만 가능")
				return;
			}
			sel_files.push(f);
			var reader = new FileReader();
			reader.onload = function(e){
				var img_html = "<img src=\"" + e.target.result + "\"/>";
				$('.adm-p-evimg-box').append(img_html);
			}
			reader.readAsDataURL(f);
		})
	}
	function handleBaFilesSelect(e){
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		filesArr.forEach(function(f){
			$('.adm-b-evimg-box').empty();
			if(!f.type.match("image.*")){
				alert("확장자는 이미지 확장자만 가능")
				return;
			}
			sel_files.push(f);
			var reader = new FileReader();
			reader.onload = function(e){
				var img_html = "<img src=\"" + e.target.result + "\"/>";
				$('.adm-b-evimg-box').append(img_html);
			}
			reader.readAsDataURL(f);
		})
	}
	function handleBpFilesSelect(e){
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		filesArr.forEach(function(f){
			$('.adm-bp-evimg-box').empty();
			if(!f.type.match("image.*")){
				alert("확장자는 이미지 확장자만 가능")
				return;
			}
			sel_files.push(f);
			var reader = new FileReader();
			reader.onload = function(e){
				var img_html = "<img src=\"" + e.target.result + "\"/>";
				$('.adm-bp-evimg-box').append(img_html);
			}
			reader.readAsDataURL(f);
		})
	}

	$(function(){
	    $('.ad-event-nav .ad-event-btn').click(function(e){
	        e.preventDefault();
	        $('.ad-event-nav .ad-event-btn').attr('aria-selected','false');
	        $(this).attr('aria-selected','true');
	        adeventView();
	    })
	})

	function adeventView(){
	    var target = $('.ad-event-l .ad-event-btn[aria-selected=true]').attr('data-target');
	    $('.ad-event>.ad-event-list').addClass('display-none');
	    $('.ad-event .'+target).removeClass('display-none');
	}
	adeventView();
</script>