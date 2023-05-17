<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

	<div class="sidebar">
	    <div class="user_profile">
	        <%-- <img src="<c:out value="${item.path}"/><c:out value="${item.uuidName}"/>" alt=""> --%>
	        <c:choose>
				<c:when test="${img.path ne null}">
					<li class="info-img"><img src="<c:out value="${img.path}"/><c:out value="${img.uuidName}"/>"></li>
				</c:when>
				<c:otherwise>
					<li class="info-img"><img src="https://cdn-icons-png.flaticon.com/512/547/547413.png"></li>
				</c:otherwise>
			</c:choose>
		</div>
	<div class="user_name"><a href="#"><c:out value="${sessName}" />(<c:out value="${sessId}" />)</a></div>
		<ul class="side_menu_list">
		    <h1>MENU</h1>
		    <li onclick="location.href='/spaceMain?zbspSeq=<c:out value="${vo.zbspSeq}"/>'">SPACE MAIN</li>
			<li onclick="location.href='/spaceChat?zbspSeq=<c:out value="${vo.zbspSeq}"/>&zbmmSeq=<c:out value="${sessSeq }"/>'">CHATTING</li>
			<li onclick="location.href='/spaceMapRouteAjax?zbspSeq=<c:out value="${vo.zbspSeq }"/>&zbtfSeq=0'">MAP</li>
			<li onclick="location.href='/spaceDucthPay?zbspSeq=<c:out value="${vo.zbspSeq}"/>'">PAY</li>
	        <li onclick="location.href='/spaceSetting?zbspSeq=<c:out value="${vo.zbspSeq}"/>'">SETTING</li>
		</ul>
	</div>
