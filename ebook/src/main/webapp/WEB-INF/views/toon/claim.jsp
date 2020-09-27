<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<c:if test="${member.auth=='ADMIN'}">
	<a href="<%=request.getContextPath()%>/admin/notice">공지사항 등록</a>
</c:if>
<div class="help-box">
	<div class="help-box-left"> 
		<ul class="hbox-left-nav">
			<li class="help-choice" aria-selected="true" data-target="hbox-notice">공지사항</li>
			<li class="help-choice" data-target="hbox-help">도움말(1:1 문의)</li>
			<c:if test="${member.id!=null&&member.auth=='USER'}">
				<li class="help-choice" data-target="hbox-myhelp">나의 문의 내역</li>
			</c:if>
		</ul>
		<div class="hbox-left-footer">
		고객지원<br>
		AM 10 : 00 ~ PM 07 : 00<br>
		Lunch PM 12:30 ~ PM 01:30<br>
		* 법정 공휴일 제외
		</div>
	</div> 
 
	<div class="help-box-right">
		<div class="hbox-list hbox-notice display-none">
			<h2 class="hbox-right-heading">공지사항</h2>
			<div class="hbox-right-tap">
				<a class="hbox-right-tap-a" data-target="help-service" aria-selected="true">서비스 공지</a>
				<a class="hbox-right-tap-a" data-target="help-episode">연재 관련 공지</a>
				<a class="hbox-right-tap-a" data-target="help-terms">약관/방침 개정 공지</a>
			</div>
			<div class="help-box-text">
				<ul class="help-box-list help-service">
					<c:forEach var="claim" items="${cl}">
						<c:if test="${claim.cl_auth=='ADMIN' && claim.cl_type=='서비스 공지사항'}">
							<li>
								<div class="help-box-item">${claim.cl_title}</div> 
								<div class="hbox-item-content display-none">${claim.cl_content}</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
				<ul class="help-box-list help-episode display-none">
					<c:forEach var="claim" items="${cl}">
						<c:if test="${claim.cl_auth=='ADMIN' && claim.cl_type=='연재 관련 공지'}">
							<li>
								<div class="help-box-item">${claim.cl_title}</div> 
							<div class="hbox-item-content display-none">${claim.cl_content}</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
				<ul class="help-box-list help-terms display-none">
					<c:forEach var="claim" items="${cl}">
					<c:if test="${claim.cl_auth=='ADMIN' && claim.cl_type=='약관/방침 개정 공지'}">
							<li>
								<div class="help-box-item">${claim.cl_title}</div> 
								<div class="hbox-item-content display-none">${claim.cl_content}</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</div>
		
		<div class="hbox-list hbox-help display-none">
			<h2 class="hbox-right-heading">도움말(1:1문의)</h2>
			<div class="hbox-help-tap">
				<a class="hbox-help-tap-a" data-target="help-common" aria-selected="true">자주 묻는 질문</a>
				<a class="hbox-help-tap-a" data-target="help-auth">로그인 / 계정</a>
				<a class="hbox-help-tap-a" data-target="help-payment">결제 / 환불</a>
				<a class="hbox-help-tap-a" data-target="help-etc">기타문의 / 제안</a>
			</div>
			<div class="help-box-text">
				<ul class="helpbox-list help-common">
					<c:forEach var="claim" items="${cl}">
						<c:if test="${claim.cl_auth=='ADMIN' && claim.cl_type=='common'}">
							<li>
								<div class="help-box-item">${claim.cl_title}</div> 
								<div class="hbox-item-content display-none">${claim.cl_content}</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
				
				<div class="helpbox-list help-auth display-none">
					<ul>
						<c:forEach var="claim" items="${cl}">
							<c:if test="${claim.cl_auth=='ADMIN' && claim.cl_type=='auth'}">
								<li>
									<div class="help-box-item">${claim.cl_title}</div> 
									<div class="hbox-item-content display-none">${claim.cl_content}</div>
							</li>
								
							</c:if>
						</c:forEach>
					</ul>
				</div>
				<div class="helpbox-list help-payment display-none">
				<ul>
						<c:forEach var="claim" items="${cl}">
							<c:if test="${claim.cl_auth=='ADMIN' && claim.cl_type=='payment'}">
								<li>
									<div class="help-box-item">${claim.cl_title}</div> 
								<div class="hbox-item-content display-none">${claim.cl_content}</div>
								</li>
								
							</c:if>
						</c:forEach>
					</ul>
				</div>
				<div class="helpbox-list help-etc display-none">
					<ul>
						<c:forEach var="claim" items="${cl}">
							<c:if test="${claim.cl_auth=='ADMIN' && claim.cl_type=='etc'}">
								<li>
									<div class="help-box-item">${claim.cl_title}</div> 
									<div class="hbox-item-content display-none">${claim.cl_content}</div>
								</li>
								
							</c:if>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		
		<div class="hbox-list hbox-myhelp display-none">
			<h2 class="hbox-right-heading">나의 문의 내역 <button class="clmylist-btn">문의하기</button></h2>
			<div class="clmylist-box clmylist-notice">
				<div class="clmylist-header">
					<div class="clmylist-headerT">제목</div>
					<div class="clmylist-headerD">등록일</div>
					<div class="clmylist-headerS">상태</div>
				</div>
				<ul class="clmylist-list">
					<c:forEach var="cl" items="${cl}">
							<c:if test="${cl.cl_member==member.name}">
								<li class="clmylist-item">
									<div class="clmylist-link  help-box-item">
										<div class="clmylist-itemT">${cl.cl_title}</div>
										<div class="clmylist-itemD">${cl.cl_date}</div>
										<c:if test="${cl.cl_answer!=0}">
											<div class="clmylist-itemS noticeY">답변완료</div>
										</c:if>
										<c:if test="${cl.cl_answer==0}">
											<div class="clmylist-itemS">미답변</div>
										</c:if>
									</div>
									<div class="hbox-item-content display-none">
										<div class="hbox-mycontent">${cl.cl_content}</div>
											<c:forEach var="answer" items="${answer}">
											<c:if test="${answer.cl_answer==cl.cl_num}">
												<div class="answer-content">
													<div class="answer-itemT">${answer.cl_title}</div>
													<div>${answer.cl_content}</div>
													<div class="answer-itemD float-right">${answer.cl_date}</div>
												</div>
											</c:if>
											<c:if test="${answer.cl_answer!=cl.cl_num}">
												<div class="noanswer-content">등록된 답변이 없습니다.</div>
											</c:if>
										</c:forEach>
									</div>
								</li>
								
							</c:if>
					</c:forEach>
				</ul>
			</div>
			</div>
			
		<div class="hbox-list clmylist-regist display-none">
			<h2 class="hbox-right-heading">문의하기</h2>
			<form class="<%=request.getContextPath()%>/toon/help" method="post" enctype="multipart/form-data">
				<input type="hidden" name="cl_member" value="${member.name}">
				<input type="hidden" name="cl_auth" value="${member.auth}">
				<input type="hidden" name="cl_type">
				<div class="clmyregist-left">
					<span>문의 종류</span>
					<span>제목</span>
					<span>내용</span>
					<span>파일첨부</span>
				</div>
				<div class="clmyregist-right">
					<div class="clmyselect-box">
						<select class="clmytype" onchange="clType(this.value)">
							<option>문의 유형을 선택해 주세요.</option>
							<option value="event">연재/이벤트</option>
							<option value="auth">로그인/계정</option>
							<option value="payment">결제/환불</option>
							<option value="etc">기타문의 / 제안</option>
						</select>
					</div>
					<input type="text" name="cl_title" class="clmytitle">
					<textarea name="cl_content" class="clmycontent"></textarea>
					<input type="file" name="file2" class="clmyfile">
					<button class="btn btn-secondary float-right">등록</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script>
	$(function(){
		$('.hbox-right-tap> .hbox-right-tap-a').click(function(e){
	        e.preventDefault();
	        $('.hbox-right-tap>.hbox-right-tap-a').attr('aria-selected','false');
	        $(this).attr('aria-selected','true');
	        rightView();
	    })
	    $('.hbox-help-tap> .hbox-help-tap-a').click(function(e){
	        e.preventDefault();
	        $('.hbox-help-tap>.hbox-help-tap-a').attr('aria-selected','false');
	        $(this).attr('aria-selected','true');
	        helpView();
	    })
		$('.hbox-left-nav >.help-choice').click(function(e){
		    $('.hbox-left-nav >.help-choice').attr('aria-selected','false');
		    $(this).attr('aria-selected','true');
			helpboxView();
		})
		$('.help-box-item').click(function(e){
			$(this).next('.hbox-item-content').toggleClass('display-none');
		})
		$('.clmylist-btn').click(function(){
			$('.hbox-myhelp').addClass('display-none');
			$('.clmylist-regist').removeClass('display-none');
		})
	})
	
	function clType(input){
		var value=$('.clmytype').val();
		$('input[name=cl_type]').val(value);
	}
	function rightView(){
	    var target = $('.hbox-right-tap .hbox-right-tap-a[aria-selected=true]').attr('data-target');
	    $('.help-box-text>.help-box-list').addClass('display-none');
	    $('.help-box-list.'+target).removeClass('display-none');
	}
	rightView();
	function helpView(){
	    var target = $('.hbox-help-tap .hbox-help-tap-a[aria-selected=true]').attr('data-target');
	    $('.help-box-text>.helpbox-list').addClass('display-none');
	    $('.helpbox-list.'+target).removeClass('display-none');
	}
	helpView();
	
	function helpboxView(){
	    var target = $('.hbox-left-nav>.help-choice[aria-selected=true]').attr('data-target');
	    $('.hbox-list').addClass('display-none');
	    $('.hbox-list.'+target).removeClass('display-none');
	}
	helpboxView();
</script>