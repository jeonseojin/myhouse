<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="comic-info" class="comicInfo">
	<img class="comicInfo-img" src="/ebook/resources/img${toon.t_typify}" alt="">
	<div class="comicInfo-Epdetail">
	    <h2 class="comicInfo-title">${toon.title}</h2>
	    <div class="comicInfo-genre"><a class="link-comic-genre">${toon.t_type}</a></div>
	    <div class="comicInfo-plot">${toon.plot}</div>
	    <div class="comicInfo-Ulike">
	    	<input type="hidden" name="engtitle" value="${toon.t_title}">
	    	<c:if test="${member.id==null}">
				<button class="comicInfo-btn-choice">찜하기<i class="far fa-star"></i></button>
			</c:if>
			<c:if test="${member.id!=null}">
				<c:if test="${member.id!=ch.ch_id}">
					<button class="comicInfo-btn-choice">찜하기<i class="far fa-star"></i></button>
				</c:if>
				<c:if test="${ch.ch_id==member.id}">
					<button class="comicInfo-btn-nochoice">찜하기<i class="fas fa-star"></i></button>
				</c:if>
			</c:if>
	    	<button class="comicInfo-btn-up"><i class="far fa-heart"></i></button>
	    	
	    </div>
    </div>
</div>

<div class="comic-Content">
	<div class="cont-update">
		<ul class="comiclist-update">
			<c:forEach var="epcov" items="${epcov}">
				<li class="comiclist-item">
					<a class="comic-itemlink" href="<%=request.getContextPath()%>/toon/comic?Title=${toon.t_title}&edition=${epcov.e_edition}"><img src="/ebook/resources/img${epcov.e_img}"> </a>
					<div class="comic-items-box">
						<span class="comic-itemedtion">${epcov.e_edition}화</span>
						<c:if test="${epcov.e_title!=null}">
							<span class="comic-items-eptitle">${epcov.e_title}</span>
						</c:if>
						<span class="comic-itemday">${epcov.e_date}</span>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
	
	<div class="cont-recommend"></div>
	
</div>
<script>
	$(function(){
		$('.comicInfo-btn-choice').click(function(){
			var Title = $('input[name=engtitle]').val();
			var id = $('input[name=id]').val();
			$.ajax({
				async:true,
		        type:'POST',
		        data:Title,
		        url:"<%=request.getContextPath()%>/toon/choice",
		        dataType:"json",
		        contentType:"application/json; charset=UTF-8",
		        success : function(data){
			        //로그인한 회원
			        if(data['isMember']){
				        //게시글의 추천수가 0보다 크면 => 추천수를 증가시켜야하면
				        //=> 처음 추천을 누른다면
				        if(data['choice'] > 0){
					        $.each(data,function(key,rec){
					        	"<c:set var ="ch" value="+rec.ch+"  />" ;
						    })
				        	alert('찜하셨습니다.')
					    }
				    }
				    //로그인하지 않은 경우
				    else{
					    alert('찜은 로그인을 해야 가능합니다.');
					}
		        }
			});
		})
		$('.comicInfo-btn-nochoice').click(function(){
			var Title = $('input[name=engtitle]').val();
			$.ajax({
				async:true,
		        type:'POST',
		        data:Title,
		        url:"<%=request.getContextPath()%>/toon/nochoice",
		        dataType:"json",
		        contentType:"application/json; charset=UTF-8",
		        success : function(data){
			        //로그인한 회원
			        if(data['isMember']){
				        //게시글의 추천수가 0보다 크면 => 추천수를 증가시켜야하면
				        //=> 처음 추천을 누른다면
				        if(data['choice'] > 0){
				        	$.each(data,function(key,rec){
					        	"<c:set var ="ch" value="+rec.ch+"  />" ;
						    })
				        	alert('찜을 해제하셨습니다.')
					    }
				    }
		        }
			});
		})
	})
</script>