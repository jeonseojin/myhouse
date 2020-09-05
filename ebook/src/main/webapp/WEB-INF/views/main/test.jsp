<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <form id="MultiUpload" action="<%=request.getContextPath()%>/test" method="post" enctype="multipart/form/data">
    	<input type="text" id="e_t_title" name="e_title" placeholder="제목">
    	<input type="text" id="e_title" name="e_title" placeholder="부제">
    	<input type="file" id="file" name="file" multiple="multiple">
    	<input type="button" value="전송" onClick="fileSubmit();">
    </form>
    
    
<script>
	function fileSubmit(){
		var form = $("#MultiUpload")[0];
		var formData = new FormData(form);
		$.ajax({
			type:'post',
			url:'<%=request.getContextPath()%>/test',
			data: formData,
			dataType:'json',
			contentType: false,
			processData: false,
			success: function(html){
				alert("파일 업로드하였습니다.");
			}
		});
	}
</script>