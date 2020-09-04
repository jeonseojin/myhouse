<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 상단 header -->
    <header id="main-header" class="com com-menu">
        <a class="gnb-logo" href="<%=request.getContextPath()%>/"></a>
        <!-- 공통메뉴 -->
        <nav id="gnb" class="gnb">
            <ul class="gnb-list">
                <li class="gnb-item">
                    <a class="gnb-link" href="<%=request.getContextPath()%>/toon">연재</a>
                </li>
                <li class="gnb-item">
                    <a class="gnb-link" href="<%=request.getContextPath()%>/toon/kanking">랭킹</a>
                </li>
                <li class="gnb-item">
                    <a class="gnb-link" href="<%=request.getContextPath()%>/toon/free">무료</a>
                </li>
                <li class="gnb-item">
                    <a class="gnb-link" href="<%=request.getContextPath()%>/toon/event">이벤트</a>
                </li>
                <li class="gnb-item">
                    <a class="gnb-link" href="<%=request.getContextPath()%>/toon/theend">완결</a>
                </li>
            </ul>
        </nav>
        <!-- 검색창 -->
        <button class="search-btn"></button>
        <div class="search display-none">
            <fieldset class="search-field">
            	<form action="<%=request.getContextPath()%>/" target="">
	                <input type="text" class="search-input" placeholder="작품/작가명을 검색해주세요."  name="search" value="${pm.cri.search}" autocomplete="off">
					<button class="search-filed-btn" type="submit"></button>
	        	</form>
				<div class="search-list" style="display: none;">
	            	<c:if test="${tlist.size() != 0}">
		              	<c:forEach var="toon" items="${tlist}">
				           	<a href="#" class="search-item ">
				            	<div class="search-thumb"><img class="search-img" src="/ebook/resources/img${toon.t_img}" alt=""></div>
				            	<p class="search-title">${toon.title}</p>
				            	<p class="search-artist">${toon.artist}</p>
				          	</a>
			           	</c:forEach>
		           	</c:if>
		           	<c:if test="${tlist.size()==0}"><h6>작가/작품이 없습니다.</h6></c:if>
				</div>
            </fieldset>
        </div>

        <!-- 로그인 전 -->
        <c:if test="${member==null}">
	        <form method="post" action="<%=request.getContextPath()%>/common/signin" class="login-form">
	        	<div class="account">
			        <button type="button" class="logNav-btn">
			            <b class="logNav-text">로그인</b>
			            <i class="logNav_notiNum"></i>
			        </button>
			        <nav class="logNav display-none">
			            <div class="logNav-before">
			                <h2 class="login-heading">로그인</h2>
							<input type="text" class="login-input" name="id" placeholder="아이디">
							<input type="password" class="login-input" name="pw" placeholder="비밀번호">
							<br>
							<button type="submit" class="login-btn">Login</button>	
							<br>	
							<div class="s-bb"><a href="<%=request.getContextPath()%>/signup" class="s-btn">회원가입</a></div>
                    		<p class="c-help">이용 중 도움이 필요하시면 [<a href="#">고객지원</a>] 페이지로 문의해주세요</p>
							<input type="hidden" value="${isLogin}" id="isLogin">
							<input type="hidden" value="${id}" id="id">
							
			            </div>
			        </nav>
		        </div>
	        </form>
        </c:if>
        
        <!-- 로그인 후 -->
        <c:if test="${member!=null}">
        	<div class="account">
			        <button type="button" class="logNav-btn">
			            <b class="logNav-text">${member.name}</b>
			            <i class="logNav_notiNum"></i>
			        </button>
			        <!-- 사용자 -->
			        <c:if test="${member.auth=='USER'}">
						<nav class="logNav display-none" >
				            <div class="rating">
				                <a href="#" class="rating-link" aria-selected="true" data-target="my">MY</a>
				                <a href="#" class="rating-link" data-target="look">최근/찜/소장</a>
				                <a href="#" class="rating-link" data-target="signal">알림</a>
				            </div>
				            <div class="logNav-list">
				                <div class="log-list my">
				                    <div class="logUser">
				                        <h3 class="log-user">
				                            <span>${member.name}</span><span class="log-user-id">(${member.id})</span>
				                        </h3>
				                        <div class="log-coinList">
				                            <span class="">${member.coin}</span>코인
				                            <a href="#" class="log-coin">코인 충전</a>
				                        </div>
				                    </div>  
				                    <a class="logNav-link" href="#">내서재</a>
				                    <a class="logNav-link" href="#">내정보</a>
				                    <a class="logNav-link" href="#">고객지원</a>
				                    <a class="logNav-link logNav-link-last" href="<%=request.getContextPath()%>/signout">로그아웃</a>
				                </div>
				                <div class="log-list look">
				                	<div class="look-box">
				                		<span class="log-look-span">최근</span>
				                    <div class="log-look-box">
				                        <div class="log-look-item">
				                        	
				                        	<c:if test="${tlist.size()!=0}">
				                        	<c:forEach var="toon" items="${tlist}">
					                            <a class="log-look" href="#">
					                                <img class="search-img" src="/ebook/resources/img${toon.t_img}" style="height: 53px;" alt="">
					                            </a>
					                        </c:forEach>
				                            </c:if> 
				                            <a href="#" class="log-look-the">더보기</a> 
				                        </div>
				                    </div>
				                    <span class="log-look-span">찜</span>
				                    <div class="log-look-box">
				                        <div class="log-look-item">
				                            <c:forEach var="toon" items="${tlist}">
					                            <a class="log-look" href="#">
					                                <img class="search-img" src="/ebook/resources/img${toon.t_img}" style="height: 53px;" alt="">
					                            </a>
					                        </c:forEach>
				                            <a href="#" class="log-look-the">더보기</a> 
				                        </div>
				                    </div>
				                    <span class="log-look-span">소장</span>
				                    <div class="log-look-box">
				                        <div class="log-look-item">
				                            <c:forEach var="toon" items="${tlist}">
					                            <a class="log-look" href="#">
					                                <img class="search-img" src="/ebook/resources/img${toon.t_img}" style="height: 53px;" alt="">
					                            </a>
					                        </c:forEach>
				                            <a href="#" class="log-look-the">더보기</a> 
				                        </div>
				                    </div>
			                    </div>
			                </div>
			                <div class="log-list signal">
			                    <a class="logNav-link" href="#"></a>
			                </div>
			            </div>
			            <div class="logNav-last">
			                
			            </div>
			        </nav>
		    		</c:if>
		    		<!-- 관리자 -->
		    		 <c:if test="${member.auth=='ADMIN'}">
		    		 	<nav class="logNav display-none">
		    		 		<div class="logUser">
		    		 			<span class="log-spanadmin">관리자</span>
				            	<h3 class="log-admin">
				                	<span>${member.name}</span><span class="log-user-id">(${member.id})</span>
				                </h3>
				            </div>
		    		 		<a class="logNav-link" href="<%=request.getContextPath()%>/admin/user">회원관리</a>
		    		 		<a class="logNav-link" href="<%=request.getContextPath()%>/admin/toon">작품관리</a>
		    		 		<a class="logNav-link" href="<%=request.getContextPath()%>/admin/event">이벤트관리</a>
		    		 		<a class="logNav-link" href="<%=request.getContextPath()%>/admin/claim">문의관리</a>
		    		 		<a class="logNav-link" href="<%=request.getContextPath()%>/admin/pay">충전관리</a>
		    		 		<a class="logNav-link logNav-link-last" href="<%=request.getContextPath()%>/signout">로그아웃</a>
		    		 	</nav>
		    		 </c:if>
		    </div>
        </c:if>

   </header>

<script>
	$(function(){
        $('.search-filed-btn').click(function(){
        	$('.search-list').attr('style','display: block;');
        })
        $('.search-input').keyup(function(){
        	$('.search-list').attr('style','display: block;');
        })
	})
		
</script>