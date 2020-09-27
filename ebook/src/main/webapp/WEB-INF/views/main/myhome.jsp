<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:if test="${member.name==null||member.auth!='USER'}">
	<h1>접근할 수 없는 경로 입니다.</h1>
</c:if>
<c:if test="${member.name!=null&&member.auth=='USER'}">
	<h1 class="myhome-myinfo">내 정보</h1>
	<div class="myhome-info-box">
		<h4 class="myhome-h">계정 관리</h4>
		<form id="form-myinfo" action="<%=request.getContextPath()%>/myhome/info">
			<table class="table">
		 		<thead>
					<tr>
						<th class="myhome-info-text">아이디</th>
						<th class="myhome-info-text">별명</th>
						<th class="myhome-info-text">이메일</th>
						<th class="myhome-info-text">성별</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="myhome-info-text">${member.id}</td>
						<td class="myhome-info-text">${member.name}</td>
						<td class="myhome-info-text">${member.email}</td>
						<td class="myhome-info-text">${member.gender}</td>
					</tr>
				</tbody>
			</table>
		</form>
		<div class="myinfo-btn">
			<a href="<%=request.getContextPath()%>/toon/help"><button class="btn btn-link">문의하기</button></a>
			<div class="float-right">
				<button class="btn btn-info info-modify-btn" type="button">수정</button>
				<a><button class="btn btn-danger">탈퇴</button></a>
			</div>
		</div>
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
		$('.info-modify-btn').click(function(){
			var str =
				'<table class="table">'+
			 	'<thead>'+
				'<tr>'+
				'<th class="myhome-info-text">아이디</th>'+
				'<th class="myhome-info-text">별명</th>'+
				'<th class="myhome-info-text">이메일</th>'+
				'<th class="myhome-info-text">성별</th>'+
				'</tr>'+
				'</thead>'+
				'<tbody>'+
				'<tr>'+
				'<td class="myhome-info-text">${member.id}</td>'+
				'<td class="myhome-info-text"><input type="text" class="info-myhome" name="name" id="name" value="${member.name}"><label for="name" id="name-error" class="error"></label></td>'+
				'<td class="myhome-info-text"><input type="text" class="info-myhome" name="email" value="${member.email}"></td>'+
				'<td class="myhome-info-text">${member.gender}</td>'+
				'</tr>'+
				'</tbody>'+
				'</table>'+
				'<button class="btn btn-secondary btn-myinfo" type="submit">변경</button>';
				
			$('#form-myinfo').empty().append(str);				
		})
		$('.btn-myinfo').click(function(){
			var name = $('input[name=name]').val();
			var email = $('input[name=email]').val();
			$.ajax({
				async: true,
				type:'POST',
				url:"<%=request.getContextPath()%>/myhome/info",
				data:JSON.stringify({"name":name,"email":email}),
				dataType:"json",
				contentType:"application/json; charset=UTF-8",
				success:function(data){
					var str ="";
						if(data["res"]!=null){
							arlt(data["res"]);
						}else{
							str+=
								'<table class="table">'+
						 		'<thead>'+
								'<tr>'+
								'<th class="myhome-info-text">아이디</th>'+
								'<th class="myhome-info-text">별명</th>'+
								'<th class="myhome-info-text">이메일</th>'+
								'<th class="myhome-info-text">성별</th>'+
								'</tr>'+
								'</thead>'+
								'<tbody>'+
								'<tr>'+
								'<td class="myhome-info-text">'+data.member.id+'</td>'+
								'<td class="myhome-info-text">'+data.member.name+'</td>'+
								'<td class="myhome-info-text">'+data.member.email+'</td>'+
								'<td class="myhome-info-text">'+data.member.gender+'</td>'+
								'</tr>'+
								'</tbody>'+
								'</table>';
						}
						$('#form-myinfo').html(str);
				}
			});
		})
	})
</script>