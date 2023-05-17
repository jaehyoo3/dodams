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
	</head>
	<body>
		<form name="form">
		    <input type="hidden" name="codeSeq">
			<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage}" default="1"/>">
			<input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow}"/>">
			<input type="hidden" name="checkboxSeqArray">
		    <!-- 상단 네비게이션/사이드메뉴 s -->
			<%@include file="../../include/Bdmin/sideMenu.jsp" %>
		    <!-- 상단 네비게이션/사이드메뉴 e -->
		    <div class="container">
		        <div class="search_wrap">
		            <ul class="search_item_top">
		                <li>
		                <select name="shUseNy" id="codeUseNy">
	                        <option value=""  <c:if test="${empty vo.shUseNy}">selected</c:if>>사용여부</option>
	                        <option value="2" <c:if test="${vo.shUseNy eq 2}">selected</c:if>>all</option>
	                        <option value="1" <c:if test="${vo.shUseNy eq 1}">selected</c:if>>Y</option>
	                        <option value="0" <c:if test="${vo.shUseNy eq 0}">selected</c:if>>N</option>
	                    </select>
		                </li>
		                <li>
		                <select name="shDelNy" id="codeDelNy">
	                        <option value=""  <c:if test="${empty vo.shDelNy}">selected</c:if>>삭제여부</option>
	                        <option value="2" <c:if test="${vo.shDelNy eq 2}">selected</c:if>>all</option>
	                        <option value="1" <c:if test="${vo.shDelNy eq 1}">selected</c:if>>Y</option>
	                        <option value="0" <c:if test="${vo.shDelNy eq 0}">selected</c:if>>N</option>
	                    </select>
		                </li>
		                <li>
		                    <input type="text" id="startDate">
		                </li>
		                <li>
		                    <input type="text" id="endDate"><br>
		                </li>
		            </ul>
		            <ul class="search_item_bottom">
		                <li>
		                	<select name="shOption" id="shOption">
	                    		<option value=""  <c:if test="${empty vo.shOption}">selected</c:if>>검색조건</option>
	                    		<option value="1" <c:if test="${vo.shOption eq 1}">selected</c:if>>코드번호</option>
	                    		<option value="2" <c:if test="${vo.shOption eq 2}">selected</c:if>>코드이름</option>
	                    		<option value="3" <c:if test="${vo.shOption eq 2}">selected</c:if>>코드그룹번호</option>
	                    		<option value="4" <c:if test="${vo.shOption eq 2}">selected</c:if>>코드그룹이름</option>
	               			</select>
		                </li>
		                <li>
		                <input type="text" name="shValue">
		                </li>
		                <li>
		                	<button type="button" id="search"><i class="fa-brands fa-searchengin"></i></button>
		               		<button type="button" id="btnReset"><i class="fa-solid fa-arrow-rotate-right"></i></button>
		                </li>
		            </ul>
		        </div>
		        <div class="tablelist">
		            <table>
		                <tr>
	                 	<th class="num"><input type="checkbox"></th>
	                    <th class="num">#</th>
	                    <th class="codename">코드Seq</th>
	                    <th class="codename">코드명</th>
	                    <th class="codename">코드그룹명</th>
	                    <th class="num">사용여부</th>
	                    <th class="num">삭제여부</th>
	                    <th class="codename">등록일</th>
	                    <th class="codename">수정일</th>
		                </tr>
		                <c:forEach items="${list}" var="list" varStatus="status">
			                <tr onclick="javascript:goForm(<c:out value="${list.codeSeq }"/>)" style="cursor:hand">
			                    <td><input type="checkbox"></td>
			                    <td></td>
								<td><c:out value="${list.codeSeq }"/></td>
								<td><c:out value="${list.codeName }"/></td>
								<td><c:out value="${list.codeGroupName }"/></td>
								<td><c:out value="${list.codeUseNy }"/></td>
								<td><c:out value="${list.codeDelNy }"/></td>
								<td><fmt:formatDate value="${list.codeRegDate }" pattern="yyyy-MM-dd hh:mm:ss"/></td>
								<td><fmt:formatDate value="${list.codeModDate }" pattern="yyyy-MM-dd hh:mm:ss"/></td>
			                </tr>
			            </c:forEach>
		            </table>
		        </div>
		        <div class="button_wrap">
		            <button class="btn_delete" type="button"><i class="fa-regular fa-trash-can"></i></button>
		            <%@include file="../../include/Bdmin/pagination.jsp" %>   
		            <button class="btn_reg" onClick="location.href='CodeForm'"><i class="fa-solid fa-folder-plus"></i></button>
		        </div>
		    </div>
	    </form>
    <!-- 스크립트영역 s -->
		<%@include file="../../include/All/JSLink.jsp" %>
	<!-- 스크립트영역 e -->
	<script type="text/javascript">
		var goUrlList = "/bdmin/CodeList";
		var goUrlForm = "/bdmin/CodeForm";
		var form = $("form[name=form]")
		var seq = $("input:hidden[name=codeSeq]");
		
		goList = function(thisPage) {
			$("input:hidden[name=thisPage]").val(thisPage);
			form.attr("action", goUrlList).submit();
		}
		
		goForm = function(keyValue) {
	    	seq.val(keyValue);
			form.attr("action", goUrlForm).submit();
		}
		
		$("#btnReset").on("click", function() {
			$(location).attr("href",goUrlList);
		}); 
		
		$('#btnForm').on("click", function() {
			goForm(0);                
		});
		
		$("#search").on("click", function(){
			form.attr("action", goUrlList).submit();
		});
	</script>
	
	
	
	</body>
</html>