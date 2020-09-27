<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%	Date nowTime = new Date();
	nowTime.setDate(nowTime.getDate()+3);
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");	%>


    <form action="<%=request.getContextPath()%>/event/attend">
		<div class="eventpage-box">
			<img src="/ebook/resources/img${event.ev_page}">
			<button type="button" class="attend-btn">출석하기</button>
		</div>
		<input type="hidden" name="p_point" value="1">
		<input type="hidden" name="lastdate" value="<%=sf.format(nowTime)%>">
		<input type="hidden" name="p_title" value="충전이벤트">
	</form>
<script type="text/javascript">
$(".attend-btn").click(function(){
	var member = $('input[name=p_member]').val();
	var point = $('input[name=p_point]').val();
	var title = $('input[name=p_title]').val();
	var date = $('input[name=p_usedate]').val();
	$.ajax({
		async: true,
		type:'POST',
		url:"<%=request.getContextPath()%>/event/attend",
		data:JSON.stringify({"p_member":member,"p_point":point,"p_title":title,"p_usedate":date}),
		dataType:"json",
		contentType:"application/json; charset=UTF-8",
		success:function(data){
			if(data['isMember']){
		    	if(data["res"]!=null){
		    		alert(data["res"]);
			    }else{
				    alert('출석 코인이 지급되었습니다. 3일 후 사라지니 주의하세요.');
				}	        
		    }//로그인하지 않았으면
		    else{
			    alert('출석은 로그인을 해야 가능합니다.');
			}
		}
	});
})
</script>