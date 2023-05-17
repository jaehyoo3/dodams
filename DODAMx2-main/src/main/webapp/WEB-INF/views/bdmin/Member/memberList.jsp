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
		<input type="hidden" name="zbmmSeq">
		<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage}" default="1"/>">
		<input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow}"/>">
	    <!-- 상단 네비게이션/사이드메뉴 s -->
		<%@include file="../../include/Bdmin/sideMenu.jsp" %>
	    <!-- 상단 네비게이션/사이드메뉴 e -->
	    <div class="container">
	        <div class="search_wrap">
	            <ul class="search_item_top">
	                <li>
	                    <select name="shDelNy" id="shDelNy">
                			<option value="" <c:if test="${empty vo.shDelNy}">selected</c:if>>삭제여부</option>
                			<option value='2' <c:if test="${vo.shDelNy eq 2}">selected</c:if>>전체</option>
							<option value='0' <c:if test="${vo.shDelNy eq 0}">selected</c:if>>N</option>
							<option value='1' <c:if test="${vo.shDelNy eq 1}">selected</c:if>>Y</option>
            			</select>
	                </li>
	                <li>
	                    <select name="zbmmSocialType" id="zbmmSocialType">
                			<option value="" <c:if test="${empty vo.zbmmSocialType}">selected</c:if>>SNS구분</option>
							<option value='0' <c:if test="${vo.zbmmSocialType eq 0}">selected</c:if>>일반</option>
							<option value='2' <c:if test="${vo.zbmmSocialType eq 2}">selected</c:if>>네이버</option>
							<option value='1' <c:if test="${vo.zbmmSocialType eq 1}">selected</c:if>>카카오</option>
            			</select>
	                </li>
	                <li>
	                    <input type="text" id="startDate" placeholder="가입기간 시작" name="startDate" value="<c:out value="${vo.startDate}"/>">
	                </li>
	                <li>
	                    <input type="text" id="endDate" placeholder="가입기간 종료" name="endDate" value="<c:out value="${vo.endDate}"/>"><br>
	                </li>
	            </ul>
	            <ul class="search_item_bottom">
	                <li>
		                <select name="shOption" id="shOption">
	                		<option value=""<c:if test="${empty vo.shOption}">selected</c:if>>검색조건</option>
	                		<option value="1"<c:if test="${vo.shOption eq 1}">selected</c:if>>회회원번호</option>
	                		<option value="2"<c:if test="${vo.shOption eq 2}">selected</c:if>>유저아이디</option>
	                		<option value="3"<c:if test="${vo.shOption eq 3}">selected</c:if>>유저이름</option>
	            		</select>
	                </li>
	                <li>
	                	<input type="text" value="<c:out value="${vo.shValue }"/>" id="shValue" name="shValue" placeholder="검색어를 입력해주세요.">
	                </li>
	                <li>
	                	<button type="button" id="btnSearch"><i class="fa-brands fa-searchengin"></i></button>
	                	<button type="button" id="btnReset"><i class="fa-solid fa-arrow-rotate-right"></i></button>
	                </li>
	            </ul>
	        </div>

	        <div class="tablelist">
	            <table>
	                <tr>
	                    <th class="num"><input type="checkbox"></th>
	                    <th class="num">멤버번호</th>
	                    <th class="codename">아이디</th>
	                    <th class="codename">이름</th>
	                    <th class="codename">이메일</th>
	                    <th class="num">SNS구분</th>
	                    <th class="num">삭제여부</th>
	                    <th class="codename">가입일</th>
	                    <th class="codename">삭제일</th>
	                </tr>
	                <c:choose>
		                <c:when test="${fn:length(list) eq 0}">
							<tr>
								<td colspan="11">검색결과가 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>	
							<c:forEach items="${list}" var="list" varStatus="status">
				                <tr onclick="javascript:goForm(<c:out value="${list.zbmmSeq }"/>)" style="cursor:pointer">
				                    <td><input type="checkbox"></td>
				                    <td><c:out value="${list.zbmmSeq }"/></td>
				                    <td><c:out value="${list.zbmmID }"/></td>
				                    <td><c:out value="${list.zbmmName }"/></td>
				                    <td><c:out value="${list.zbmmEmail }"/></td>
				                    <td><c:out value="${list.zbmmSocialType }"/></td>
				                    <td><c:out value="${list.zbmmDelNy }"/></td>
				                    <td><fmt:formatDate value="${list.zbmmRegDate }" pattern="yyyy-MM-dd hh:mm:ss"/></td>
									<%-- <td><fmt:formatDate value="${list.codeModDate }" pattern="yyyy-MM-dd hh:mm:ss"/></td> --%>
				                </tr>
		                	</c:forEach>
                		</c:otherwise>
	        		</c:choose> 
	            </table>
	        </div>
	        <div class="button_wrap">
	            <button class="btn_delete" type="button"><i class="fa-regular fa-trash-can"></i></button>
	            <%@include file="../../include/Bdmin/pagination.jsp" %> 
	            <button class="btn_reg" id="btnForm"><i class="fa-solid fa-folder-plus"></i></button>
	        </div>
	    </div>
	    </form>
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
	    
	    var seq = $("input:hidden[name=zbmmSeq]");
	    var goUrlList = "MemberList";
	    var goUrlForm = "MemberForm";
	    var form = $("form[name=form]");
	    
	  //selectOne 
	    goForm = function(keyValue) {
    	/* if(keyValue != 0) seq.val(btoa(keyValue)); */
    	seq.val(keyValue);
		form.attr("action", goUrlForm).submit();
		}
	    
	  //멤버 생성
	  	$("#btnForm").on("click", function() {
		goForm(0);                
		});
	  
	  //pagination
	  	goList = function(thisPage) {
		$("input:hidden[name=thisPage]").val(thisPage);
		form.attr("action", goUrlList).submit();
		}
		
	  	$("#btnReset").on("click", function() {
			$(location).attr("href",goUrlList);
		});  
		
		$("#btnSearch").on("click", function(){
			form.attr("action", goUrlList).submit();
		});

	</script>
	
</body>
</html>