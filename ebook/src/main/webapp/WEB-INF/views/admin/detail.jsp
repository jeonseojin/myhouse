<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<form action="<%=request.getContextPath()%>/admin/detail">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>제목</th>
						<th>${toon.title}</th>
						<th>영어제목</th>
						<th>${toon.t_title}</th>
						<th>작가</th>
						<th>${toon.artist}</th>
					</tr>
				</thead>
			</table>
			<div>
				<span class="ad-tail-epgo">연재등록하기</span>
				<a href="<%=request.getContextPath()%>/admin/ep?num=${toon.t_num}&Title=${toon.t_title}&tweek=${toon.t_week}"><button type="button" class="ad-tail-epgo-btn"> <i class="fas fa-long-arrow-alt-right"></i>이동</button></a>
			</div>
			<h4 class="ad-plot-h">줄거리</h4>
			<div name="plot" class="ad-plot">${toon.plot}</div>
						<table class="table table-hover">
				<thead>
					<tr>
						<th class="ad-tail-t">연재 요일 :</th>
						<th>${week.week}</th>
						<th class="ad-tail-t">장르 :</th>
						<th>${toon.t_type}</th>
					</tr>
				</thead>
			</table>
			<div class="ad-img-box display-flex">
				<c:if test="${toon.t_typify!=null}">
					<div class="ad-img-box">
						<h4 class="ad-img-h">대표(big) 이미지</h4>
						<img height="250" src="/ebook/resources/img${toon.t_typify}">
					</div>
				</c:if>
				<c:if test="${toon.t_typify==null}">
					<div class="ad-img-box">
						<h4 class="ad-img-h">대표(big) 이미지가 없습니다.</h4>
					</div>
				</c:if>
				<c:if test="${toon.t_img!=null}">
					<div class="ad-img-box">
						<h4 class="ad-img-hs">대표(small) 이미지</h4>
						<img alt="" src="/ebook/resources/img${toon.t_img}">
					</div>
				</c:if>
			</div>
			<a href="<%=request.getContextPath() %>/admin/toon?page=${cri.page}&type=${cri.type}&search=${cri.search}" class="float-left"><button type="button" class="btn btn-outline-secondary">목록</button></a>
			<div class="float-right">
				<a href="<%=request.getContextPath()%>/admin/modify?num=${toon.t_num}&Title=${toon.t_title}&tweek=${toon.t_week}"><button type="button" class="btn btn-primary">수정</button></a>
				<a href="<%=request.getContextPath()%>/admin/delete?Title=${toon.t_title}"><button type="button" class="btn btn-danger">삭제</button></a>
			</div>
			<input type="hidden" id="num" value="${toon.t_num}">
		</form>