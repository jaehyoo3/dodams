<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="/resources/css/user/mypageMod.css">
    <title>DODAMDODAM</title>
    
</head>
<body>
<form name="form" action="/Mypage/userUpdt">
<input type="hidden" name="zbmmSeq"  value="<c:out value="${sessSeq }"/>">
<!-- Navbar s  -->
	<%@include file="../../include/user/homeNav.jsp"%>
<!-- Navbar e  --> 
	<div class="background">
        <h1>회원정보관리</h1>
        <h2>회원님의 정보를 수정하실 수 있습니다.</h2>
	</div>
    <div class='main-container'>
        <div class='account-wrap'>
            <div class='profileImg'></div>
            <input id="profile" type="file"><br>
            <label class="profile-label" for="profile">이미지선택</label>
            <br><br><br><hr>
            <ul class="input-wrap">
                <li class='main-text-Font'>아이디</li>
                <%-- <input type="text" class="input-item" name="zbmmID" value="<c:out value="${item.zbmmID}"/> "></input> --%>
				<c:choose>
					<c:when test="${item.zbmmSocialType eq 1 }">
						<input type="hidden" class="input-item" name="zbmmID" value="<c:out value="${item.zbmmID}" /> " readonly></input>
						<span class="input-item text-center">카카오 로그인</span>
					</c:when>
					<c:when test="${item.zbmmSocialType eq 2 }">
						<input type="hidden" class="input-item" name="zbmmID" value="<c:out value="${item.zbmmID}"/> " readonly></input>
						<span class="input-item text-center">네이버 로그인</span>
					</c:when>
					<c:otherwise>
						<input type="text" class="input-item" name="zbmmID" value="<c:out value="${item.zbmmID}"/> " readonly></input>
					</c:otherwise>
				</c:choose>
			</ul>
            <ul class="input-wrap">
                <li class='main-text-Font'>비밀번호</li>
                <li class='information-text-Font'><input type="password" name="zbmmPW" style="display: none;">
                	<button class="btn" type="button" id="pwBtn">변경하기</button>
                </li>
            </ul>
            <ul class="input-wrap">
                <li class='main-text-Font'>이름</li>
                <input type="text" class="input-item" name="zbmmName"  value="<c:out value="${item.zbmmName }"/>"></input>
            </ul>
            <ul class="input-wrap">
                <li class='main-text-Font'>이메일</li>
                <input type="text" class="input-item" name="zbmmEmail"  value="<c:out value="${item.zbmmEmail }"/> " ></input>
            </ul>
            <ul class="input-wrap">
                <li class='main-text-Font'>휴대전화</li>
                <input type="text" class="input-item" name="zbmmMobile"  value="<c:out value="${item.zbmmMobile }"/> " ></input>
            </ul>
            <div class="input-menu">
            	<button class="btn" type="submit" id="btnSave">저장</button>
            </div>
        </div>
    </div>
    </form>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://kit.fontawesome.com/86d85c3d85.js" crossorigin="anonymous"></script>
	<script>
	
	//정보수정입니다.
	$("#btnSave").on("click", function(){
   		// update
   		alert('수정 완료되었습니다');
   		
	}); 
	
	$("#pwBtn").on("click", function(){
		$('input[name=zbmmPW]').show();
	});
	
	</script>
	
	</body>
</html>

