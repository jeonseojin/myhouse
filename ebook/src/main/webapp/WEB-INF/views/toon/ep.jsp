<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<div id="comic-info" class="comicInfo">
	<img class="comicInfo-img" src="/ebook/resources/img${toon.t_typify}" alt="">
	<div class="comicInfo-Epdetail">
	    <h2 class="comicInfo-title">${toon.title}</h2>
	    <div class="comicInfo-genre"><a class="link-comic-genre">${toon.t_type}</a></div>
	    <div class="comicInfo-plot">${toon.plot}</div>
	    <div class="comicInfo-Ulike">
	    	<input type="hidden" name="engtitle" value="${toon.t_title}">
	    	<div class="comicInfo-btn float-left">
		    	<c:if test="${member.id==null||member.id!=ch.ch_id}">
					<button class="comicInfo-btn-choice">찜하기<i class="far fa-star"></i></button>
				</c:if>
				<c:if test="${member.id!=null&&ch.ch_id==member.id}">
					<button class="comicInfo-btn-nochoice">찜하기<i class="fas fa-star"></i></button>
				</c:if>
			</div>
			<div class="comicInfo-btnup float-left">
				<c:if test="${member.id==null||member.id!=up.up_id}">
		    		<button class="comicInfo-btn-up"><i class="far fa-heart"></i></button>
		    	</c:if>
		    	<c:if test="${member.id!=null&&member.id==up.up_id}">
		    		<button class="comicInfo-btn-noup"><i class="fas fa-heart"></i></button>
		    	</c:if>
	    	</div>
	    </div>
    </div>
</div>

<div class="comic-Content">
	<div class="cont-update">
		<ul class="comiclist-update">
			<c:forEach var="epcov" items="${epcov}">
				<li class="comiclist-item">
					<c:if test="${epcov.e_coin==0}">
						<a class="comic-itemlink" href="<%=request.getContextPath()%>/toon/comic?Title=${toon.t_title}&edition=${epcov.e_edition}"><img src="/ebook/resources/img${epcov.e_img}"> </a>
						<div class="comic-items-box">
							<span class="comic-itemedtion">${epcov.e_edition}화</span>
							<c:if test="${epcov.e_title!=null}">
								<span class="comic-items-eptitle">${epcov.e_title}</span>
							</c:if>
							<c:if test="${epcov.e_coin==0}">
								<span class="comic-items-epcoin">무료</span>
							</c:if>
							<span class="comic-itemday">${epcov.e_date}</span>
						</div>
					</c:if>
					<c:if test="${epcov.e_coin!=0}">
						<c:if test="${member.id==null}">
							<button class="nologin-payment" type="button"><img src="/ebook/resources/img${epcov.e_img}"> </button>
							<div class="comic-items-box">
								<span class="comic-itemedtion">${epcov.e_edition}화</span>
								<c:if test="${epcov.e_title!=null}">
									<span class="comic-items-eptitle">${epcov.e_title}</span>
								</c:if>
								<span class="comic-items-epcoin">${epcov.e_coin} 코인</span>
								<span class="comic-itemday">${epcov.e_date}</span>
							</div>
						</c:if>
						<c:if test="${member.id!=null && epcov.iscontain(plist)}">
							<c:forEach var="plist" items="${plist}">
								<c:choose>
									<c:when test="${plist.p_title == epcov.e_t_title && plist.p_edition==epcov.e_edition}">
										<a class="comic-itemlink" href="<%=request.getContextPath()%>/toon/comic?Title=${toon.t_title}&edition=${epcov.e_edition}"><img src="/ebook/resources/img${epcov.e_img}"> </a>
										<div class="comic-items-box">
											<span class="comic-itemedtion">${epcov.e_edition}화</span>
											<c:if test="${epcov.e_title!=null}">
												<span class="comic-items-eptitle">${epcov.e_title}</span>
											</c:if>
											<span class="comic-items-epcoin">소장</span>
											<span class="comic-itemday">${epcov.e_date}</span>
										</div>
									</c:when>
								</c:choose>
							</c:forEach>
						</c:if>
						<c:if test="${member.id!=null && !epcov.iscontain(plist)}">
							<button class="comic-itemlink-payment" type="button"><img src="/ebook/resources/img${epcov.e_img}"> </button>
							<div class="comic-items-box">
								<span class="comic-itemedtion">${epcov.e_edition}화</span>
								<c:if test="${epcov.e_title!=null}">
									<span class="comic-items-eptitle">${epcov.e_title}</span>
								</c:if>
								<span class="comic-items-epcoin">${epcov.e_coin} 코인</span>
								<span class="comic-itemday">${epcov.e_date}</span>
								<input value="${epcov.e_coin}" type="hidden" name="coin">
								<input value="${epcov.e_edition}" type="hidden" name="edition">
								<input value="${epcov.e_t_title}" type="hidden" name="title">
							</div>
						</c:if>
					</c:if>
				</li>
			</c:forEach>
		</ul>
	</div>
</div>
<div class="comic-payment-box display-none">
	<div class="comic-item-payment">
		<h4>작품 구매</h4>
		<div class="comic-payment-content">
			<img src="/ebook/resources/img${toon.t_img}">
			<div class="comic-paycontent-span">
			</div>
		</div>
		<p>열람하지 않은 에피소드에 대해서만 구매 후 7일 이내 청약 철회가 가능합니다.</p>
		<div class="comic-payment-btn">
		<button type="button" class="comic-btn-cancel">취소</button>
		<button type="submit" class="comic-btn-pay">구매</button>
		</div>
	</div>
	<input type="hidden" name="p_coin">
	<input type="hidden" name="p_edition">
	<input type="hidden" name="p_title">
</div>

<script>
$(function(){
	$(document).click(function(e){
	    $('.comic-payment-box').addClass('display-none');
	    $('.comic-item-payment').addClass('display-none');
	})
	$('.comic-itemlink-payment').click(function(e){
    	e.stopPropagation();
    	$('.comic-paycontent-span>span').append().remove();
    	var coin=$(this).next().children('input[name=coin]').val();
    	var edition=$(this).next().children('input[name=edition]').val();
    	var title=$(this).next().children('input[name=title]').val();
    	var str = 	'<span class="comic-payitem-edtion">'+edition+'화</span>'+
    				'<span class="comic-payitem-coin">'+coin+'코인</span>'
    	$('.comic-paycontent-span').append(str);
    	$('.comic-payment-box').removeClass('display-none');
    	$('.comic-item-payment').removeClass('display-none');
    	$('input[name=p_coin]').val(coin);
    	$('input[name=p_edition]').val(edition);
    	$('input[name=p_title]').val(title);
	})
	
	$('.comic-item-payment').click(function(e){
    	e.stopPropagation();    	
    })
    $('.comic-btn-pay').click(function(){
    	var coin=$('input[name=p_coin]').val();
    	var edition=$('input[name=p_edition]').val();
    	var title=$('input[name=p_title]').val();
    	$.ajax({
			async:true,
	        type:'POST',
	        data:JSON.stringify({	"p_title":title,
		        	"p_edition":edition,
		        	"p_coin":coin	}),
	        url:"<%=request.getContextPath()%>/toon/comic",
	        dataType:"json",
	        contentType:"application/json; charset=UTF-8",
		        success : function(data){
		        }
		});
    })
    
    $('.comic-btn-cancel').click(function(){
    	$('.comic-item-payment').addClass('display-none');
    	$('.comic-payment-box').addClass('display-none');
    })
    
    $('.nologin-payment').click(function(){
        alert("로그인 후에 구매하실 수 있습니다.")
    })
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
			        	var str="<button class='comicInfo-btn-nochoice'>찜하기<i class='fas fa-star'></i></button>";
				        $('.comicInfo-btn').html(str);
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
			        	var str="<button class='comicInfo-btn-choice'>찜하기<i class='far fa-star'></i></button>";
				        $('.comicInfo-btn').html(str);
				    }
			    }
	        }
		});
	})
	$('.comicInfo-btn-up').click(function(){
		var Title = $('input[name=engtitle]').val();
		var id = $('input[name=id]').val();
		$.ajax({
	        async:true,
	        type:'POST',
	        data:Title,
	        url:"<%=request.getContextPath()%>/toon/up",
	        dataType:"json",
	        contentType:"application/json; charset=UTF-8",
	        success : function(data){
		        //로그인한 회원이면
		        if(data['isMember']){
			        //게시글의 추천수가 0보다 크면 => 추천수를 증가시켜야하면
			        //=> 처음 추천을 누른다면
			        if(data['up'] > 0){
				        $('.text-like').text('추천:'+data['up'])
				        alert('♥ 추천해 주셔서 감사합니다.');
			        	var str="<button class='comicInfo-btn-noup'><i class='fas fa-heart'></i></button>";
				        $('.comicInfo-btnup').html(str);
				    }
				    //이미 추천을 눌렀다면
				    else{
					    alert('이미 추천한 게시물입니다.')
					}
			    }
			    //로그인하지 않았으면
			    else{
				    alert('추천은 로그인을 해야 가능합니다.');
				}
	        }
	    });
	})
})
</script>