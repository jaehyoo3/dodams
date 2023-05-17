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
	    <!-- 상단 네비게이션/사이드메뉴 s -->
		<%@include file="../../include/Bdmin/sideMenu.jsp" %>
	    <!-- 상단 네비게이션/사이드메뉴 e -->
	    <div class="container">
	    	<form method="get" name="formList" id="formList">
	    		<input type="hidden" name="codeGroupSeq">
				<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage}" default="1"/>">
				<input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow}"/>">
				<input type="hidden" name="checkboxSeqArray">
	        <div class="search_wrap">
	            <ul class="search_item_top">
	                <li>
	                    <select name="shUseNy" id="codeGroupUseNy">
	                        <option value=""  <c:if test="${empty vo.shUseNy}">selected</c:if>>사용여부</option>
	                        <option value="2" <c:if test="${vo.shUseNy eq 2}">selected</c:if>>all</option>
	                        <option value="1" <c:if test="${vo.shUseNy eq 1}">selected</c:if>>Y</option>
	                        <option value="0" <c:if test="${vo.shUseNy eq 0}">selected</c:if>>N</option>
	                    </select>
	                </li>
	                <li>
	                    <select name="shDelNy" id="codeGroupDelNy">
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
	                    <option value="2" <c:if test="${vo.shOption eq 2}">selected</c:if>>코드그룹명(한글)</option>
	                </select>
	                </li>
	                <li>
	               		<input type="text" placeholder="검색어를 입력해주세요." name="shValue" id="shValue" value="<c:out value="${vo.shValue }"/>">
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
	                    <th class="codename">코드그룹명</th>
	                    <th class="num">코드수</th>
	                    <th class="num">사용여부</th>
	                    <th class="num">삭제여부</th>
	                    <th class="codename">등록일</th>
	                    <th class="codename">수정일</th>
	                </tr>
	                <c:choose>
	                	<c:when test="${fn:length(list) eq 0 }">
							<tr>
								<td class="text-center" colspan="8">없음</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list}" var="list" varStatus="status">
				                <tr onclick="location.href='javascript:goForm(<c:out value="${list.codeGroupSeq}"/>)'" style="cursor: pointer;">
				                    <td><input type="checkbox"></td>
				                    <td><c:out value="${list.codeGroupSeq}" /></td>
				                    <td><c:out value="${list.codeGroupName}" /></td>
				                    <td><c:out value="${list.codeCount}" /></td>
				                    <td><c:out value="${list.codeGroupUseNy}" /></td>
				                    <td><c:out value="${list.codeGroupDelNy}" /></td>
				                    <td><fmt:formatDate value="${list.codeGroupRegDate}" pattern="yyyy-MM-dd" /></td>
				                    <td><fmt:formatDate value="${list.codeGroupModDate}" pattern="yyyy-MM-dd" /></td>
		                		</tr>
		                	</c:forEach>
		                </c:otherwise>
	                </c:choose>
	            </table>
	        </div>
	        <div class="button_wrap">
	            <button class="btn_delete" type="button"><i class="fa-regular fa-trash-can"></i></button>
	            <%@include file="../../include/Bdmin/pagination.jsp" %>
	            <button class="btn_reg" onClick="location.href='CodeGroupForm'" id="btnForm"><i class="fa-solid fa-folder-plus"></i></button>
	        </div>
		</form>
    </div>
    <!-- 스크립트영역 s -->
		<%@include file="../../include/All/JSLink.jsp" %>
	<!-- 스크립트영역 e -->
	
	    <script>
	    
	    /* 달력 */
	    $(document).ready(function () {
	            $.datepicker.setDefaults($.datepicker.regional['ko']);
	            $( "#startDate" ).datepicker({
	                changeMonth: true,
	                changeYear: true,
	                nextText: '다음 달',
	                prevText: '이전 달',
	                dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	                dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	                monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	                monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	                dateFormat: "yy-mm-dd",
	                 /* maxDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가) */
	                onClose: function( selectedDate ) {
	                      //시작일(startDate) datepicker가 닫힐때
	                      //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
	                    $("#endDate").datepicker( "option", "minDate", selectedDate );
	                }
	            });
	            $( "#endDate" ).datepicker({
	                changeMonth: true,
	                changeYear: true,
	                nextText: '다음 달',
	                prevText: '이전 달',
	                dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	                dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	                monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	                monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	                dateFormat: "yy-mm-dd",
	                 /* maxDate: 0,                       // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가) */
	                onClose: function( selectedDate ) {
	                     // 종료일(endDate) datepicker가 닫힐때
	                     // 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
	                    $("#startDate").datepicker( "option", "maxDate", selectedDate );
	                }
	            });
	    });
	</script>
	<script type="text/javascript">
	var goUrlList = "/bdmin/codeGroupList"; /* #-> */
	var goUrlForm = "/bdmin/codeGroupForm";
	var seq = $("input:hidden[name=codeGroupSeq]");
	var form = $("form[name=formList]");
	
	
	goList = function(thisPage) {
		$("input:hidden[name=thisPage]").val(thisPage);
		form.attr("action", goUrlList).submit();
	}
	
	$('#btnForm').on("click", function() {
		goForm(0);                
	});
	
	$("#btnReset").on("click", function() {
		$(location).attr("href",goUrlList);
	}); 
	
	$("#search").on("click", function(){
		form.attr("action", goUrlList).submit();
	});
	
	goForm = function(keyValue) {
    	seq.val(keyValue);
		form.attr("action", goUrlForm).submit();
	}
	
	</script>
	
	
	
	</body>
</html>