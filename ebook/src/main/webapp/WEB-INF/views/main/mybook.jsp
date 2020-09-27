<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <c:if test="${member.name==null}">
	<h1>접근할 수 없는 경로 입니다.</h1>
</c:if>
<c:if test="${member.name!=null}">
	<div class="log-list look">
	    <div class="look-box">
	    	<c:if test="${toon.size()!=null}">
				<span class="ranking-heading">최근</span>
					<div class="mybook-box">
						<c:forEach var="toon" items="${toon}">
							<div class="mybook-box-list">
								<a class="ranking-link" href="<%=request.getContextPath()%>/toon/ep?Title=${toon.t_title}">
									<img class="mybook-img" alt="" src="/ebook/resources/img${toon.t_img}">
									<div class="ranking-info mybook-info">
										<span class="ranking-info-title">${toon.title}</span>
										<span class="ranking-info-artist">${toon.artist}</span>
										<span class="ranking-info-genre">${toon.t_type}</span>
									</div>
								</a>
							</div>
						</c:forEach>
				</div>
			</c:if>
			<span class="ranking-heading">찜</span>
			<div class="mybook-box">
				<c:if test="${chlist.size()!=0}">
					<c:forEach var="chlist" items="${chlist}">
						<div class="mybook-box-list">
							<a class="ranking-link" href="<%=request.getContextPath()%>/toon/ep?Title=${chlist.t_title}">
								<img class="mybook-img" alt="" src="/ebook/resources/img${chlist.t_img}">
								<div class="ranking-info  mybook-info">
									<span class="ranking-info-title">${chlist.title}</span>
									<span class="ranking-info-artist">${chlist.artist}</span>
									<span class="ranking-info-genre">${chlist.t_type}</span>
								</div>
							</a>
						</div>
					</c:forEach>
				</c:if>
			</div>
			<span class="ranking-heading">소장</span>
			<div class="mybook-box">
				<c:forEach var="plist" items="${payToon}">
					<div class="mybook-box-list">
						<a class="ranking-link" href="<%=request.getContextPath()%>/toon/ep?Title=${plist.t_title}">
							<img class="mybook-img" alt="" src="/ebook/resources/img${plist.t_img}">
							<div class="ranking-info mybook-info">
								<span class="ranking-info-title">${plist.title}</span>
								<span class="ranking-info-artist">${plist.artist}</span>
								<span class="ranking-info-genre">${plist.t_type}</span>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</c:if>
