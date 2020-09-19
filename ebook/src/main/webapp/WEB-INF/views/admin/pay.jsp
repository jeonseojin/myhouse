<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<ul class="nav nav-tabs ad-pay-nav">
    <li class="nav-item ad-pay-l">
          <a class="nav-link ad-pay-btn active" data-toggle="tab" aria-selected="true" ara data-target="ad-pay-all">전체충전회원조회</a>
    </li>
</ul>
<div class="ad-pay">
	<div class="ad-pay-list ad-pay-all">
		<table class="table">
			<thead>
				<tr class="textline-center">
					<th>번호</th>
					<th class="adt-plot">회원</th>
					<th class="adt-plot">날짜</th>
					<th class="adt-plot">결제금액</th>
					<th class="adt-plot">결제코인</th>
					<th class="adt-plot">보너스 포인트</th>
					<th class="adt-plot">코인 사용내역</th>
					<th class="adt-plot">코인 사용날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${paylist.size()!=0}">
					<c:forEach var="paylist" items="${paylist}">
						<tr>
							<td>${paylist.p_num}</td>
							<td>${paylist.p_member}</td>
							<td>${paylist.p_price}</td>
							<td>${paylist.p_coin}</td>
							<td>${paylist.p_point}</td>
							<td>${paylist.p_epititle}/${paylist.p_epnum}</td>
							<td>${paylist.p_usedate}</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<c:if test="${paylist.size()==0}">
			<h2 style="text-align: center;">검색하신 결과가 없습니다.</h2>
		</c:if>
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
</div>
<script>
$(function(){
    $('.ad-pay-nav .ad-pay-btn').click(function(e){
        e.preventDefault();
        $('.ad-pay-nav .ad-pay-btn').attr('aria-selected','false');
        $(this).attr('aria-selected','true');
        adeventView();
    })
})

function adeventView(){
    var target = $('.ad-pay-l .ad-pay-btn[aria-selected=true]').attr('data-target');
    $('.ad-pay>.ad-pay-list').addClass('display-none');
    $('.ad-pay .'+target).removeClass('display-none');
}
adeventView();
</script>