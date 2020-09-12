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
	    	<button class="comicInfo-btn-choice">찜하기<i class="far fa-heart"></i></button>
	    	<button class="comicInfo-btn-updown"><i class="far fa-hand-point-up"></i></button>
	    	<button class="comicInfo-btn-updown"><i class="far fa-hand-point-down"></i></button>
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