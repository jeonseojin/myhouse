<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${member==null || member.auth!='ADMIN'}">
	<h1>접근할 수 없는 경로입니다.</h1>
</c:if>
<c:if test="${member!=null && member.auth=='ADMIN'}">
	<ul class="nav nav-tabs">
		<li class="nav-item ad-claim-l">
			<a class="nav-link active" data-toggle="tab" href="#" aria-selected="true" data-target="ad-claim-all">전체</a>
		</li>
		<li class="nav-item ad-claim-l">
			<a class="nav-link" data-toggle="tab" href="#" data-target="ad-claim-answer">미답변</a>
		</li>
		<li class="nav-item ad-claim-l">
			<a class="nav-link" data-toggle="tab" href="#" data-target="ad-claim-end">답변완료</a>
		</li>
		<li class="nav-item ad-claim-l">
			<a class="nav-link" data-toggle="tab" href="#" data-target="ad-claim-notice">공지사항</a>
		</li>
		<li class="ad-cl-not">
			<a  href="<%=request.getContextPath()%>/admin/notice">공지사항 등록</a>
		</li>
	</ul>
			
	<div class="ad-claim">
		<div class="ad-claim-list ad-claim-all">
			<table class="table table-hover">
			    <thead>
			      	<tr>
			      		<th>답변상태</th>
			      		<th>문의자</th>
			       		<th>제목</th>
			       		<th>등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${cl.size()!=0}">
						<c:forEach var="cl" items="${cl}">
							<c:if test="${cl.cl_auth!='ADMIN'}">
								<tr>
									<td>${cl.cl_num}</td>
									<td>${cl.cl_member}</td>
							       	<td><a href="<%=request.getContextPath()%>/admin/cldetail?num=${cl.cl_num}">${cl.cl_title}</a></td>
							       	<td>${cl.cl_date}</td>
								</tr>
							</c:if>				
						</c:forEach>
					</c:if>
				</tbody>
			</table>
			<c:if test="${cl.size()==0}">
				<h1 style="text-align:center;">정보가 없습니다.</h1>
			</c:if>
		</div>
		
		<div class="ad-claim-list ad-claim-answer">
			<table class="table table-hover">
			    <thead>
			      	<tr>
			      		<th>답변번호</th>
			      		<th>문의자</th>
			       		<th>제목</th>
			       		<th>등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${cl.size()!=0}">
						<c:forEach var="cl" items="${cl}">
							<c:if test="${cl.cl_auth!='ADMIN' && cl.cl_answer==0}">
								<tr>
									<td>${cl.cl_num}</td>
									<td>${cl.cl_member}</td>
						        	<td><a href="<%=request.getContextPath()%>/admin/cldetail?num=${cl.cl_num}">${cl.cl_title}</a></td>
						        	<td>${cl.cl_date}</td>
								</tr>
							</c:if>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
			<c:if test="${cl.size()==0}">
				<h1 style="text-align:center;">정보가 없습니다.</h1>
			</c:if>
		</div>
		
		<div class="ad-claim-list ad-claim-end">
			<table class="table table-hover">
				<thead>
				   	<tr>
				   		<th>답변번호</th>
				   		<th>관리자</th>
				   		<th>제목</th>
				   		<th>등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${cl.size()!=0}">
						<c:forEach var="cl" items="${cl}">
							<c:if test="${cl.cl_answer!=0}">
								<tr>
									<td>${cl.cl_num}</td>
									<td>${cl.cl_member}</td>
						        	<td><a href="<%=request.getContextPath()%>/admin/cldetail?num=${cl.cl_num}">${cl.cl_title}</a></td>
						        	<td>${cl.cl_date}</td>
								</tr>
							</c:if>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
			<c:if test="${cl.size()==0}">
				<h1 style="text-align:center;">정보가 없습니다.</h1>
			</c:if>
		</div>
		<div class="ad-claim-list ad-claim-notice">
			<table class="table table-hover">
				<thead>
				   	<tr>
				   		<th>관리자</th>
				   		<th>제목</th>
				   		<th>등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${cl.size()!=0}">
						<c:forEach var="cl" items="${cl}">
							<c:if test="${cl.cl_auth=='ADMIN'&&cl.cl_answer==0}">
								<tr>
									<td>${cl.cl_member}</td>
						        	<td><a href="<%=request.getContextPath()%>/admin/cldetail?num=${cl.cl_num}&page=${pm.cri.page}&type=${pm.cri.type}&search=${pm.cri.search}">${cl.cl_title}</a></td>
						        	<td>${cl.cl_date}</td>
								</tr>
							</c:if>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
			<c:if test="${cl.size()==0}">
				<h1 style="text-align:center;">정보가 없습니다.</h1>
			</c:if>
		</div>
	</div>
	<!-- 페이지네이션 -->
			<ul class="pagination justify-content-center" style="margin:20px 0">
				<li class="page-item <c:if test="${!pm.prev}">disabled</c:if>"><a class="page-link" href="<%=request.getContextPath()%>/admin/claim?page=${pm.startPage-1}&type=${pm.cri.type}&search=${pm.cri.search}"><i class="fas fa-chevron-left"></i></a></li>
				<c:forEach var="index" begin="${pm.startPage}" end="${pm.endPage}">
					<li class="page-item <c:if test="${index==pm.cri.page}">active</c:if>"><a class="page-link" href="<%=request.getContextPath()%>/admin/claim?page=${index}&type=${pm.cri.type}&search=${pm.cri.search}">${index}</a></li>
				</c:forEach>
				<li class="page-item <c:if test="${!pm.next}">disabled</c:if>"><a class="page-link" href="<%=request.getContextPath()%>/admin/claim?page=${pm.endPage+1}&type=${pm.cri.type}&search=${pm.cri.search}"><i class="fas fa-chevron-right"></i></a></li>
	</ul>
	<!-- 검색창 -->
		<form action="<%=request.getContextPath()%>/admin/claim">
			<div class="input-group mb-3">
				<select class="form-control " id="sell" name="type">
					<option value="0" <c:if test="${pm.cri.type==0}">selected</c:if>>전체</option>
					<option value="1" <c:if test="${pm.cri.type==1}">selected</c:if>>제목</option>
					<option value="2" <c:if test="${pm.cri.type==2}">selected</c:if>>등록자</option>
				</select>
				<input type="text" class="form-control adt-input" placeholder="작품 검색" name="search" value="${pm.cri.search}">
				<div class="input-group-append">
					<button class="btn btn-success " type="submit">검색</button>
				</div>
			</div>
		</form>
</c:if>

<script>
$(function(){
    $('.nav .nav-link').click(function(e){
        e.preventDefault();
        $('.nav .nav-link').attr('aria-selected','false');
        $(this).attr('aria-selected','true');
        adclaimView();
    })
})
function adclaimView(){
    var target = $('.nav-item .nav-link[aria-selected=true]').attr('data-target');
    $('.ad-claim>.ad-claim-list').addClass('display-none');
    $('.ad-claim .'+target).removeClass('display-none');
}
adclaimView();
</script>