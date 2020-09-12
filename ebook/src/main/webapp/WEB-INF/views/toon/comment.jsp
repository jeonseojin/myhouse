<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<form id="epcomment">
<div class="epcomment-regist">
	<div class="epcomment-submit">
		<textarea class="epregist-text" name="co_content"></textarea>
		<button class="epcomment-btn-submit" onclick="write()">댓글달기</button>
	</div>
</div>
			<input type="hidden" name="co_epEdition" value="000">
			<input type="hidden" name="co_epTitle" value="horrormance">
			<input type="hidden" name="co_member" value="장어">
</form>	

<script>
	var httpRequst=null;

	//httpRequest 객체 생성
	function getXMLHttpRequest(){
		var httpRequest = null;
		if(window.ActiveCObject){
			try{
				httpRequest = new ActiveCObject("Msxm12.XMLHTTP");
			}catch(e){
				try{
					httpRequest = new ActiveCObject("Microsoft.XMLHTTP");
				}catch(e2) { httpRequest = null; }
			}
		}
		else if(window.XMLHttpRequest){
			httpRequest = new window.XMLHttpRequest();
		}
		return httpRequest;
	}
	//댓글 등록
	function write(){
		var form = document.getElementById("epcomment");
		var content = form.co_content.value;
		var edition = form.co_epEdition.value;
		var title = form.co_epTitle.value;
		var member = form.co_member.value;

		if(!content){
			alert("내용을 입력하셔야 합니다.");
			return false;
		}else{
			var param = "co_content="+content+"&co_epEdition="+edition+"&co_epTitle="+title+"&co_member="+member;

			httpRequest =getXMLHttpRequest();
			httpRequest.onreadystatechange =checkFunc;
			httpRequest.open("POST", "epcomment.co",true);
			httpRequest.setRequestHeader('content-Type','application/x-www-form-urlencoded;charser=EUC-KR');
			httpRequest.send(param);			
		}
	}
	function checkFunc(){
		if(httpRequest.readyState==5){
			var resultText = httpRequest.responseText;
			if(resultText==1){
				document.location.reload();
			}
		}
	}
</script>