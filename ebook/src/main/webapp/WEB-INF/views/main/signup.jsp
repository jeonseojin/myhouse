<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form class="signup-box" action="<%=request.getContextPath()%>/signup" method="post">
	<h1 class="login-heading">회원가입</h1>
	<div class="signup-item">
		<div class="sign-up">
			<h6>아이디</h6>			
			<input type="text" class="sign-id" id="id" name="id">
			<label for="id" id="id-error" class="error"></label>
		</div>
		<div class="sign-up">
			<h6>비밀번호</h6>
			<input type="password" class="sign-pw" id="pw" name="pw">
			<label for="pw" id="pw-error" class="error"></label>
		</div>
		
		<div class="sign-up">
			<h6>비밀번호 확인</h6>
			<input type="password" name="pw2" id="pw2">
			<label for="pw2" id="pw2-error" class="error"></label>
		</div>
		<div class="sign-up">
			<h6>이름/별명</h6>
			<input type="text" name="name" id="name">
			<label for="name" id="name-error" class="error"></label>
		</div>
		
		<div class="sign-up">
			<h6>성별</h6>
			<div class="box-gender">
				<select name="gender" id="gender" class="gender-box">
					<option value="male">남자</option>
					<option value="female">여자</option>
				</select>
			</div>
			<label for="gender" id="gender-error" class="error"></label>
		</div>
		<div class="sign-up">
			<h6>본인 확인 이메일</h6>
			<input type="text" name="email" id="email">
			<label for="email" id="email-error" class="error"></label>
		</div>
		<button type="submit" class="signup-btn">가입하기</button>
	</div>
	<input type="hidden" value="${id}" id="id">
	<input type="hidden" value="${pw}" id="pw">
	<input type="hidden" value="${name}" id="name">
	<input type="hidden" value="${email}" id="email">
	<input type="hidden" value="${gender}" id="gender">
</form>

<script>
$(function(){
	$('input[name=id]').keyup(function(){
		var id = $(this).val();
		if(id.length >= 3){
			$.ajax({
		        async:true,
		        type:'POST',
		        data:id,
		        url:"<%=request.getContextPath()%>/idCheck",
		        dataType:"json",
		        contentType:"application/json; charset=UTF-8",
		        success : function(data){
			        	var str;
		            if(data['res']){
			            str = 
				        '<p style="color:green;">사용 가능한 아아디입니다.</p>'
		            }else{
		            	str = 
				        '<p style="color:red;">이미 가입되있거나 탈퇴한 아이디입니다.</p>'
		            }
		            $('#id-error').html(str);
		           
		        }
		    });
	    }else{
		    if(id.length == 0)
			    $('#id-error').html('필수 항목입니다.');
		    else
			    $('#id-error').html('아이디는 세글자 이상이어야 합니다.');
		}
	})
	$('input[name=name]').keyup(function(){
		var id = $(this).val();
		if(id.length >= 3){
			$.ajax({
		        async:true,
		        type:'POST',
		        data:id,
		        url:"<%=request.getContextPath()%>/nameCheck",
		        dataType:"json",
		        contentType:"application/json; charset=UTF-8",
		        success : function(data){
			        	var str;
		            if(data['res']){
			            str = 
				        '<p style="color:green;">사용 가능한 아아디입니다.</p>'
		            }else{
		            	str = 
				        '<p style="color:red;">이미 가입되있거나 탈퇴한 아이디입니다.</p>'
		            }
		            $('#name-error').html(str);
		           
		        }
		    });
	    }else{
		    if(id.length == 0)
			    $('#name-error').html('필수 항목입니다.');
		    else
			    $('#name-error').html('이름/별명은 세글자 이상이어야 합니다.');
		}
	})
	//유효성 검사
	$(function(){
	    $("form").validate({
	        rules: {
	            pw: {
	                required : true,
	                minlength : 8,
	                minlength : 20,
	                //아래의 내용은 정규표현식을 의미 8~20자이구 영문과 숫자를 반드시 포함해야한다는 의미
	                regex: /^\w*(\d[A-z]|[A-z]\d)\w*$/
	            },
	            pw2: {
	                required : true,
	                minlength : 8,
	                equalTo : pw
	            },
	            name: {
	                required : true,
	                minlength : 5
	            },
	            gender: {
	                required : true,
	                minlength : 4
	            },
	            email: {
	                required : true,
	                email : true
	            }
	        },
	        //규칙체크 실패시 출력될 메시지
	        messages : {
	            pw: {
	                required : "필수로입력하세요",
	                minlength : "최소 {0}글자이상이어야 합니다",
	                minlength : "최대 {0}글자이하이어야 합니다",
	                regex : "영문자, 숫자로 이루어져있으며 최소 하나이상 포함"
	            },
	            pw2: {
	                required : "필수로입력하세요",
	                equalTo : "비밀번호가 일치하지 않습니다."
	            },
	            gender: {
	                required : "이름 또는 별명을 입력해주세요.",
	                minlength : 4
	            },
	           	gender: {
	                required : "반드시 성별을 선택하세요.",
	                minlength : "반드시 성별을 선택하세요."
	            },
	            email: {
	                required : "필수로입력하세요",
	                email : "메일규칙에 어긋납니다"
	            }   
	        }
	    });
	})
	$.validator.addMethod(
	    "regex",
	    function(value, element, regexp) {
	        var re = new RegExp(regexp);
	        return this.optional(element) || re.test(value);
	    },
	    "Please check your input."
	);

})
</script>