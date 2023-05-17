<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<%@ page session="true" %>
<jsp:useBean id="CodeServiceImpl" class="com.dodam.infra.modules.code.CodeServiceImpl"/>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>DODAM</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
	<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
	<meta name="author" content="FREEHTML5.CO" />
<!-- 	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous"> -->
	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">
	<link href='https://fonts.googleapis.com/css?family=Playfair+Display:400,700,400italic,700italic|Merriweather:300,400italic,300italic,400,700italic' rel='stylesheet' type='text/css'>
	<!-- Animate.css -->
	<link rel="stylesheet" href="/resources/css/user/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="/resources/css/user/icomoon.css">
	<!-- Simple Line Icons -->
	<link rel="stylesheet" href="/resources/css/user/simple-line-icons.css">
	<!-- Datetimepicker -->
	<link rel="stylesheet" href="/resources/css/user/bootstrap-datetimepicker.min.css">
	<!-- Flexslider -->
	<link rel="stylesheet" href="/resources/css/user/flexslider.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="/resources/css/user/bootstrap.css">
	<!-- Modernizr JS -->
	<script src="../js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
	<style type="text/css">
	#LikeScore{
		width: 100%;
		height: 100%;
	}
		
	</style>
	<!-- Datepicker -->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	<link rel="stylesheet" href="/resources/css/user/style.css">
	<link rel="stylesheet" href="/resources/css/user/HomeMain.css">
	</head>
	<body>
	<c:set var="listCodeRegion" value="${CodeServiceImpl.selectListCachedCode('1')}"/>
	<c:set var="listCodeTravelTheme" value="${CodeServiceImpl.selectListCachedCode('4')}"/>
	<%@include file="../../include/user/homeNav.jsp"%>
	<div id="fh5co-contact" data-section="Board">
		<div class="container">
			<div class="row text-center fh5co-heading row-padded d-flex justify-content-center">
				<div class="col-md-8 col-md-offset-2">
					<h2 class="heading to-animate">스페이스 검색결과</h2>
					<!-- 검색결과 -->
					<!-- 결과 없을때 -->
					<c:choose>
						<c:when test="${fn:length(keywordList) eq 0 }">
							<p id="search-result" class="sub-heading to-animate d-block">
								<c:if test="${vo.zbskKeywordType eq 1}">
									키워드(
									<c:set var="keywordArray" value="${fn:split(vo.zbskKeywordCode, ',') }" />
									<c:forEach var="keyword" items="${keywordArray}">
										<c:forEach items="${listCodeTravelTheme}" var="listTheme">
											<c:if test="${keyword eq listTheme.codeSeq}">
												<c:if test="${vo.zbskKeywordType eq 1 and keyword eq listTheme.codeSeq}">&nbsp;<c:out value="${listTheme.codeName}"/>&nbsp;</c:if>
											</c:if>
										</c:forEach>
									</c:forEach>
									)
								</c:if>
								<c:if test="${vo.zbskKeywordType eq 2}">
									지역(
									<c:set var="regionArray" value="${fn:split(vo.zbskKeywordCode, ',') }" />
									<c:forEach var="region" items="${regionArray}">
										<c:forEach items="${listCodeRegion}" var="listRegion">
											<c:if test="${region eq listRegion.codeSeq}">
												<c:if test="${vo.zbskKeywordType eq 2 and region eq listRegion.codeSeq}">&nbsp;<c:out value="${listRegion.codeName}"/>&nbsp;</c:if>
											</c:if>
										</c:forEach>
									</c:forEach>
									)
								</c:if>
							로 검색된 결과입니다.
							</p>
							<p class="text-center" colspan="8">검색결과없음</p>
							<p class="sub-heading to-animate d-none">조건에 맞는 스페이스가 없습니다...</p>
						</c:when>
						<%-- <c:when test="${fn:length(keywordList) eq 0 }">
							
						</c:when> --%>
						<c:otherwise>
							<p id="search-result" class="sub-heading to-animate d-block" name="zbskKeywordType"></p>
							<p id="search-result" class="sub-heading to-animate d-block">
								<c:if test="${vo.zbskKeywordType eq 1}">
									키워드(
									<c:set var="keywordArray" value="${fn:split(vo.zbskKeywordCode, ',') }" />
									<c:forEach var="keyword" items="${keywordArray}">
										<c:forEach items="${listCodeTravelTheme}" var="listTheme">
											<c:if test="${keyword eq listTheme.codeSeq}">
												<c:if test="${vo.zbskKeywordType eq 1 and keyword eq listTheme.codeSeq}">&nbsp;<c:out value="${listTheme.codeName}"/>&nbsp;</c:if>
											</c:if>
										</c:forEach>
									</c:forEach>
									)
								</c:if>
								<c:if test="${vo.zbskKeywordType eq 2}">
									지역(
									<c:set var="regionArray" value="${fn:split(vo.zbskKeywordCode, ',') }" />
									<c:forEach var="region" items="${regionArray}">
										<c:forEach items="${listCodeRegion}" var="listRegion" varStatus="regionStatus">
											<c:if test="${region eq listRegion.codeSeq}">
												<c:if test="${vo.zbskKeywordType eq 2 and region eq listRegion.codeSeq}">&nbsp;<c:out value="${listRegion.codeName}"/>&nbsp;</c:if>
											</c:if>
										</c:forEach>
									</c:forEach>
									)
								</c:if>
							로 검색된 결과입니다.
							</p>
							<label for="search-result"><p class="sub-heading to-animate d-block">총 <c:out value="${resultCount}"/>개의 스페이스가 검색되었습니다.</p></label>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<form action="/searchResult" method="get">
				<div class="d-flex justify-content-center">
					<button class="to-animate-2 btn btn-primary shadow w-25 fs-5" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample">다른 키워드 검색</button>
				</div>
				<div class="collapse" id="collapseExample">
					<div class="card card-body border-0 to-animate-2">
						<!-- search box sector 221021 s -->
						<div class="row rounded-5 p-5 shadow">
							<!-- <div class="col-md-6 to-animate-2"> -->
							<div class="radio d-flex justify-content-end">
								<input type="radio" id="kategory" name="zbskKeywordType" value="1" checked="checked"><label for="kategory" class="radio-label me-4">키워드로 검색</label>
								<input type="radio" id="region" name="zbskKeywordType" value="2"><label for="region" class="radio-label">지역으로 검색</label>
							</div>
							<div class="col-md-12 to-animate-2 mb-5" id="kategoryBox">
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
								<button type="submit" class="btn btn-primary shadow w-25">스페이스 보러가기</button>
							</div>
						</div>
						<!-- search box sector 221021 e -->
						</div>
					</div>
				</form>
			</div>

		<!-- c:foreach 사용예정 -->
		<div class="container">
			<form name="boardList" method="get">
				<input type="hidden" name="zbspSeq">
				<c:forEach items="${spaceList}" var="spaceList">
				<c:forEach items="${keywordList}" var="keywordList">
						<c:forEach items="${likeScoreList}" var="likeScoreList">
							<c:if test="${keywordList.zbspSeq eq spaceList.zbspSeq and likeScoreList.zbspSeq eq spaceList.zbspSeq}">
								<div class="row rounded-5 p-5 m-5 shadow to-animate">
									<div class="row to-animate mt-3 mb-3">
										<div class="col-md-6">
											<h4 class="heading to-animate" style="cursor: pointer;"><a onclick="location.href='javascript:gospace(<c:out value="${spaceList.zbspSeq}"/>)'"><c:out value="${spaceList.zbspName}"/></a></h4>
										</div>
										<div class="col-md-2">여행인원</div>
										<div class="col-md-4"><c:out value="${spaceList.xAdminUser}"/>등 <c:out value="${spaceList.xSpaceUser}"/> 명</div>
									</div>
									<div class="row to-animate mt-3 mb-3">
										<div class="col-2">
											<p class="sub-heading to-animate d-block h5">여행 테마</p>
										</div>
										<div class="col-md-4">	
											<c:forEach items="${keywordListMatch}" var="keywordListMatch">
												<c:if test="${keywordListMatch.zbspSeq eq spaceList.zbspSeq}">
													<c:if test="${keywordListMatch.zbskKeywordType eq 1}">
														<c:forEach items="${listCodeTravelTheme}" var="listTravelTheme" varStatus="statusTravelTheme">
																<c:if test="${keywordListMatch.zbskKeywordCode eq listTravelTheme.codeSeq}">
																	<label class="listitemB">
																		<c:if test="${listTravelTheme.codeSeq eq 26}">
																			<img class="a" src="https://cdn-icons-png.flaticon.com/512/6774/6774898.png">
																		</c:if>
																		<c:if test="${listTravelTheme.codeSeq eq 27}">
																			<img class="a" src="https://cdn-icons-png.flaticon.com/512/2271/2271062.png">
																		</c:if>
																		<c:if test="${listTravelTheme.codeSeq eq 28}">
																			<img class="a" src="https://cdn-icons-png.flaticon.com/512/6030/6030435.png">
																		</c:if>
																		<c:if test="${listTravelTheme.codeSeq eq 29}">
																			<img class="a"src="https://cdn-icons-png.flaticon.com/512/5267/5267302.png">
																		</c:if>
																	</label>
																</c:if>
														</c:forEach>
													</c:if>
												</c:if>
											</c:forEach>
										</div>
										<div class="col-2">
											<p class="sub-heading to-animate h5">여행 장소</p>
										</div>
										<div class="col-md-4">
											<c:forEach items="${keywordListMatch}" var="keywordListMatch">
												<c:if test="${keywordListMatch.zbspSeq eq spaceList.zbspSeq}">
													<c:if test="${keywordListMatch.zbskKeywordType eq 2}">
														<span class="space-tag shadow-sm me-2">
															<c:forEach items="${listCodeRegion}" var="listRegion" varStatus="statusRegion">
																<c:if test="${keywordListMatch.zbskKeywordCode eq listRegion.codeSeq}"><c:out value="${listRegion.codeName }"/></c:if>
															</c:forEach>
														</span>
													</c:if>
												</c:if>
											</c:forEach>
										</div>
									</div>
									<div class="row to-animate">
										<div class="col-md-6">
											<span>총 추억<c:out value="${spaceList.xTravelFlag}"/>개</span>
										</div>
										<div class="col-md-2">
											<span>스페이스 만족도</span>
										</div>
										<div class="col-md-4">
											<div class="progress border shadow-sm">
												<progress class="bg-success" id="LikeScore" value="${likeScoreList.xLikeAvg}" max="100"></progress>
											</div>
											<div class="col-2 justify-content-end" style="font-size: 0.8rem;">
												<span>
													<c:out value="${likeScoreList.xLikeAvg}"/>%
												</span>
											</div>
										</div>
									</div>
								</div>
								</c:if>
							</c:forEach>
					</c:forEach>
				</c:forEach>
			</form>
		</div>
			<!-- c:foreach 사용예정 -->
			<!-- search result sector 221021 e -->
			<!-- container close 221021 -->
	</div>

	<!-- jQuery -->
	<script src="resources/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="resources/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="resources/js/bootstrap.min.js"></script>
	<!-- Bootstrap DateTimePicker -->
	<script src="resources/js/moment.js"></script>
	<script src="resources/js/bootstrap-datetimepicker.min.js"></script>
	<!-- Waypoints -->
	<script src="resources/js/jquery.waypoints.min.js"></script>
	<!-- Stellar Parallax -->
	<script src="resources/js/jquery.stellar.min.js"></script>

	<!-- Flexslider -->
	<script src="../js/jquery.flexslider-min.js"></script>
	<script type="text/javascript">
	var goUrlSpace = "/spaceMain";
	var form = $("form[name=boardList]");
	var seq = $("input:hidden[name=zbspSeq]");
	function gospace(keyValue){
   		seq.val(keyValue);
		form.attr("action",goUrlSpace).submit();
	}
	function submit() {
		var good = $('#likeScore').val();
		$( '#aa' ).css('width',good+'%');
	}
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
	/* 	$(function () {
	       $('#date').datetimepicker();
	   }); */
	</script>
	<!-- Main JS -->
	<script src="../js/main.js"></script>
	</body>
</html>

