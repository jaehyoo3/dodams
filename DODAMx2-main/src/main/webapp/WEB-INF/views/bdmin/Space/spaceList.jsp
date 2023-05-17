<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/bdmin/bdmin.css">
<title>DoDam.X2</title>
</head>
<body>
<form name="form">
	<input type="hidden" name="zbspSeq">
	<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage}" default="1"/>">
	<input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow}"/>">
	<!-- 상단 네비게이션/사이드메뉴 s -->
	<%@include file="../../include/Bdmin/sideMenu.jsp" %>
	    <!-- 상단 네비게이션/사이드메뉴 e -->
	    <div class="container">
	        <div class="search_wrap">
	            <ul class="search_item_top">
	                <li>
		                <select name="zbspShareNy" id="zbspShareNy">
	                        <option value=""  <c:if test="${empty vo.zbspShareNy}">selected</c:if>>공유여부</option>
	                        <option value="2" <c:if test="${vo.zbspShareNy eq 2}">selected</c:if>>all</option>
	                        <option value="1" <c:if test="${vo.zbspShareNy eq 1}">selected</c:if>>Y</option>
	                        <option value="0" <c:if test="${vo.zbspShareNy eq 0}">selected</c:if>>N</option>
	                    </select>
	                </li>
	                <li>
		                <select name="zbspEndNy" id="zbspEndNy">
	                        <option value=""  <c:if test="${empty vo.zbspEndNy}">selected</c:if>>진행여부</option>
	                        <option value="2" <c:if test="${vo.zbspEndNy eq 2}">selected</c:if>>all</option>
	                        <option value="1" <c:if test="${vo.zbspEndNy eq 1}">selected</c:if>>종료</option>
	                        <option value="0" <c:if test="${vo.zbspEndNy eq 0}">selected</c:if>>진행중</option>
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
                   		<option value="1" <c:if test="${vo.shOption eq 1}">selected</c:if>>스페이스번호</option>
                   		<option value="2" <c:if test="${vo.shOption eq 2}">selected</c:if>>스페이스이름</option>
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
	                    <th class="codename">스페이스명</th>
	                    <th class="codename">호스트</th>
	                    <th class="num">참여인원</th>
	                    <th class="num">종료여부</th>
	                    <th class="num">삭제여부</th>
	                    <th class="num">공유여부</th>
	                    <th class="codename">생성일</th>
	                </tr>
	                
	                <c:forEach items="${list}" var="list" varStatus="status">
	                <tr>
	                    <td><input type="checkbox"></td>
	                    <td><c:out value="${list.zbspSeq }" /></td>
	                    <td><c:out value="${list.zbspName }" /></td>
	                    <td><c:out value="${list.xAdminUser }" /></td>
	                    <td><c:out value="${list.xSpaceUser }" /></td>
	                    <td><c:if test="${list.zbspEndNy eq 0}"><c:out value="진행중" /></c:if> <c:if test="${list.zbspEndNy eq 1}"><c:out value="종료됨" /></c:if></td>
	                    <td><c:if test="${list.zbspDelNy eq 0}"><c:out value="No" /></c:if> <c:if test="${list.zbspDelNy eq 1}"><c:out value="Yes" /></c:if></td>
	                    <td><c:if test="${list.zbspShareNy eq 0}"><c:out value="No" /></c:if> <c:if test="${list.zbspShareNy eq 1}"><c:out value="Yes" /></c:if></td>
	                    <td><fmt:formatDate value="${list.zbspRegDate }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
	                </tr>
	                </c:forEach>
	            </table>
	        </div>
	        <div class="button_wrap">
	            <button class="btn_delete" type="button"><i class="fa-regular fa-trash-can"></i></button>
	            <%@include file="../../include/Bdmin/pagination.jsp"%>     
	            <button class="btn_reg" id="btnForm"><i class="fa-solid fa-folder-plus"></i></button>
	        </div>
	    </div>
	 </form>
    <!-- 스크립트영역 s -->
		<%@include file="../../include/All/JSLink.jsp" %>
	<!-- 스크립트영역 e -->
	    <script>
	    var goUrlList = "/bdmin/spaceList";
		var goUrlForm = "/bdmin/spaceForm";
		var form = $("form[name=form]")
		var seq = $("input:hidden[name=zbspSeq]");
		
		goList = function(thisPage) {
			$("input:hidden[name=thisPage]").val(thisPage);
			form.attr("action", goUrlList).submit();
		}
		
		goForm = function(keyValue) {
	    	seq.val(keyValue);
			form.attr("action", goUrlForm).submit();
		}
		
		$('#btnForm').on("click", function() {
			goForm(0);                
		});
		
		$("#search").on("click", function(){
			form.attr("action", goUrlList).submit();
		});
		
		$("#btnReset").on("click", function() {
			$(location).attr("href",goUrlList);
		}); 
	    
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
	
	</body>
</html>