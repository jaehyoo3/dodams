<!<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<html>
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="/resources/css/bdmin/bdmin.css">
	    <title>DoDam.X2</title>
	</head>
	<body>
	    <!-- 상단 네비게이션/사이드메뉴 s -->
		<%@include file="../../include/Bdmin/sideMenu.jsp" %>
	    <!-- 상단 네비게이션/사이드메뉴 e -->
	    <div class="container">
	    	<div class="form-wrap">
	    		<p>SpaceSeq </p>
	    		<p>스페이스명 *</p>
	    		<input type="text">
	    		<p>호스트 *</p>
	    		<input type="text">
	    		<p>참여 인원 *</p>
	    		<input type="text">
	    		<p>종료 여부</p>
	    		<select>
	    			<option>dd</option>
	    		</select>
	    		<p>삭제 여부</p>
	    		<select>
	    			<option>dd</option>
	    		</select>
	    		<ul>
	    			<li>등록일: <input type="text"></li>
	    			<li>수정일: <input type="text"></li>
	    		</ul>
	    	</div>
	    	<div class='btn-wrap'>
	    	<ul>
	    		<li style="float:left;"><button class="leftColor">del</button></li>
	    		<li style="float:left;"><button class="leftColor">uel</button></li>
	    		<li style="float:right;"><button class="rightColor">commit</button></li>
	    		<li style="float:right;"><button class="rightColor">list</button></li>
	    	</ul>	    	
	    </div>
	    </div>
	    <!-- 스크립트영역 s -->
		<%@include file="../../include/All/JSLink.jsp" %>
		<!-- 스크립트영역 e -->
	</body>
</html>