<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>

<div class="navbar">
    <div class="navbar__logo">
        <a href="/main">DODAM</a>
    </div>
    <ul class="navbar__menu">
		<c:choose>
			<c:when test="${empty sessSeq}">
        		<li onclick="location.href='/spaceSearch'">Board</li>     
				<li onclick="location.href='/login'">Login</li>
        		<!-- <li>Space</li> -->
			</c:when>
			<c:when test="${fn:length(inviteList) >= 1}">
				<div id="open-modal"><img src="https://cdn-icons-png.flaticon.com/512/2058/2058148.png"></div>
				<div class="modal" >
				    <div class="modal-content" >
				        <ul class="HeaderList">
				            <li><h3>초대장</h3></li>
				            <li><span id="close-modal">&times;</span></li>
				        </ul>
				        <ul class="modal-list"id="closeNew">
			         	<c:forEach items="${inviteList}" var="inviteList" varStatus="status">
						<c:if test="${inviteList.zbsiInviteNy eq 1}">
				            <li class="modal-list-item"  >
				                <div class="spaceName"><c:out value="${inviteList.zbspName}"/></div>
				                <div class="item-btnWrap">
				                    <button onclick="inviteN(<c:out value="${inviteList.zbsiSeq}"/>)">거절</button>
				                    <button onclick="inviteY(<c:out value="${inviteList.zbsiSeq}"/>)">수락</button>
				                </div>
				            </li>
        			             	</c:if> 
						</c:forEach>    
				        </ul>
				    </div>
				</div>
				<li onclick="location.href='/spaceSearch'">Board</li>
				<li onclick="location.href='/Mypage?zbmmSeq=<c:out value="${sessSeq}"/>'"><c:out value="${sessId}"/>님 환영합니다.</a></li>	     
				<li id="btnLogout">로그아웃</a>
			</c:when>	
			<c:otherwise>
				<li onclick="location.href='/spaceSearch'">Board</li>
				<li onclick="location.href='Mypage?zbmmSeq=<c:out value="${sessSeq}"/>'"><c:out value="${sessId}"/>님 환영합니다.</a></li>	     
				<li id="btnLogout">로그아웃</a>
			</c:otherwise>
		</c:choose>   
    </ul>
    <a href="#" class="navbar__toogleBtn">
        <i class="fa-solid fa-bars"></i>
    </a>
</div>