<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <div class="toon-genre-box">
        <button class="toon-genre" type="button" value="전체장르" aria-selected="true">전체</button>
        <button class="toon-genre" type="button" value="로맨스">로맨스</button>
        <button class="toon-genre" type="button" value="드라마">드라마</button>
        <button class="toon-genre" type="button" value="판타지">판타지</button>
        <button class="toon-genre" type="button" value="개그">개그</button>
        <button class="toon-genre" type="button" value="액션">액션</button>
        <button class="toon-genre" type="button" value="학원">학원</button>
        <button class="toon-genre" type="button" value="미스터리">미스터리</button>
        <button class="toon-genre" type="button" value="일상">일상</button>
    </div>
<form action="<%=request.getContextPath()%>/ranking">
	<div class="ranking-box">
		<h3 class="ranking-heading">장르랭킹</h3>
		<ul class="ranking-list">
			<c:forEach var="toon" items="${toon}" varStatus="status">
				<li class="ranking-item">
					<a class="ranking-link" href="<%=request.getContextPath()%>/toon/ep?Title=${toon.t_title}">
						<img alt="" src="/ebook/resources/img${toon.t_img}">
						<div class="ranking-count">
							<span class="ranking-rank">${status.count}</span>
						</div>
						<div class="ranking-info">
							<span class="ranking-info-title">${toon.title}</span>
							<span class="ranking-info-artist">${toon.artist}</span>
							<span class="ranking-info-genre">${toon.t_type}</span>
						</div>
					</a>
				</li>
			</c:forEach>
		</ul>
	</div>
	<input type="hidden" name="genre">
</form>
<script>
    $(function(){
    	 $('.toon-genre-box .toon-genre').on('click',function(){
	        $('.toon-genre-box .toon-genre').attr('aria-selected','false');
            $(this).attr('aria-selected','true');
            var genre = $(this).val();
            $('input[name=genre]').val(genre);
            toonG();
            $.ajax({
    			async: true,
    			type:'POST',
    			url:"<%=request.getContextPath()%>/ranking",
    			data:genre,
    			dataType:"json",
    			contentType:"application/json; charset=UTF-8",
    			success:function(data){
    				var str='';
    				for(var i=0 ; i<data.toon.length;i++){  
        				str+=
	        					'<li class="ranking-item">'+
	        					'<a href="<%=request.getContextPath()%>/toon/ep?Title='+data.toon[i].t_title+'" class="ranking-link">'+
	    						'<img alt="" src="/ebook/resources/img'+data.toon[i].t_img+'">'+
	    						'<div class="ranking-count">'+
	    						'<span class="ranking-rank">'+(i+1)+'</span>'+
	    						'</div>'+
	    						'<div class="ranking-info">'+
    							'<span class="ranking-info-title">'+data.toon[i].title+'</span>'+
    							'<span class="ranking-info-artist">'+data.toon[i].artist+'</span>'+
    							'<span class="ranking-info-genre">'+data.toon[i].t_type+'</span>'+
	    						'</div>'+
	    						'</a>'+
	    						'</li>';	
    				}
    				$('.ranking-list').html(str);
    			}
			
    		});
        })
    })
    function toonG(){
	    var target = $('.toon-genre-box .toon-genre[aria-selected=true]').attr('data-target');
	    $('.toon-box>.toon-list').addClass('display-none');
	    $('.toon-box .'+target).removeClass('display-none');
	}
    toonG();

</script>