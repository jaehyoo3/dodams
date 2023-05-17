<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<%@ page session="true"%>
<!DOCTYPE HTML>

<html>
	<head>
		<meta charset="uTF-8"> 
		<meta name ="viewport" content="width=device-width, initial-scaLe=1.0">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
		<title>regform</title>
		<!-- Datepicker -->
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
		<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
		<link rel="stylesheet" href="/resources/css/user/spaceMemory.css">
	</head>
	<body>
	<form>
		<div class="containers">
            <%@include file="../../include/user/spaceSideBar.jsp"%>
            <div class="wrapper">
				<%@include file="../../include/user/spaceHeader.jsp"%>
                <div class="body">
                	<div class="map">
                		<div class="mapTitle"><p class="TitleDetail">여행깃발</p></div>
                		<div class="mapDetail"></div>
                	</div>
                	<div class="mapReg">
                		<div class="mapRegTitle"><p class="TitleDetail">여행깃발등록(추억)</p></div>
                		<div class="mapRegDetail">
                			<div class="wP mb-4">
	                			<input type="date" class="disIn box">
                			</div>
                			<div class="wP mb-4">
                				<div class="radio">
                					<input id="radio-1" name="radio" type="radio" checked>
    								<label for="radio-1" class="radio-label">당일</label>
    							</div>
    							<div class="radio">
    								<input id="radio-2" name="radio" type="radio" checked>
    								<label for="radio-2" class="radio-label">기간지정</label>
    							</div>
                			</div>
                			<div class="wP">
                				<input type="text" id="inputPassword5" class="textBox form-control mb-3">
                			</div>
                			<div class="wP">
                				<label for="inputPassword5" class="col-form-label"><p class="mb-0">장소 명</p></label>
                				<input type="text" id="inputPassword5" class="textBox form-control mb-3">
                			</div>
                			<div class="wP mb-5">
                				<label for="inputPassword5" class="col-form-label"><p class="mb-0">장소 주소</p></label><br>
                				<input type="text" id="inputPassword5" class="textBoxTwo form-control disIn">
                				<button type="button" class="btn btn-danger btnBox mb-1">검색	</button>
                			</div>
                			<!-- <div class="wP mb-5">
                				<label for="inputPassword5" class="col-form-label"><p class="mb-0">상세 주소</p></label><br>
                				<input type="text" id="inputPassword5" class="textBox form-control disIn">
                			</div> -->
                			<div class="wP">
                				<button type="button" class="btn btn-secondary regBtn mb-3">삭제</button>
                				<button type="button" class="btn btn-danger regBtn mb-3">등록</button>
                			</div>
                		</div>
                	</div>
                </div>
            </div>
        </div>        
</form>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/a1961b2393.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</script>
</body>
</html>