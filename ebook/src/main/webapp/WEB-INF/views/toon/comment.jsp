<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="epcomment-box" id="epcomment-box">
	<div class="eptit-cmt">댓글
		<span class="eptit-cmt-count">(<span>${cmtnum}</span>)</span>
		<a class="eptit-i-btn"><i class="fas fa-exclamation-circle"></i></a>
	</div>
	<div class="box-comment">
		<c:if test="${member.name==null}">
			<div class="epcomment-regist">
				<div class="epcomment-submit">
					<textarea class="epregist-text notmem-reg">주제와 무관한 댓글이나 스포일러, 악플은 경고조치 없이 삭제되며 징계 대상이 될 수 있습니다</textarea>
					<button class="epcomment-btn">댓글달기</button>
				</div>
			</div>
		</c:if>
		<c:if test="${member.name!=null}">
			<div class="epcomment-regist" id="form-EpComment">
				<span class="epregist-name">${member.name}</span>
				<div class="epcomment-submit">
					<textarea class="epregist-text" name="co_content"></textarea>
					<button class="epcomment-btn-submit">댓글달기</button>
				</div>
				<input type="hidden" name="co_epEdition" value="${epcov.e_edition}">
				<input type="hidden" name="co_epTitle" value="${epcov.e_t_title}">
				<input type="hidden" name="co_member" value="${member.name}">
			</div>
		</c:if>
	</div>
	
	<div class="epcmt-box">
		<c:forEach var="cmtlist" items="${cmtlist}">
			<div class="epcmt-list">
				<span class="epcmt-name">${cmtlist.co_member}</span>
				<div class="epcmt-text">${cmtlist.co_content}</div>
				
				<div class="epcmt-end">
					<span class="epcmt-date">${cmtlist.co_date}</span>
					<c:if test="${member.name==cmtlist.co_member}">
						<a href="<%=request.getContextPath()%>/toon/cmtmo?&num=${cmtlist.co_num}"><button type="button" class="cmtmo-btn">수정</button></a>
						<button type="button" class="cmtdel-btn">삭제</button>
					</c:if>
					<input type="hidden" name="co_num" value="${cmtlist.co_num}">
					<div class="epcmt-btnbox-up">
						<input type="hidden" name="co_num" value="${cmtlist.co_num}">
						<button class="epcmt-up"><i class="far fa-hand-point-up"></i><span name="co_up">${cmtlist.co_up}</span></button>
					</div>
					<div class="epcmt-btnbox-down">
						<input type="hidden" name="co_num" value="${cmtlist.co_num}">
						<button class="epcmt-down"><i class="far fa-hand-point-down "></i><span name="co_down">${cmtlist.co_down}</span></button>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>


<script>
	$(function(){
		$('.notmem-reg').click(function(){
			alert("댓글 작성은 로그인 후에 사용하실 수 있습니다.");
		})
		$(".epcomment-btn-submit").click(function(){
			var member = $('input[name=co_member]').val();
			var title = $('input[name=co_epTitle]').val();
			var edition = $('input[name=co_epEdition]').val();
			var content = $('textarea[name=co_content]').val();
			$.ajax({
				async: true,
				type:'POST',
				url:"<%=request.getContextPath()%>/toon/comment",
				data:JSON.stringify({"co_member":member,"co_epTitle":title,"co_epEdition":edition,"co_content":content}),
				dataType:"json",
				contentType:"application/json; charset=UTF-8",
				success:function(data){
					alert("댓글이 등록하였습니다.");
					$('textarea[name=co_content]').val('');
					var str='';
					for(var i in data.cmtlist){
						if(data.member==data.cmtlist[i].co_member){
							str+=
								'<div class="epcmt-list">'+
								'<span class="epcmt-name">'+ data.cmtlist[i].co_member +'</span>'+
								'<div class="epcmt-text">'+ data.cmtlist[i].co_content+'</div>'+
								'<div class="epcmt-end">'+
								'<span class="epcmt-date">'+ data.cmtlist[i].co_date+'</span>'+
								'<a href="<%=request.getContextPath()%>/toon/cmtmo?&Title=${toon.t_title}"><button type="button" class="cmtmo-btn">수정</button></a>'+
								'<a href="<%=request.getContextPath()%>/toon/cmtdel?Title=${toon.t_title}"><button type="button" class="cmtdel-btn">삭제</button></a>'+
								'<div class="epcmt-btnbox">'+
								'<form action="<%=request.getContextPath()%>/cmt/up">'+
								'<input type="hidden" name="co_num" value="'+data.cmtlist[i].co_num+'">'+
								'<button class="epcmt-up"><i class="far fa-hand-point-up"></i>'+ data.cmtlist[i].co_up+'</button>'+
								'</form>'+
								'<form action="<%=request.getContextPath()%>/cmt/down">'+
								'<input type="hidden" name="co_num" value="'+data.cmtlist[i].co_num+'">'+
								'<button class="epcmt-down"><i class="far fa-hand-point-down "></i>'+ data.cmtlist[i].co_down+'</button>'+
								'</form>'+
								'</div></div></div>';
						}else{
							str+=
								'<div class="epcmt-list">'+
								'<span class="epcmt-name">'+ data.cmtlist[i].co_member +'</span>'+
								'<div class="epcmt-text">'+ data.cmtlist[i].co_content+'</div>'+
								'<div class="epcmt-end">'+
								'<span class="epcmt-date">'+ data.cmtlist[i].co_date+'</span>'+
								'<div class="epcmt-btnbox">'+
								'<form action="<%=request.getContextPath()%>/cmt/up">'+
								'<input type="hidden" name="co_num" value="'+data.cmtlist[i].co_num+'">'+
								'<button class="epcmt-up"><i class="far fa-hand-point-up"></i>'+ data.cmtlist[i].co_up+'</button>'+
								'</form>'+
								'<form action="<%=request.getContextPath()%>/cmt/down">'+
								'<input type="hidden" name="co_num" value="'+data.cmtlist[i].co_num+'">'+
								'<button class="epcmt-down"><i class="far fa-hand-point-down "></i>'+ data.cmtlist[i].co_down+'</button>'+
								'</form>'+
								'</div></div></div>';
						}
					}
					$('.epcmt-box').html(str);
				}
			});
		})
		
		$('.epcmt-up').click(function(){
			var co_num= $(this).siblings('input[name=co_num]').val();
			console.log(co_num)
			$.ajax({
		        async:true,
		        type:'POST',
		        data:co_num,
		        url:"<%=request.getContextPath()%>/cmt/up",
		        dataType:"json",
		        contentType:"application/json; charset=UTF-8",
		        success : function(data){
		        	if(!data['isMember']){
						alert("로그인 후 사용 가능합니다.")
					}else{
						if(data['up']==-1){
								alert('좋아요는 1번만 가능합니다.')
							}else{
								str = '<input type="hidden" name="co_num" value="'+co_num+'">'+
									'<button class="epcmt-up"><i class="far fa-hand-point-up "></i><span name="co_up">'+data.up+'</span></span></button>'
							}
						} 
		        		$(this).siblings('.epcmt-btnbox-up').html(str);    
				    }
		    });
		})
		$('.epcmt-down').click(function(){
			var co_num= $(this).parent().children('input[name=co_num]').val();
			console.log(co_num)
			$.ajax({
		        async:true,
		        type:'POST',
		        data:co_num,
		        url:"<%=request.getContextPath()%>/cmt/down",
		        dataType:"json",
		        contentType:"application/json; charset=UTF-8",
		        success : function(data){
				        var str = "";
			        	if(!data['isMember']){
							alert("로그인 후 사용 가능합니다.")
						}else{
							if(data['down']==-1){
									alert('싫어요는 1번만 가능합니다.')
								}else{
									str = '<input type="hidden" name="co_num" value="'+co_num+'">'+
										'<span name="co_down">'+data.down+'</span>'
								}
							} 
		        	$(this>'.epcmt-btnbox-down').html(str);   
				}
		    });
		})
		$('.cmtdel-btn').click(function(){
			var co_num= $(this).parent().children('input[name=co_num]').val();
			console.log(co_num)
			$.ajax({
		        async:true,
		        type:'POST',
		        data:co_num,
		        url:"<%=request.getContextPath()%>/toon/cmtdel",
		        dataType:"json",
		        contentType:"application/json; charset=UTF-8",
		        success : function(data){
			        	if(!data['isMember']){
							alert("로그인 후 사용 가능합니다.")
						}else{
							alert(data["res"]);
						}  
				}
		    });
		})
	})
	
</script>