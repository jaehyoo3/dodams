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
		<form name="form">
			<input type="hidden" name="codeSeq" value="<c:out value="${item.codeSeq }" />">
		    <!-- 상단 네비게이션/사이드메뉴 s -->
			<%@include file="../../include/Bdmin/sideMenu.jsp" %>
		    <!-- 상단 네비게이션/사이드메뉴 e -->
		    <div class="container">
		    	<div class="form-wrap">
		    		<p>CodeNo <c:out value="${item.codeSeq }" /></p>
		    		<p>코드그룹 *</p>
		    		<select class="select" name='codeGroupSeq'>
						<c:forEach items="${list}" var="list" varStatus="status">
							<c:choose>
								<c:when test="${empty item.codeSeq}">
									<option value="<c:out value="${list.codeGroupSeq }"/>"><c:out value="${list.codeGroupName}"/></option>
								</c:when>
								<c:otherwise>
									<option value="<c:out value="${list.codeGroupSeq }"/>" <c:if test="${list.codeGroupSeq eq item.codeGroupSeq}">selected</c:if>><c:out value="${list.codeGroupName}"/></option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
		    		<p>코드이름 *</p>
		    		<input type="text" id="codeName" name="codeName" value="<c:out value="${item.codeName}" />">
					<p>코드 사용 여부</p>
					<p style='font-size:6px; color:#e0e0e0;'>(설정하지 않을경우 기본값으로 설정됩니다.)</p>
					<select class="select" name="codeUseNy" id="codeUseNy">
						<option value='' <c:if test="${empty item.codeUseNy}">selected</c:if>>설정</option>
						<option value='0' <c:if test="${item.codeUseNy eq 0 }">selected</c:if>>사용하지않기</option>
						<option value='1' <c:if test="${item.codeUseNy eq 1 }">selected</c:if>>사용하기</option>
					</select>
					<p>코드 삭제 여부</p>
					<p style='font-size:6px; color:#e0e0e0;'>(설정하지 않을경우 기본값으로 설정됩니다.)</p>
					<select class="select" name="codeDelNy" id="codeDelNy">
						<option value='' <c:if test="${empty item.codeDelNy}">selected</c:if>>설정</option>
						<option value='0' <c:if test="${item.codeDelNy eq 0 }">selected</c:if>>사용하지않기</option>
						<option value='1' <c:if test="${item.codeDelNy eq 1 }">selected</c:if>>사용하기</option>
					</select>
		    		<ul>
						<li>
						<span>등록일: </span>
							<input type=text value="<fmt:formatDate value="${item.codeRegDate }" pattern="yyyy-MM-dd hh:mm:ss"/>" readonly>
						</li>
						<li>
						<span>수정일: </span>
							<input type=text value="<fmt:formatDate value="${item.codeModDate }" pattern="yyyy-MM-dd hh:mm:ss"/>" readonly>	
						</li>
		    		</ul>
		    	</div>
		    	<div class='btn-wrap'>
		    	<ul>
		    		<li style="float:left;"><button class="leftColor">del</button></li>
		    		<li style="float:left;"><button class="leftColor">uel</button></li>
		    		<li style="float:right;"><button class="rightColor" id='btnSave' >commit</button></li>
		    		<li style="float:right;"><button class="rightColor">list</button></li>
		    	</ul>	    	
		    </div>
	   </form>
	    <!-- 스크립트영역 s -->
		<%@include file="../../include/All/JSLink.jsp" %>
		<!-- 스크립트영역 e -->
		<script type="text/javascript">
			var goUrlInst = "codeInst";
			var goUrlUpdt = "codeUpdt";
			var seq = $("input:hidden[name=codeSeq]");
			var form = $("form[name=form]");
			
			$("#btnSave").on("click", function() {
				if(seq.val() == "0" || seq.val() == "") {
					form.attr("action", goUrlInst).submit();
				} else {
					form.attr("action", goUrlUpdt).submit();
				}
			});
		</script>
	</body>
</html>