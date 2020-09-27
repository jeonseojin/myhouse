<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${member.name==null||member.auth=='USER'}">
	<h1>접근할 수 없는 경로 입니다.</h1>
</c:if>
<c:if test="${member.name!=null&&member.auth=='ADMIN'}">
		<form action="<%=request.getContextPath()%>/admin/modify" enctype="multipart/form-data" method="post" >
			<table class="table table-hover">
				<thead>
					<tr>
						<th>제목</th>
						<th><input type="text" class="toon-text-box toon-text-title" name="title" value="${toon.title}"></th>
						<th>영어제목</th>
						<th><input type="text" class="toon-text-box" name="t_title" value="${toon.t_title}"></th>
						<th>작가</th>
						<th><input type="text" class="toon-text-box" name="artist" value="${toon.artist}"></th>
						<th>등록관리자</th>
						<th>${member.name}(${member.id})</th>
					</tr>
				</thead>
			</table>
			<h4 class="ad-plot-h">줄거리</h4>
			<textarea name="plot" class="ad-plot">${toon.plot}</textarea>
			<table class="table table-hover">
				<thead>
					<tr>
						<th class="ad-tail-t">연재 요일</th>
						<th><input type="text" class="toon-text-box" name="week" value="${week.week}"></th>
						<th>변경 요일</th>
						<th>
							<select class="t_week-box" onchange="Selinput(this.value)">
								<option value="1" <c:if test="${toon.t_week==1}">selected</c:if>>월요일</option>
								<option value="2" <c:if test="${toon.t_week==2}">selected</c:if>>화요일</option>
								<option value="3" <c:if test="${toon.t_week==3}">selected</c:if>>수요일</option>
								<option value="4" <c:if test="${toon.t_week==4}">selected</c:if>>목요일</option>
								<option value="5" <c:if test="${toon.t_week==5}">selected</c:if>>금요일</option>
								<option value="6" <c:if test="${toon.t_week==6}">selected</c:if>>토요일</option>
								<option value="7" <c:if test="${toon.t_week==7}">selected</c:if>>일요일</option>
								<option value="8" <c:if test="${toon.t_week==8}">selected</c:if>>열흘</option>
							</select>
						</th>
					</tr>
				</thead>
			</table>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>장르</th>
						<th><input type="text" class="toon-text-box ad-genre" readonly="readonly" value="${toon.t_type}"></th>
						<th><div class="ad-mocheck-box"><input type="checkbox" name="t_type" value="로맨스" class="checkbox">로맨스</div></th>
						<th><div class="ad-mocheck-box"><input type="checkbox" name="t_type" value="드라마" class="checkbox">드라마</div></th>
						<th><div class="ad-mocheck-box"><input type="checkbox" name="t_type" value="판타지" class="checkbox">판타지</div></th>
						<th><div class="ad-mocheck-box"><input type="checkbox" name="t_type" value="개그" class="checkbox">개그</div></th>
						<th><div class="ad-mocheck-box"><input type="checkbox" name="t_type" value="액션" class="checkbox">액션</div></th>
						<th><div class="ad-mocheck-box"><input type="checkbox" name="t_type" value="학원" class="checkbox">학원</div></th>
						<th><div class="ad-mocheck-box"><input type="checkbox" name="t_type" value="미스터리" class="checkbox">미스터리</div></th>
						<th><div class="ad-mocheck-box"><input type="checkbox" name="t_type" value="일상" class="checkbox">일상</div></th>
					</tr>
				</thead>
			</table>
			<div class="ad-img-box display-flex">
				<div class="ad-img-box">
					<h4 class="ad-img-h">대표(big) 이미지</h4>
					<c:if test="${toon.t_typify!=null}">
						<div class="ad-big-del">
							<img src="/ebook/resources/img${toon.t_typify}" height="250">
							<span class="fine-name">${toon.oriFilebig}</span>
							<span class="btn-big-del"><i class="fas fa-times"></i></span>
							<input type="hidden" name="t_typify" value="${toon.t_typify}">
						</div>
					</c:if>
					<input type="file" class="ad-fi-fi" name="file1">
				</div>
				<div class="ad-img-box">
					<h4 class="ad-img-hs">대표(small) 이미지</h4>
					<c:if test="${toon.t_img!=null}">
						<div class="ad-small-del">
							<img src="/ebook/resources/img${toon.t_img}">
							<span class="file-name">${toon.oriFilesmall}</span>
							<span class="btn-small-del"><i class="fas fa-times"></i></span>
							<input type="hidden" name="t_img" value="${toon.t_img}">
						</div>
					</c:if>
					<input type="file" class="ad-fi-fi" name="file2">
				</div>
			</div>
			<input type="hidden" name="t_week" value="${toon.t_week}" readonly>
			<input type="hidden" name="t_num" value="${toon.t_num}" readonly>
			<input type="hidden" name="num" value="${toon.t_num}" readonly>
			<input type="hidden" name="up" value="${toon.up}" readonly>
			<input type="hidden" name="t_date" value="${toon.t_date}" readonly>
			<input type="hidden" name="lastEpisode" value="${toon.lastEpisode}" readonly>
			<input type="hidden" name="choice" value="${toon.choice}" readonly>
			<input type="hidden" name="t_views" value="${toon.t_views}" readonly>
			<a href="<%=request.getContextPath() %>/admin/toon?page=${cri.page}&type=${cri.type}&search=${cri.search}" class="float-left"><button type="button" class="btn btn-outline-secondary">목록</button></a>	
			<div class="float-right"><button class="btn btn-primary">수정완료</button></div>
		</form>
</c:if>		
		
<script>
	function Selinput(input){
		var value = $(".t_week-box").val(); 
		$('input[name=t_week]').val(value); 
	}
	$(function(){		
		var genre=$('.ad-genre').val();
		genre = genre.split(',');
		$('input[name=t_type]').each(function(){
			if(genre.indexOf($(this).val())!= -1)
				$(this).attr('checked','true');
			console.log($(this).val())
		})
		$('.btn-big-del').click(function(){
			$('.ad-big-del').empty();
		})
		$('input[name=file1]').change(function(){
			if($('input[name=t_typify]').val()==null|| typeof($('input[name=t_typify]').val()=='undefined')) return;
			$(this).val('');
			alert('기존 첨부파일을 삭제하세요.')
		})
		
		$('.btn-small-del').click(function(){
			$('.ad-small-del').empty();
		})
		$('input[name=file2]').change(function(){
			if($('input[name=t_img]').val()==null || typeof($('input[name=t_img]').val()=='undefined')) 
				 return;
			$(this).val('');
			alert('기존 첨부파일을 삭제하세요.')
		})
	})
</script>