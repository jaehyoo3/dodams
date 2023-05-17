<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<%@ page session="true" %>


<!DOCTYPE html>

<html class="no-js">
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>DODAM</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
	<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
	<meta name="author" content="FREEHTML5.CO" />


	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">

	<link href='https://fonts.googleapis.com/css?family=Playfair+Display:400,700,400italic,700italic|Merriweather:300,400italic,300italic,400,700italic' rel='stylesheet' type='text/css'>
	
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="/resources/css/user/bootstrap.css">


	
	
	<!-- Datepicker -->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	<!-- 공통코드 -->
	<jsp:useBean id="CodeServiceImpl" class="com.dodam.infra.modules.code.CodeServiceImpl"/>
	<link rel="stylesheet" href="/resources/css/user/style.css">
	<link rel="stylesheet" href="/resources/css/user/BoardMain.css">
	</head>
	<body>
	<form action="/searchResult" method="get">
		<c:set var="listCodeRegion" value="${CodeServiceImpl.selectListCachedCode('1')}"/>
		<c:set var="listCodeTravelTheme" value="${CodeServiceImpl.selectListCachedCode('4')}"/>
		<%@include file="../../include/user/homeNav.jsp"%>
			<div id="fh5co-contact" data-section="Board">
				<div class="container">
					<div class="row text-center fh5co-heading row-padded d-flex justify-content-center">
						<div class="col-md-8 col-md-offset-2">
							<h2 class="heading to-animate">스페이스 게시판</h2>
							<p class="sub-heading to-animate">다른 그룹의 추억을 보시려면 키워드를 선택하세요</p>
							<p class="sub-heading to-animate">키워드는 여러개 선택 가능합니다</p>
						</div>
						<!-- <input type="text" id="showFilter"/> -->
					</div>
					<div class="row rounded-5 p-5 shadow to-animate-2">
						<div class="radio d-flex justify-content-end">
							<input type="radio" id="kategory" name="zbskKeywordType" value="1" checked="checked"><label for="kategory" class="radio-label me-4">키워드로 검색</label>
							<input type="radio" id="region" name="zbskKeywordType" value="2"><label for="region" class="radio-label">지역으로 검색</label>
						</div>
						<!-- <div class="col-md-6 to-animate-2"> -->
						<div class="col-md-12 mb-5 to-animate-2" id="kategoryBox">
							<h3>여행 테마 선택</h3>
							<div class="row to-animate-1 border rounded-5 p-5 shadow">
								<div class="tag-group d-flex justify-content-center" role="group1">
									<c:forEach items="${listCodeTravelTheme}" var="listTravelTheme" varStatus="statusTravelTheme">
										<li class="itemown me-5">
											<input type="checkbox" class="btn-check" name="zbskKeywordCode" 
													id="<c:out value="${listTravelTheme.codeSeq}"/>" 
													value="<c:out value="${listTravelTheme.codeSeq}"/>"
													>
											<label class="listitem" for="<c:out value="${listTravelTheme.codeSeq}"/>">
												<c:if test="${listTravelTheme.codeSeq eq 26}">
													<img src="https://cdn-icons-png.flaticon.com/512/6774/6774898.png">
												</c:if>
												<c:if test="${listTravelTheme.codeSeq eq 27}">
													<img src="https://cdn-icons-png.flaticon.com/512/2271/2271062.png">
												</c:if>
												<c:if test="${listTravelTheme.codeSeq eq 28}">
													<img src="https://cdn-icons-png.flaticon.com/512/6030/6030435.png">
												</c:if>
												<c:if test="${listTravelTheme.codeSeq eq 29}">
													<img src="https://cdn-icons-png.flaticon.com/512/5267/5267302.png">
												</c:if>
											</label>
											<p class="h6 text-center mt-3"><c:out value="${listTravelTheme.codeName}"/></p>
										</li>
									</c:forEach>
									<!-- <input type="checkbox" class="btn-check" id="test2" autocomplete="off">
									<label class="btn btn-tag shadow" for="test2"><i class="theme-tag icon-social-dropbox"></i>액티비티</label>
		
									<input type="checkbox" class="btn-check" id="test3" autocomplete="off">
									<label class="btn btn-tag shadow" for="test3"><i class="theme-tag icon-social-dropbox"></i>호캉스</label>
									
									<input type="checkbox" class="btn-check" id="test4" autocomplete="off">
									<label class="btn btn-tag shadow" for="test4"><i class="theme-tag icon-social-dropbox"></i>반려동물</label> -->
								</div>
							</div>
						</div>
						<div class="col-md-12 to-animate-2 mb-5" id="regionBox">
							<h3>여행 지역 선택</h3>
							<div class="row to-animate-1 border rounded-5 p-5 shadow">
								<div class="region-group d-flex justify-content-center" role="group2">
									<c:forEach items="${listCodeRegion}" var="listRegion" varStatus="statusRegion">
										<input type="checkbox" class="btn-check" name="zbskKeywordCode" 
												id="<c:out value="${listRegion.codeSeq}"/>" 
												value="<c:out value="${listRegion.codeSeq}"/>">
										<label class="btn btn-tag" for="<c:out value="${listRegion.codeSeq}"/>"><c:out value="${listRegion.codeName}"/></label>
									</c:forEach>
								</div>
								<!-- <div class="region-group d-flex justify-content-center" role="group3">
		
									<input type="checkbox" class="btn-check" id="btncheck8">
									<label class="btn btn-tag" for="btncheck8">경북</label>
		
									<input type="checkbox" class="btn-check" id="btncheck9">
									<label class="btn btn-tag" for="btncheck9">경남</label>
		
									<input type="checkbox" class="btn-check" id="btncheck10">
									<label class="btn btn-tag" for="btncheck10">전북</label>
		
									<input type="checkbox" class="btn-check" id="btncheck11">
									<label class="btn btn-tag" for="btncheck11">전남</label>
		
									<input type="checkbox" class="btn-check" id="btncheck12">
									<label class="btn btn-tag" for="btncheck12">충북</label>
		
									<input type="checkbox" class="btn-check" id="btncheck13">
									<label class="btn btn-tag" for="btncheck13">충남</label>
		
									<input type="checkbox" class="btn-check" id="btncheck14">
									<label class="btn btn-tag" for="btncheck14">제주</label>
								</div> -->
							</div>
						</div>
						<div class="col-md-12 to-animate-2 d-flex justify-content-center">
							<button class="btn btn-primary fs-5 shadow w-25" onclick="submit">스페이스 보러가기</button>
						</div>
					</div>
				</div>
			</div>
	</form>
	<form>
		
	</form>
	<script type="text/javascript">
	    //필터 내용을 저장하는 function
	    $(document).ready(function() {
	    	$('#regionBox').hide();
		    $("input[name=zbskKeywordType]").change(function(){
		    	$('#showFilter').val('');
		    	var chooseV = $(this).val();
		    	$('#showCV').val('');
		    	$("#showCV").val(chooseV)
		    	$("input:checkbox[name='zbskKeywordCode']").prop("checked", false);
		    	if(chooseV == 1){
		    		$('#kategoryBox').show();
		    		$('#regionBox').hide();
		    	} else if(chooseV == 2){
		    		$('#kategoryBox').hide();
		    		$('#regionBox').show();
		    	}
		    });
	    });
	</script>
	</body>
</html>

