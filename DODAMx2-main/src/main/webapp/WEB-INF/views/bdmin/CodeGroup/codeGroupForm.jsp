<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>

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
	    <!-- Jquery CDN -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	</head>
	<body>
	    <!-- 상단 네비게이션/사이드메뉴 s -->
		<%@include file="../../include/Bdmin/sideMenu.jsp" %>
	    <!-- 상단 네비게이션/사이드메뉴 e -->
	    <div class="container">
	    	<form name="form" id="form">
		    	<div class="form-wrap">
		    		<p>코드그룹번호</p>
		    		<input type="text" name="codeGroupSeq" value="<c:out value="${item.codeGroupSeq}"/>">
		    		<p>코드그룹 이름</p>
		    		<input type="text" name="codeGroupName" value="<c:out value="${item.codeGroupName}"/>">
		    		<p>코드그룹 사용여부</p>
		    		<select class="form-select" name="codeGroupUseNy" id="codeGroupUseNy">
						<option value="1" <c:if test="${item.codeGroupUseNy eq 1}">selected</c:if>>Y</option>
						<option value="0" <c:if test="${item.codeGroupUseNy eq 0}">selected</c:if>>N</option>
					</select>
		    		<p>코드그룹 삭제여부</p>
		    		<select class="form-select" name="codeGroupDelNy" id="codeGroupDelNy">
						<option value="1" <c:if test="${item.codeGroupDelNy eq 1}">selected</c:if>>Y</option>
						<option value="0" <c:if test="${item.codeGroupDelNy eq 0}">selected</c:if>>N</option>
					</select>
		    		<ul>
		    			<li>등록일: <input type="text" value="<fmt:formatDate value="${item.codeGroupRegDate}" pattern="yyyy-MM-dd"/>"></li>
		    			<li>수정일: <input type="text" value="<fmt:formatDate value="${item.codeGroupRegDate}" pattern="yyyy-MM-dd" />"></li>
		    		</ul>
		    	</div>
		    	<div class='btn-wrap'>
		    	<ul>
		    		<li style="float:left;"><button class="leftColor">del</button></li>
		    		<li style="float:left;"><button class="leftColor">uel</button></li>
		    		<li style="float:right;"><button class="rightColor" id="btnSave">commit</button></li>
		    		<li style="float:right;"><button class="rightColor" id="btnList">list</button></li>
		    	</ul>	    	
		    </div>
	    </form>
	    <form name="formVo"></form>
	    
	    <!-- 스크립트영역 s -->
		<%@include file="../../include/All/JSLink.jsp" %>
		<!-- 스크립트영역 e -->
	    <!-- 스크립트영역 s -->
		<script type="text/javascript">
			var goUrlList = "/bdmin/codeGroupList"; /* #-> */
			var goUrlInst = "/bdmin/codeGroupIsrt"; /* #-> */
			var goUrlUpdt = "/bdmin/codeGroupUpdt"; /* #-> */
	//		var goUrlUele = "/codeGroup/codeGroupUele"; /* #-> */
	//		var goUrlDele = "/codeGroup/codeGroupDele"; /* #-> */
	
			var seq = $("input:text[name=codeGroupSeq]"); /* #-> */
	
			var form = $("form[name=form]");
			$("#btnSave").on("click", function() {
				if (seq.val() == "0" || seq.val() == "") {
					// insert
					//if (validationInst() == false)
					//	return false;
					form.attr("action", goUrlInst).submit();
				} else {
					// update
					/* keyName.val(atob(keyName.val())); */
					//if (validationUpdt() == false)
					//	return false;
					form.attr("action", goUrlUpdt).submit();
				}
			});
			$("#btnList").on("click", function(){
				form.attr("action",goUrlList).submit();
			});
		</script>
	</body>
</html>