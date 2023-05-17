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
        <link rel="stylesheet" href="/resources/css/user/spacemainBackup.css">
		<title></title>
	</head>
	<body>
	<form>
		<div class="container">
           	<%@include file="../../include/user/spaceSideBar.jsp"%>
            <div class="wrapper">
	          <%@include file="../../include/user/spaceHeader.jsp"%>
                <div class="main-container">
                    <div class="left_area">
                        <div class="box">
							<div class="box_head">
								<ul class="catagory">
									<c:forEach items="${theme }" var="theme">
										<c:if test="${theme.zbskKeywordCode eq 26 }">
											<li class="catagory_item1"><img src="https://cdn-icons-png.flaticon.com/512/4163/4163679.png" alt=""></li>
										</c:if>
										<c:if test="${theme.zbskKeywordCode eq 27 }">
											<li class="catagory_item2"><img src="https://cdn-icons-png.flaticon.com/512/308/308556.png" alt=""></li>
										</c:if>
										<c:if test="${theme.zbskKeywordCode eq 28 }">
											<li class="catagory_item3"><img src="https://cdn-icons-png.flaticon.com/512/1076/1076877.png" alt=""></li>
										</c:if>
										<c:if test="${theme.zbskKeywordCode eq 29 }">
											<li class="catagory_item4"><img src="https://cdn-icons-png.flaticon.com/512/2795/2795585.png" alt=""></li>
										</c:if>
									</c:forEach>
								</ul>
								<c:set var="listCodeRegion" value="${CodeServiceImpl.selectListCachedCode('1')}" />
								
								<p>
								<c:forEach items="${theme }" var="theme">
								<c:forEach items="${listCodeRegion}" var="listRegion" varStatus="statusRegion">
									<c:if test="${theme.zbskKeywordCode eq listRegion.codeSeq}">
										<c:out value="${listRegion.codeName }" />&nbsp;
									</c:if>
								</c:forEach>
								</c:forEach>
								  여행 계획</p>
							</div>
							<div class="box_body">
                                <div class="tag">
                                    <ul class="tag_list">
                                        <h2><i class="fa-solid fa-person-walking-luggage"></i> 여행계획</h2>
                                        <a href="#"><div class="addWrap">+</div></a>
                                    </ul>
                                    <select>
                                        <option value="">일정으로 검색</option>
                                    </select>
                                </div>
								<c:choose>
									<c:when test="${fn:length(flag) eq 0}">
										<span>계획을 추가해주세요.</span>
									</c:when>
									<c:otherwise>
										<c:forEach items="${flag }" var="flag">
											<c:if test="${flag.zbtfTypeCode eq 0 }">
												<a class="body_itemwrap" href="#">
													<div class="body_item">
														<ul class="item_map">
															<li><c:out value="${flag.zbtfName }" /></li>
															<li class="addr"><c:out value="${flag.zbtfAddr }" /></li>
														</ul>
														<ul class="item_category_wrap">
															<li class="item_category"><img src="https://cdn-icons-png.flaticon.com/512/2116/2116981.png" alt=""></li>
															<!-- <li class="item_category"><img src="https://cdn-icons-png.flaticon.com/512/2795/2795585.png" alt=""></li> -->
															<li><img src="" alt=""></li>
														</ul>
													</div>
												</a>
											</c:if>
										</c:forEach>
									</c:otherwise>
								</c:choose>
								<!-- <a class="body_itemwrap" href="#">
                                    <div class="body_item">
                                        <ul class="item_map">
                                            <li>1번영역에서</li>
                                            <li>주소나오는 영역</li>
                                        </ul>
                                        <ul class="item_category_wrap">
                                            <li class="item_category"><img src="https://cdn-icons-png.flaticon.com/512/2795/2795585.png" alt=""></li>
                                            <li class="item_category"><img src="https://cdn-icons-png.flaticon.com/512/2795/2795585.png" alt=""></li>
                                        </ul>
                                    </div>
                                </a> -->
                            </div>    
                        </div>
                    </div>
                    <div class="right_area">
                        <!-- <div class="right_boxf">
                            <h1>여행까지 <p>19일</p> 남았습니다.</h1>
                            <h2>다른 사람들의 스페이스를 참고 해 보세요</h2>
                            <div class="search_box">
                                이미지 들어가는 영역,데코레이션
                            </div>
                        </div> -->
                        <div class="memory_body">
                            <div class="memory_tag">
                                <ul class="tag_list">
                                    <h2><i class="fa-solid fa-camera"></i> 추억기록</h2>
                                    <a href="#"><div class="addWrap">+</div></a>
                                </ul>
                                <select>
                                    <option value="">일정으로 검색</option>
                                </select>
                            </div>
                            <!-- <a class="body_itemwrap" href="#">
                                <div class="body_item">
                                    <ul class="item_map">
                                        <li>첫째날</li>
                                        <li class="addr">주소영역</li>
                                    </ul>
                                    <ul class="item_category_wrap">
                                        <li class="item_category"><img src="https://cdn-icons-png.flaticon.com/512/2795/2795585.png" alt=""></li>
                                        <li><img src="" alt=""></li>
                                    </ul>
                                </div>
                            </a>
                            <a class="body_itemwrap" href="#">
                                <div class="body_item">
                                    <ul class="item_map">
                                        <li>첫째날</li>
                                        <li class="addr">주소영역</li>
                                    </ul>
                                    <ul class="item_category_wrap">
                                        <li class="item_category"><img src="https://cdn-icons-png.flaticon.com/512/2795/2795585.png" alt=""></li>
                                        <li><img src="" alt=""></li>
                                    </ul>
                                </div>
                            </a>
                            <a class="body_itemwrap" href="#">
                                <div class="body_item">
                                    <ul class="item_map">
                                        <li>첫째날</li>
                                        <li class="addr">주소영역</li>
                                    </ul>
                                    <ul class="item_category_wrap">
                                        <li class="item_category"><img src="https://cdn-icons-png.flaticon.com/512/2795/2795585.png" alt=""></li>
                                        <li><img src="" alt=""></li>
                                    </ul>
                                </div>
                            </a> -->
                            <c:choose>
									<c:when test="${fn:length(flag) eq 0}">
										<span>추억을 추가해주세요.</span>
									</c:when>
									<c:otherwise>
										<c:forEach items="${flag }" var="flag">
											<c:if test="${flag.zbtfTypeCode eq 1 }">
												<a class="body_itemwrap" href="#">
													<div class="body_item">
														<ul class="item_map">
															<li><c:out value="${flag.zbtfName }" /></li>
															<li class="addr"><c:out value="${flag.zbtfAddr }" /></li>
														</ul>
														<ul class="item_category_wrap">
															<li class="item_category"><img src="https://cdn-icons-png.flaticon.com/512/3066/3066491.png" alt=""></li>
															<li><img src="" alt=""></li>
														</ul>
													</div>
												</a>
											</c:if>
										</c:forEach>
									</c:otherwise>
								</c:choose>
                        </div>        
                    </div>
                </div>
            </div>
        </div>
	</form>
	    <!-- 스크립트영역 s -->
		<%@include file="../../include/All/JSLink.jsp" %>
		<!-- 스크립트영역 e -->
</body>
</html>