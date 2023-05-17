<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<%@ page session="true"%>
<jsp:useBean id="CodeServiceImpl" class="com.dodam.infra.modules.code.CodeServiceImpl" />
<html>
	<head>
		<meta charset="uTF-8"> 
		<meta name ="viewport" content="width=device-width, initial-scaLe=1.0">
        <link rel="stylesheet" href="/resources/css/user/space.css">
        
		<title></title>
	</head>
	<body>
	<form id="form">
	<%@include file="../../include/user/spaceHeader.jsp"%>
        <div class="container">
	<%@include file="../../include/user/spaceSideBar.jsp"%>
	<c:set var="listCodeRegion" value="${CodeServiceImpl.selectListCachedCode('1')}" />
	<c:set var="listCodeThemes" value="${CodeServiceImpl.selectListCachedCode('4')}" />
            <div class="table-Wrap">
            <!-- 계획영역s -->
            <div class="flag-Wrap">
                <div class="sapaceInfo">
                     <div class="space-profile">
                         <img src="https://cdn-icons-png.flaticon.com/512/3049/3049617.png" alt="">
                     </div>
                     <ul class="space-content">
                      
                         <li class="info-space"><c:out value="${item.zbspName }"/></li>
                         <li class="info-dday"><c:if test="${item.xDdayBefore lt 0 and item.zbspEndNy eq 0}"><p>D-<c:out value="${item.xDdayBefore }"/>일</p></c:if>
        <c:if test="${item.xDdayBefore eq 0 and item.zbspEndNy eq 0}"><p style="color: light-green;">D-DAY</p></c:if>
		<%-- <c:if test="${item.xDdayBefore gt 0 and item.xDdayEnd lt 0">
			<p>여행 <c:out value="${item.xDdayBefore }"/> 일차</p>
		</c:if> --%>
        <c:if test="${item.xDdayEnd eq 0 }"><p style="color: yellow;">여행 마지막일</p></c:if>
        <c:if test="${item.xDdayEnd lt 0 and item.zbspEndNy eq 1 }"><p style="color: tomato;">종료된 스페이스</p></c:if></li><br>
                         <li>목적지:
							<c:forEach items="${FindRegion}" var="FindRegion">
                              <c:forEach items="${listCodeRegion}" var="listRegion">
								<c:if test="${FindRegion.zbskKeywordCode eq listRegion.codeSeq}">
									<c:out value="${listRegion.codeName}"/>&nbsp;
								</c:if>
							</c:forEach>
                         </c:forEach>
                         
                         </li>
                         <li>테마:
                         <c:forEach items="${FindTheme}" var="FindTheme">
                         	<c:forEach items="${listCodeThemes}" var="listThemes">
								<c:if test="${FindTheme.zbskKeywordCode eq listThemes.codeSeq}">
									<c:out value="${listThemes.codeName}"/>&nbsp;
								</c:if>
							</c:forEach>
                         </c:forEach>
                         </li>
                         <c:if test="${item.zbspEndNy eq 1}"><li style="color: tomato;">만족도: <c:out value="${item.xLikeScore }" /> 점</li></c:if>
                     </ul>
                </div>
                <div class="title">
                    <h3>TRAVLE PLAN</h3>
                    <img class="titleimg"src="https://cdn-icons-png.flaticon.com/512/1067/1067357.png" alt="">
                </div>
                <p>여행 계획을 세워보세요.</p><br>
                <div class="spaceFlag">
                    <div class="spaceFlag-nav">
                        <button type="button" onclick="location.href='/spaceMapRouteAjax?zbspSeq=<c:out value="${vo.zbspSeq }"/>'"><i class="fa-regular fa-pen-to-square"></i></button>
                    </div>
                    <div class="spaceFlag-main">
                    <c:set var="listCodeRegion" value="${CodeServiceImpl.selectListCachedCode('1')}" />
                        <c:choose>
							<c:when test="${fn:length(flagPlan) eq 0}">
								<span class="text-center">계획을 추가해주세요.</span>
							</c:when>
							<c:otherwise>
								<c:forEach items="${flagPlan}" var="flagPlan">
									<c:if test="${flagPlan.zbtfTypeCode eq 0 }">
										<div class="item" onclick="javascript:goMap(<c:out value="${flagPlan.zbspSeq }"/>,<c:out value="${flagPlan.zbtfSeq }"/>)">
											<ul class="item_map">
												<li><h3>
														<c:out value="${flagPlan.zbtfFlagName }" />
													</h3></li>
												<li><c:out value="${flagPlan.zbtfName }" /></li>
												<li class="addr"><c:out value="${flagPlan.zbtfAddr }" /></li>
											</ul>
											<ul class="item_category_wrap">
												<%-- <c:forEach items="${theme }" var="theme">
													<c:if test="${theme.zbskKeywordCode eq 26 }">
														<li class="item_category"><img src="https://cdn-icons-png.flaticon.com/512/4163/4163679.png" alt=""></li>
													</c:if>
													<c:if test="${theme.zbskKeywordCode eq 27 }">
														<li class="item_category"><img src="https://cdn-icons-png.flaticon.com/512/308/308556.png" alt=""></li>
													</c:if>
													<c:if test="${theme.zbskKeywordCode eq 28 }">
														<li class="item_category"><img src="https://cdn-icons-png.flaticon.com/512/1076/1076877.png" alt=""></li>
													</c:if>
													<c:if test="${theme.zbskKeywordCode eq 29 }">
														<li class="item_category"><img src="https://cdn-icons-png.flaticon.com/512/2795/2795585.png" alt=""></li>
													</c:if>
												</c:forEach> --%>
												<!-- <li class="item_category"><img src="https://cdn-icons-png.flaticon.com/512/2795/2795585.png" alt=""></li> -->
											</ul>
										</div>
									</c:if>
								</c:forEach>
							</c:otherwise>
						</c:choose>
                    </div>
                </div>    
            </div>
            <!-- 계획영역e -->
            
            <!-- 추억등록s -->
            <div class="memory-Wrap">
                <div class="memorytitle">
                    <div class="title">
                        <h3>TRAVLE MEMORY</h3>
                        <img class="titleimg"src="https://cdn-icons-png.flaticon.com/512/1387/1387852.png" alt="">
                    </div>
                    <p>여행을 자유롭게 기록해보세요</p><br>
                </div>
                <div class="memory-box">
                    <div class="memory-nav">
                        <button><i class="fa-regular fa-pen-to-square"></i></button>
                    </div>
                    <div class="spaceFlag-main">
						<c:choose>
							<c:when test="${fn:length(flagMem) eq 0}">
								<span class="text-center">추억을 추가해주세요.</span>
							</c:when>
							<c:otherwise>
								<c:forEach items="${flagMem}" var="flagMem">
									<c:if test="${flagMem.zbtfTypeCode eq 1 }">
										<div class="item" onclick="javascript:goMap(<c:out value="${flagMem.zbspSeq }"/>, <c:out value="${flagMem.zbtfSeq }"/>)">
											<ul class="item_map">
												<li><h3>
														<c:out value="${flagMem.zbtfFlagName }" />
													</h3></li>
												<li><c:out value="${flagMem.zbtfName }" /></li>
												<li class="addr"><c:out value="${flagMem.zbtfAddr }" /></li>
											</ul>
											<ul class="item_category_wrap">
												<li class="item_category"><img src="https://cdn-icons-png.flaticon.com/512/3066/3066491.png" alt=""></li>
												<li><img src="" alt=""></li>
											</ul>
										</div>
									</c:if>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
                </div>
            </div>
            <!-- 추억등록e -->
            </div>
		</div>		
	</form>
	<form name="formVo" id="formVo" method="post">
		<!-- *Vo.jsp s -->
		<%@include file="spaceVo.jsp"%> <!-- #-> -->
		<!-- *Vo.jsp e -->
	</form>
	<!-- 스크립트영역 s -->
		<%@include file="../../include/All/JSLink.jsp" %>
		<!-- 스크립트영역 e -->
		<script type="text/javascript">
		
		// 멤버리스트 모달
		 const listmodal = document.querySelector(".memberList-modal");
		 const listopenModalBtn = document.querySelector("#open-memberList-modal");
		 const listcloseModalBtn = document.querySelector("#close-memberList-modal");

		 listopenModalBtn.addEventListener("click", function () {
		 listmodal.style.display = "block";
		 });

		 listcloseModalBtn.addEventListener("click", function () {
		 listmodal.style.display = "none";
		 });
		 
		 /* 선택한 깃발 좌표 vo 전달 s */
		 var formVo = $("form[id=formVo]");
		 var goMapUrl = "/spaceMapRouteAjax";
		 
		 var zbspSeq = $("input:hidden[name=zbspSeq]");
		 var zbtfSeq = $("input:hidden[name=zbtfSeq]");
		 
		 goMap = function(seq, seqFlag) {
				/* if(keyValue != 0) seq.val(btoa(keyValue)); */
				console.log(zbtfSeq.val());
				if(zbtfSeq.val() != null || zbtfSeq.val() != '' || !zbtfSeq.val().equals('undefined')) {
					zbtfSeq.val(seqFlag);
				} else {
					zbtfSeq.val() == 0;
				}
				zbspSeq.val(seq);
				
				console.log(zbtfSeq.val());
				formVo.attr("action", goMapUrl).submit();
			}
		 /* 선택한 깃발 좌표 vo 전달 e */
		/*  
		 $("#flagList").on("click", function(){
			 
				formVo.attr("action", goMapUrl).submit();
			}); */
		 </script>
</body>
</html>
