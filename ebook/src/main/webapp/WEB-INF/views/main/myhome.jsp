<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:if test="${member.name==null||member.auth!='USER'}">
	<h1>접근할 수 없는 경로 입니다.</h1>
</c:if>
<c:if test="${member.name!=null&&member.auth=='USER'}">
	<h1 class="myhome-myinfo">내 정보</h1>
		<h4 class="myhome-h">계정 관리</h4>
			<div class="myhome-box">
				<div class="myhome-left">
					<div class="myhome-info-text"><span class="myhome-text">아이디</span><div class="myhome-info">${member.id}</div></div>
					<div class="myhome-info-text">
						<span class="myhome-text">비밀번호</span>
						<button class="btn btn-link myinfo-pw">비밀번호 수정</button>		
					</div>
					<div class="myhome-info-text"><span class="myhome-text">별명</span><div class="myhome-info">${member.name}</div></div>
					<div class="myhome-info-text"><span class="myhome-text">이메일</span><div class="myhome-info">${member.email}</div></div>
				</div>
				<div class="myhome-right display-none">
					<form action="<%=request.getContextPath()%>/myhome/info" method="post">
						<div class="mypass-word">
							<span>새 비밀번호</span>
							<div class="mypass-input"><input class="mypass-pw" name="pw" type="password"></div>
							<span>새 비밀번호 재입력</span>
							<div class="mypass-input"><input class="mypass-pw" name="pass2" type="password"></div>
							<div class="mypass-check">
								<div class="alert alert-success">비밀번호가 일치합니다.</div>
								<div class="alert alert-danger">비밀번호가 일치하지 않습니다.</div>
							</div>
							<div class="btn btn-secondary mypass-btn" disabled="disabled">비밀번호 변경</div>
						</div>
					</form>
				</div>
			</div>
		
		<div class="myhome-coin-box">
			<h4 class="myhome-h">코인 충전 내역</h4>
			<table class="table">
				<thead>
					<tr>
						<th class="myhome-coin-date">날짜</th>
						<th class="myhome-info-text">내역</th>
					</tr>
				</thead>
		 		<tbody>
		 			<c:forEach var="pay" items="${pay}">
						<c:if test="${pay.p_price!=0}">
							<tr>
								<td>
									<div class="myhome-coin-item">
										<span>${pay.p_date}</span>
									</div>
								</td>
								<td class="myhome-coin">
									<div class="myhome-coin-item">
										<span> <i class="fas fa-coins myhome-coin-i"></i>+${pay.p_charging}</span>
										<span><i class="fas fa-money-bill-alt myhome-coin-m"></i>${pay.p_price}</span>
									</div>
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="myhome-coin-box">
			<h4 class="myhome-h">포인트코인 내역</h4>
			<table class="table">
				<thead>
					<tr>
						<th class="myhome-coin-date">날짜</th>
						<th class="myhome-info-text">내역</th>
					</tr>
				</thead>
		 		<tbody>
		 			<c:forEach var="pay" items="${pay}">
						<c:if test="${pay.p_point!=0}">
							<tr>
								<td>
									<div class="myhome-coin-item">
										<span>${pay.p_date}</span>
									</div>
								</td>
								<td class="myhome-coin">
									<div class="myhome-coin-item">
										<c:if test="${pay.p_title=='출석이벤트 유효기간 만료'}">
											<span> <i class="fas fa-coins myhome-coin-i"></i>-${pay.p_point}</span>
										</c:if>
										<c:if test="${pay.p_title=='출석이벤트'}">
											<span> <i class="fas fa-coins myhome-coin-i"></i>+${pay.p_point}</span>
										</c:if>
										<span>${pay.p_title}</span>
									</div>
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</div>
</c:if>
<script type="text/javascript">
	$(function(){
		$('.myinfo-pw').click(function(){
			$('.myhome-right').removeClass('display-none');
		})
		$('.alert-success').hide();
		$('.alert-danger').hide();
		$('input').keyup(function(){
			var pass1 = $('input[name=pw]').val();
			var pass2 = $('input[name=pass2]').val();
			if(pass1!=""|| pass2!=""){
				if(pass1==pass2){
					$('.alert-success').show();
					$('.alert-danger').hide();
					$('.mypass-btn').removeAttr('disabled');
				}else{
					$('.alert-success').hide();
					$('.alert-danger').show();
					$('.mypass-btn').attr('disabled','disabled');
				}
			}
		})
		$('.mypass-btn').click(function(){
			var pw = $('input[name=pw]').val();
			$.ajax({
				async: true,
				type:'POST',
				url:"<%=request.getContextPath()%>/myhome/info",
				data:pw,
				dataType:"json",
				contentType:"application/json; charset=UTF-8",
				success:function(data){
					alert(data["res"]);
					$('input[name=pw]').val("");
					$('input[name=pass2]').val("");
					$('.myhome-right').addClass('display-none');
					$('.alert-success').hide();
				}
			});
		})
		
	})
	
</script>