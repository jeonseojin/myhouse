<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<c:if test="${member.auth=='ADMIN'}">
	<a href="<%=request.getContextPath()%>/admin/notice">공지사항 등록</a>
</c:if>
<div class="help-box">
	<div class="help-box-left"> 
		<ul class="hbox-left-nav">
			<li class="help-choice" data-target="hbox-notice">공지사항</li>
			<li class="help-choice" data-target="hbox-help">도움말(1:1 문의)</li>
			<c:if test="${member.id!=null||member.auth=='ADMIN'}">
				<li class="help-choice" data-target="hbox-myhelp">나의 문의 내역</li>
			</c:if>
		</ul>
		<div class="hbox-left-footer">
		고객지원<br>
		AM 10 : 00 ~ PM 07 : 00<br>
		Lunch PM 12:30 ~ PM 01:30<br>
		* 법정 공휴일 제외
		</div>
		<div></div>
	</div> 
 
	<div class="help-box-right">
		<div class="hbox-list hbox-notice">
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
			<div class="hbox-right-tap">
				<a class="hbox-right-tap-a" data-target="help-common" aria-selected="true">자주 묻는 질문</a>
				<a class="hbox-right-tap-a" data-target="help-auth">로그인 / 계정</a>
				<a class="hbox-right-tap-a" data-target="help-payment">결제 / 환불</a>
				<a class="hbox-right-tap-a" data-target="help-etc">기타문의 / 제안</a>
			</div>
			<div class="help-box-text">
				<ul class="help-box-list help-common">
					<c:forEach var="claim" items="${cl}">
						<c:if test="${claim.cl_auth=='ADMIN' && claim.cl_type=='common'}">
							<li>
								<div class="help-box-item">${claim.cl_title}</div> 
								<div class="hbox-item-content display-none">${claim.cl_content}</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
				
				<div class="help-box-list help-auth display-none">
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
				<div class="help-box-list help-payment display-none">
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
				<div class="help-box-list help-etc display-none">
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
	</div>
</div>
<script>
	$(function(){
		$('.hbox-right-tap> .hbox-right-tap-a').click(function(e){
	        e.preventDefault();
	        $('.hbox-right-tap>.hbox-right-tap-a').attr('aria-selected','false');
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
	})
	
	function helpView(){
	    var target = $('.hbox-right-tap .hbox-right-tap-a[aria-selected=true]').attr('data-target');
	    $('.help-box-text>.help-box-list').addClass('display-none');
	    $('.help-box-list.'+target).removeClass('display-none');
	}
	adhelpView();
	
	
	function helpboxView(){
	    var target = $('.hbox-left-nav>.help-choice[aria-selected=true]').attr('data-target');
	    $('.help-box-right>.hbox-list').addClass('display-none');
	    $('.hbox-list.'+target).removeClass('display-none');
	}
	helpboxView();
</script>