<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<div class="theend-genre-box">
		<select class="theend-genre-btn">
	    	<c:forEach var="genre" items="${genre}">
			<option name="g_type" value="${genre.g_type}">${genre.g_type}</option>
			</c:forEach>
		</select>
	</div>
	<form action="<%=request.getContextPath()%>">
		<h3 class="genre-heading">완결랭킹</h3>
		<ul class="genre-list">
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
		<input type="hidden" name="genre" value="전체장르">
	</form>
<script>

    $(function(){
    	 $('.theend-genre-btn').on('change',function(){
            var genre = $(this).val();
            $('input[name=genre]').val(genre);
            toonG();
            $.ajax({
    			async: true,
    			type:'POST',
    			url:"<%=request.getContextPath()%>/end",
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
    				$('.genre-list').html(str);
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