<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form action="<%=request.getContextPath()%>/toon/payment" method="post" class="form-paymenet">
<div class="payment-box display-none">
	<div class="payment-item ">
		<h2 class="payment-li">결제</h2>
		<div class="payment-tool">
		<h5>결제 수단 선택</h5>
		<button type="button" class="payment-tool-choice">
			<select class="choice-payment">
		        <option value="choice-card">신용카드</option>
		        <option value="choicepay-phone">휴대폰 결제</option>
		        <option value="choicepay-cacao">카카오 페이</option>
		        <option value="choicepay-naver">네이버 페이</option>
		        <option value="choicepay-culture">문화상품권</option>
		        <option value="choicepay-happy">해피머니</option>
		        <option value="choicepay-bookculture">도서문화상품권</option>
		        <option value="choicepay-deposit">무통장입금</option>
		    </select>
			<span class="pay-choice-icon">변경<i class="fas fa-angle-down"></i></span>
			<span class="pay-choice-icon choice-icon-close display-none">닫기<i class="fas fa-angle-up"></i></span>
		</button>
		
		<div class="paymentchoice-box">
		
			<div class="paymentchoice-help choice-card">
			    <span>신용카드 이용안내</span>
				<div class="help-paymentchoice">
					• 신용카드 결제 시 환경 및 카드사에 따라 ISP 또는 앱 카드 설치가 필요할 수 있습니다.<br>
					• NH채움카드는 비밀번호+CVC가 아닌 SMS+공인인증 절차만 가능합니다. 또한, 일별 4회 결제 / 1회 결제 시 5만원의 한도가 있습니다.(앱 카드 및 원클릭 결제 불가)<br>
					• 현대카드는 M포인트 사용이 가능하며, 청구 할인 방식으로 결제 됩니다. (결제 금액의 10%, 최대 1만 포인트 사용 가능)<br>
					• 법정대리인의 동의 없는 미성년자의 결제는 취소될 수 있습니다.<br>
					• 7일이내 사용하지 않은 코인에 대한 청약철회가 가능하며, 관련 조건 및 환불약관을 확인해주세요.<br>
					• 결제내역은 내 정보에서 확인 가능합니다.<br>
				</div>
			</div>
		
			<div class="paymentchoice-help choicepay-phone display-none">
			    <span>휴대폰결제 이용안내</span>
				<div class="help-paymentchoice">
					• 신용카드 결제 시 환경 및 카드사에 따라 ISP 또는 앱 카드 설치가 필요할 수 있습니다.
					<br>• 법정대리인의 동의 없는 미성년자의 결제는 취소될 수 있습니다.
					<br>• 7일이내 사용하지 않은 코인에 대한 청약철회가 가능하며, 관련 조건 및 환불약관을 확인해주세요.
					<br>• 결제내역은 내 정보에서 확인 가능합니다.
					<br>
				</div>
			</div>
			
			<div class="paymentchoice-help choicepay-cacao display-none">
			    <span>카카오페이 이용안내</span>
				<div class="help-paymentchoice">
					• 카카오페이는 카카오톡 설치 시 이용 가능하고, 휴대폰과 카드/계좌 명의자가 동일해야 합니다.
					<br>• 카카오머니로 결제 시 카카오톡에 연동된 휴대폰 번호로 현금 영수증이 발급됩니다.
					<br>• 농협 카드는 카드사 사정에 따라 사용 불가합니다.
					<br>• 관련 문의는 카카오페이 고객 센터(1644-7405)로 연락 부탁드립니다.
					<br>• 법정대리인의 동의 없는 미성년자의 결제는 취소될 수 있습니다.
					<br>• 7일이내 사용하지 않은 코인에 대한 청약철회가 가능하며, 관련 조건 및 환불약관을 확인해주세요.
					<br>• 결제내역은 내 정보에서 확인 가능합니다.
				</div>
			</div>
			
			<div class="paymentchoice-help display-none choicepay-naver">
			    <span>네이버페이 이용안내</span>
				<div class="help-paymentchoice">
					• 네이버페이는 네이버 로그인 절차가 진행될 수 있습니다.
					<br>• 신용카드, 계좌이체, 네이버페이포인트로 결제 가능합니다. 단, 포인트는 결제만 가능하며 적립은 불가능합니다.
					<br>• 계좌이체로 결제한 경우 현금영수증 발급 가능하며, 현금영수증은 구매 확정 절차에서 발급 가능합니다.
					<br>• 카카오뱅크카드로 결제한 경우 결제내역에 국민카드로 표시될 수 있습니다.
					<br>• 관련 문의는 네이버페이 고객센터(1588-3819) 로 연락 부탁드립니다.
					<br>• 법정대리인의 동의 없는 미성년자의 결제는 취소될 수 있습니다.
					<br>• 7일이내 사용하지 않은 코인에 대한 청약철회가 가능하며, 관련 조건 및 환불약관을 확인해주세요.
					<br>• 결제내역은 내 정보에서 확인 가능합니다.
				</div>
			</div>
			
			<div class="paymentchoice-help display-none choicepay-culture">
			    <span>문화상품권 이용안내</span>
				<div class="help-paymentchoice">
					<br>• 문화 상품권은 (주)한국문화진흥원에서 발행하는 상품권입니다.
					<br>• 컬쳐랜드에 회원 가입 후 사용 가능합니다.
					<br>• 컬쳐랜드 아이디에 충전한 컬쳐캐쉬로 결제할 수 있습니다.
					<br>• 관련 문의는 컬쳐랜드 고객센터(1577-2111) 로 연락 부탁드립니다.
					<br>• 법정대리인의 동의 없는 미성년자의 결제는 취소될 수 있습니다.
					<br>• 7일이내 사용하지 않은 코인에 대한 청약철회가 가능하며, 관련 조건 및 환불약관을 확인해주세요.
					<br>• 결제내역은 내 정보에서 확인 가능합니다.
				</div>
			</div>
			
			<div class="paymentchoice-help display-none choicepay-happy">
			    <span>해피머니 이용안내</span>
				<div class="help-paymentchoice">
					<br>• 해피머니는 해피머니 서비스 회원 가입 후 사용 가능합니다.
					<br>• 관련 문의는 해피머니 아이엔씨 고객 센터(1588-5245)로 연락 부탁드립니다.
					<br>• 법정대리인의 동의 없는 미성년자의 결제는 취소될 수 있습니다.
					<br>• 7일이내 사용하지 않은 코인에 대한 청약철회가 가능하며, 관련 조건 및 환불약관을 확인해주세요.
					<br>• 신용카드 결제 시 환경 및 카드사에 따라 ISP 또는 앱 카드 설치가 필요할 수 있습니다.
					<br>• 결제내역은 내 정보에서 확인 가능합니다.
				</div>
			</div>
			
			<div class="paymentchoice-help display-none choicepay-bookculture">
			    <span>도서문화 상품권 이용안내</span>
				<div class="help-paymentchoice">
					• 도서문화상품권은 북앤라이프에 회원 가입 후 사용 가능합니다.
					<br>• 관련 문의는 북앤라이프 고객 센터(1544-5111) 로 연락 부탁드립니다.
					<br>• 법정대리인의 동의 없는 미성년자의 결제는 취소될 수 있습니다.
					<br>• 7일이내 사용하지 않은 코인에 대한 청약철회가 가능하며, 관련 조건 및 환불약관을 확인해주세요.
					<br>• 결제내역은 내 정보에서 확인 가능합니다.
				</div>
			</div>
			
			<div class="paymentchoice-help display-none choicepay-deposit">
			    <span>무통장입금 이용안내</span>
				<div class="help-paymentchoice">
					• 무통장 입금은 가상 계좌 발급 후, 입금까지 완료하셔야 결제가 완료됩니다.
					<br>• 가상 계좌는 발급일로부터 3일까지 유효합니다.
					<br>• 해외에서는 가상계좌로 입금이 불가능합니다.
					<br>• 입금 후 결제 처리 및 코인 충전까지 수분 정도 시간이 소요될 수 있습니다.
					<br>• 입금 날짜와 상관없이 신청하신 때의 코인 상품 기준으로 결제가 처리됩니다.
					<br>• 법정대리인의 동의 없는 미성년자의 결제는 취소될 수 있습니다.
					<br>• 7일이내 사용하지 않은 코인에 대한 청약철회가 가능하며, 관련 조건 및 환불약관을 확인해주세요.
					<br>• 결제내역은 내 정보에서 확인 가능합니다.
				</div>
			</div>
			
		</div>
		<ul class="payment-check-box">
			<li class="payment-check-list">
				<input type="checkbox" class="payment-check" id="check-essential">
				<label for="check-essential" class="payment-check-text">(필수) 위 사항을 확인하였으며 구매진행에 동의합니다.</label>
			</li>
			<li class="payment-check-list">
				<input type="checkbox" class="payment-check" id="check-option">
				<label for="check-option" class="payment-check-text">(선택) 이 결제수단으로 추후 결제 이용에 동의합니다.</label> 
			</li>
		</ul>
		<div class="payment-submit-btn-box on">
			<button type="submit" class="payment-submit-btn">충전</button>
		</div>
		</div>
		<input type="hidden" name="p_title" value="충전">
		<input type="hidden" name="p_charging">
		<input type="hidden" name="p_one" value="N">
		<input type="hidden" name="p_price">
	</div>
</div>

</form>
<script>

$('.payment-item').click(function(e){
	e.stopPropagation();
})

 $(function(){
    $('.choice-payment').click(function(e){
    	e.preventDefault();
        $('.pay-choice-icon').toggleClass('display-none');
        $('.pay-choice-icon .choice-icon-close').toggleClass('display-none');
        adpayView();
    })
    $(".payment-submit-btn").attr("disabled", true);
    $('#check-essential').on('click',function(){
        var click = $('#check-essential').is(":checked");
        if(click==true){
            $('.payment-submit-btn').removeAttr('disabled');
            $('.payment-submit-btn-box').removeClass("on");
            $('.payment-submit-nocheck').toggleClass();
        }else{
            $('.payment-submit-btn').attr("disabled",true);
            $('.payment-submit-btn-box').addClass("on");
        }
    })
})
function adpayView(){
    var target = $('.choice-payment option:selected').val();
    $('.paymentchoice-box > .paymentchoice-help').addClass('display-none');
    $('.paymentchoice-box .'+target).removeClass('display-none');
}
adpayView();
</script>