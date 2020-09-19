<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<form action="<%=request.getContextPath()%>/admin/ep" method="post" id="uploadForm" enctype="multipart/form-data">
	<table class="table table-hover">
		<thead>
			<tr>
				<th>웹툰 제목</th>
				<th>
					<span>${toon.title}</span>
					<input type="hidden" class="toon-text-box toon-text-title e_t_title" name="e_t_title" value="${toon.t_title}">
				</th>
				<th>제목</th>
				<th><input type="text" class="toon-text-box toon-text-title" name="e_title" placeholder="부제목을 입력하세요"></th>
				<th><input type="text" class="toon-text-box toon-text-edition " id="ep-edition" placeholder="몇" onchange="Edinput(this.value)">회</th>
				<th>금액</th>
				<th>
					<select class="ep-coin" onchange="Coinput(this.value)">
						<option value="0">무료</option>
						<option value="2">결제</option>
					</select>
				</th>
			</tr>
		</thead>
	</table>
	<button class="btn btn-primary float-right btn-mul-img" type="submit">등록</button>
	<div class="ad-plot-box">
		<h4 class="ad-plot-h">연재이미지</h4>
		<input class="input-ep-img" type="file" name="file2" multiple />
		<!-- 미리보기 영역 -->
	    <div class="ad-ep-preview"></div>
	</div>
	<input type="hidden" id="e_edition" name="e_edition">
	<input type="hidden" id="e_coin" name="e_coin">
</form>
<a href="<%=request.getContextPath() %>/admin/toon?page=${cri.page}&type=${cri.type}&search=${cri.search}" class="float-left"><button type="button" class="btn btn-outline-secondary">목록</button></a>
<script>
	
	var value = $(".ep-coin").val();
	$('#e_coin').val();
	
	function Edinput(input){
		var value = $("#ep-edition").val(); 
		$('#e_edition').val('00'+value); 
	}
	function Coinput(input){
		var value = $(".ep-coin").val();
		$('#e_coin').val(value); 
	}
	 var sel_files=[];
	$(document).ready(function(){
		$('.input-ep-img').on("change",handleEpFilesSelect);
	})
	function handleEpFilesSelect(e){
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		filesArr.forEach(function(f){
			$('.ad-ep-preview').empty();
			if(!f.type.match("image.*")){
				alert("확장자는 이미지 확장자만 가능")
				return;
			}
			sel_files.push(f);
			var reader = new FileReader();
			reader.onload = function(e){
				var img_html = "<img src=\"" + e.target.result + "\"/>";
				$('.ad-ep-preview').append(img_html);
			}
			reader.readAsDataURL(f);
		})
    }    
</script>