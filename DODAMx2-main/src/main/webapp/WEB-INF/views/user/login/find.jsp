<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<html>
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="/resources/css/user/mainLogin.css">
	    <title>DoDam.X2</title>
	</head>
	<body>
		<form>
			
			<div class='loginWrap'>
			<h1><a href="/login" style="color:#000">DODAM</a></h1>
				<div class="content">
					<div class="boxList">
						<div class="listTitle">
							<h2>도담도담 계정을 찾을 방법을
								<br>
							선택해 주세요.
							</h2>
						</div>
						<div class="selectBox">
							<a href="find/email" class="link_prove">
						 		<strong class="tit_prove">닉네임 또는 이름 / 이메일로 찾기</strong>
						 		<p class="desc_prove">서비스에서 이용한 닉네임 또는 이름 및 계정의 연락처 이메일로 계정을 찾습니다.</p>
						 		<span class="linkgo">바로가기</span>
						 	</a>
						</div>
						<p class="loginLink">
						<a href="login">로그인 하러가기</a>
						</p>
					</div>
				</div>
			</div>
		</form>
	</body>
</html>