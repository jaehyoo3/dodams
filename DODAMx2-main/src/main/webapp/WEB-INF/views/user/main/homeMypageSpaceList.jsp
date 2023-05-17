<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<%@ page session="true" %>
<jsp:useBean id="CodeServiceImpl" class="com.dodam.infra.modules.code.CodeServiceImpl"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="/resources/css/user/homeMypageSpaceList.css">
    <title>DODAMDODAM</title>
    <style type="text/css">
   a.{
	display: 
   }
    </style>
</head>
	<body>
	<c:set var="listCodeRegion" value="${CodeServiceImpl.selectListCachedCode('1')}"/>
	<c:set var="listCodeTravelTheme" value="${CodeServiceImpl.selectListCachedCode('4')}"/>
	<form name="form">
	<input type="hidden" name="zbspSeq">
	<!-- Navbar s  -->
	<%@include file="../../include/user/homeNav.jsp"%>
	<!-- Navbar e  --> 
	<div class="background">
	    <h1>스페이스 관리</h1>
	    <h2>현재 소속된 스페이스와 종료된 스페이스를 조회할 수 있습니다.</h2>
	</div>

    <div class="spaceWrap">
        <div class="startSpace">
            <h1>종료된 스페이스</h1>
            <h3>종료된 스페이스를 조회할 수 있습니다.</h3>
            <div class="stspace-box">
            	<c:choose>
	            	<c:when test="${fn:length(endlist) eq 0}">
	            		<h1 style="color:#191970;">아직 종료된 스페이스가 없습니다.</h1> 
	            	</c:when>
	            	<c:otherwise>
		            	<c:forEach items="${endlist}" var="endlist" varStatus="status">
			                <div class="space" onclick="location.href='javascript:gospace(<c:out value="${endlist.zbspSeq}"/>)'">
			                    <ul class="space-info">
			                        <li class="space-item"><c:out value="${endlist.zbspName}"/></li>
			                        <li class="space-item"><img src="https://cdn.imweb.me/thumbnail/20210927/ec172a5daa72b.jpg" alt=""></li>
			                    </ul>
			                    <ul class="travel-info">
			                        <li class="space-item">여행테마: 
				                        <c:set var="keywordArray" value="${fn:split(endlist.zbskKeywordCode, ',') }" />
				                        <c:forEach var="keyword" items="${keywordArray}">
											<c:forEach items="${listCodeTravelTheme}" var="listTheme">
												<c:if test="${keyword eq listTheme.codeSeq}">
													<c:if test="${keyword eq listTheme.codeSeq}">&nbsp;<span style="color:tomato"><c:out value="${listTheme.codeName}"/></span>&nbsp;</c:if>
												</c:if>
											</c:forEach>
										</c:forEach>
			                        </li>
			                        <li class="space-item">여행지역: 
			                        	<c:set var="regionArray" value="${fn:split(endlist.zbskKeywordCode, ',') }" />
										<c:forEach var="region" items="${regionArray}">
											<c:forEach items="${listCodeRegion}" var="listRegion">
												<c:if test="${region eq listRegion.codeSeq}">
													<c:if test="${region eq listRegion.codeSeq}">&nbsp;<span style="color:tomato"><c:out value="${listRegion.codeName}"/></span>&nbsp;</c:if>
												</c:if>
											</c:forEach>
										</c:forEach>
			                        </li>
			                        <li class="space-item">총비용:172,000</li>
			                        <li class="space-item">인원수:<span style="color:tomato"><c:out value="${endlist.zbmmCount}"/></span>명</li>
			                        <!-- <li class="space-item">평가:★★★★★</li> -->
			                        <!-- <li class="space-item">22-00-00 ~ 22-00-00</li> -->
			                    </ul>
			                    <ul class="spbutton">
			                        <li><button><i class="fa-regular fa-trash-can"></i></button></li>
			                        <li><button><i class="fa-regular fa-star"></i></button></li>
			                    </ul>
			                </div>
	                        </c:forEach>
                	</c:otherwise>
               	</c:choose>
            </div>
        </div>
        <div class="endSpace">
            <h1>진행중인 스페이스</h1>
            <h3>스페이스에서 여행준비를 해보세요.</h3>
            <div class="stspace-box">
            <c:choose>
	            	<c:when test="${fn:length(list) eq 0}">
	            		<h1 style="color:#191970;">아직 진행중인 스페이스가 없습니다.</h1> 
	            	</c:when>
	            	<c:otherwise>
	            <c:forEach items="${list}" var="list" varStatus="status">
	                <div class="space" onclick="location.href='javascript:gospace(<c:out value="${list.zbspSeq}"/>)'">
	                    <ul class="space-info">
	                        <li class="space-item"><c:out value="${list.zbspName }"/></li>
	                        <li class="space-item"><img src="https://cdn.imweb.me/thumbnail/20210927/ec172a5daa72b.jpg" alt=""></li>
	                    </ul>
	                    <ul class="travel-info">
	                        <%-- <li class="space-item"><c:out value="${list.zbskKeywordCode }"/></li> --%>
	                        <li class="space-item">여행테마: 
		                        <c:set var="keywordArray" value="${fn:split(list.zbskKeywordCode, ',') }" />
		                        <c:forEach var="keyword" items="${keywordArray}">
									<c:forEach items="${listCodeTravelTheme}" var="listTheme">
										<c:if test="${keyword eq listTheme.codeSeq}">&nbsp;<span style="color:tomato"><c:out value="${listTheme.codeName}"/></span>&nbsp;</c:if>
									</c:forEach>
								</c:forEach>
	                        </li>
	                        <li class="space-item">여행지역: 
	                        	<c:set var="regionArray" value="${fn:split(list.zbskKeywordCode, ',') }" />
								<c:forEach var="region" items="${regionArray}">
									<c:forEach items="${listCodeRegion}" var="listRegion">
										<c:if test="${region eq listRegion.codeSeq}">&nbsp;<span style="color:tomato"><c:out value="${listRegion.codeName}"/></span>&nbsp;</c:if>
									</c:forEach>
								</c:forEach>
	                        </li>
	                        <li class="space-item">멤버수:<span style="color:tomato"><c:out value="${list.zbmmCount }"/></span>명</li>
	                        <li class="space-item"></li>
	                    </ul>
	                </div>
	            </c:forEach>
	            </c:otherwise>
	            </c:choose>   
            </div>
        </div>
    </div>
    </form>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://kit.fontawesome.com/86d85c3d85.js" crossorigin="anonymous"></script>
	<script>        
	        //미디어쿼리 버튼
	        const toggleBtn = document.querySelector('.navbar__toogleBtn');
	        const menu = document.querySelector('.navbar__menu');
	    
	        toggleBtn.addEventListener('click', () =>{
	            menu.classList.toggle('active');
	        });
	        //로그아웃
	        $("#btnLogout").on("click", function(){
	    		$.ajax({
	    			async: true 
	    			,cache: false
	    			,type: "post"
	    			,url: "/logoutProc"
	    			,data: {}
	    			,success: function(response) {
	    				if(response.rt == "success") {
	    					location.href = "/login";
	    				} else {
	    					// by pass
	    				}
	    			}
	    			,error : function(jqXHR, textStatus, errorThrown){
	    				alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
	    			}
	    		});
	    	});
	        
	        var seq = $("input:hidden[name=zbspSeq]");
	        var goUrlSpace = "/spaceMain";
	        var form = $("form[name=form]");
	        function gospace(keyValue){
	        	seq.val(keyValue);
	    		form.attr("action",goUrlSpace).submit();
	    	}
	</script>   
	</body>
</html>

