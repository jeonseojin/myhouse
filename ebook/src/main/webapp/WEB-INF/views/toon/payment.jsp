<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
response.setHeader("Pragma", "no-cache"); 
response.setHeader("Cache-Control", "no-cache"); 
response.setHeader("Cache-Control", "no-store"); 
response.setDateHeader("Expires", 0L); 
%>
<div class="toon-pay-box">
	<div class="toon-pay-tbox">
		<span class="toon-pay-t">코인 충전</span>
		<a class="toon-pay-free-t">무료 코인전환 <i class="fas fa-angle-right"></i></a>
	</div>
	<div class="toon-pay-coinbox">
		<span class="toon-coin-icon"><i class="far fa-copyright"></i>코인</span>
		<span class="coin-icon-p">P</span>
		<span class="coin-icon-pt">포인트</span>
		<a class="toon-coin-icon coin-icon-help"><i class="far fa-question-circle"></i></a>
	</div>
	<div class="toon-pay-banner">
		<a class="toon-pay-blink"><img src="/ebook/resources/img${ev.ev_banner}"></a>
	</div>
	<div class="toon-pay">
		<button type="button" class="toon-pay-btn">
			<div class="float-left toon-paybtn">
				<i class="far fa-copyright toon-paycoin-icon"></i>
				<span class="toon-paycoin" name="p_coin">25</span>
			</div>
			<span class="float-right" name="p_price">5,000원</span>
			<input type="hidden" value="25" class="p_coin">
			<input type="hidden" value="5000" class="p_price">
		</button>
		<button type="button" class="toon-pay-btn">
			<div class="float-left toon-paybtn">
				<i class="far fa-copyright toon-paycoin-icon"></i>
				<span class="toon-paycoin" name="p_coin">60</span>
			</div>
			<span class="float-right" name="p_price">10,000원</span>
			<input type="hidden" value="60" class="p_coin">
			<input type="hidden" value="10000" class="p_price">
		</button>
		<button type="button" class="toon-pay-btn">
			<div class="float-left toon-paybtn">
				<i class="far fa-copyright toon-paycoin-icon"></i>
				<span class="toon-paycoin" name="p_coin">140</span>
			</div>
			<span class="float-right" name="p_price">20,000원</span>
			<input type="hidden" value="140" class="p_coin">
			<input type="hidden" value="20000" class="p_price">
		</button>
		<button type="button" class="toon-pay-btn">
			<div class="float-left toon-paybtn">
				<i class="far fa-copyright toon-paycoin-icon"></i>
				<span class="toon-paycoin" name="p_coin">350</span>
			</div>
			<span class="float-right" name="p_price">50,000원</span>
			<input type="hidden" value="350" class="p_coin">
			<input type="hidden" value="50000" class="p_price">
		</button>
		<button type="button" class="toon-pay-btn">
			<div class="float-left toon-paybtn">
				<i class="far fa-copyright toon-paycoin-icon"></i>
				<span class="toon-paycoin">650</span>
			</div>
			<span class="float-right">90,000원</span>
			<input type="hidden" value="650" class="p_coin">
			<input type="hidden" value="90000" class="p_price">
		</button>
	</div>
</div>
<%@ include file="../toon/pay.jsp" %>
<script>
	$(function(){
		$('.toon-pay-btn').click(function(e){
			e.stopPropagation();
			var coin = $(this).children('.p_coin').val(); 
			var price = $(this).children('.p_price').val(); 
			$('input[name=p_charging]').val(coin);
			$('input[name=p_price]').val(price);
		    $('.payment-item').removeClass('display-none');
		    $('.payment-box').removeClass('display-none');
		    var clonePay =$(this).clone();
			$('.payment-li').after(clonePay);
		})
	})
</script>