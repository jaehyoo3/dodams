<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<%@ page session="true" %>
<html>
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="/resources/css/user/mainLogin.css">
	    <title>DoDam.X2</title>
	    <!-- Datepicker -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	</head>
	<body>
		<form>
			<div class='loginWrap'>
				<div class="logo">
					<img src="/resources/logo/logo2.jpg">
				</div>
				<c:choose>
					<c:when test="${fn:length(item) eq 0 }">
						<div class="content">
							<div class="boxList">
								<div class="listTitle">
									<h2>해당 이메일로 가입한 계정이 없습니다
									</h2>
									<strong class="sub_prove"><br>가입한 계정이 없습니다.새로운 계정을 생성해 주세요</strong>
								</div>
								<hr>
								<div class="findBox">
									<p class="findFont">
									</p>
								</div>
								<hr>
								<div class="findBox">
								<button type="button" onclick="location.href='/signup'">회원가입</button>
								</div>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="content">
							<div class="boxList">
								<div class="listTitle">
									<h2>입력한 정보와 일치한 계정을 확인해 주세요.
									</h2>
									<strong class="sub_prove">
									<br>비밀번호 변경을 누르면 인증된 메일로 임시 비밀번호가 전송됩니다.</strong>
								</div>
								<hr>
								<c:forEach items="${item}" var="item">
									<div class="findBox">
										<p class="findFont">
										<c:out value="${item.zbmmID}"/>(<c:out value="${item.zbmmEmail}"/>)
										</p>
										<c:if test="${item.zbmmSocialType eq 0}">
											<span><a class="findpw" id="pwChange">임시 비밀번호 발급</a></span>
											<input type="hidden" name="zbmmEmail" value="${item.zbmmEmail}">
											<form name="pwUpdt">
												<input type="hidden" name="zbmmEmail" value="${item.zbmmEmail}">
												<input type="hidden" id="newPw" name="zbmmPW">
												<input type="hidden" name="zbmmSeq" value="${item.zbmmSeq}">
											</form>
										</c:if>
										<c:if test="${item.zbmmSocialType eq 1}">
											<span>카카오로그인</span>
										</c:if>
										<c:if test="${item.zbmmSocialType eq 2}">
											<span>네이버로그인</span>
										</c:if>
										<c:if test="${item.zbmmSocialType eq 3}">
											<span>구글로그인</span>
										</c:if>
									</div>
								</c:forEach>
								<hr>
								<div class="findBox">
								<button type="button" onclick="location.href='/login'">로그인</button>
								</div>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</form>
		<script type="text/javascript">
		var goUrlUpdt="/pwChangeUpdt"
		var form=$("form[name=pwUpdt]");
			$("#pwChange").on("click",function(e){
				const email =$("input[name=zbmmEmail]").val()
				isMailAuthed=true;
				alert('임시 비밀번호 발송');
			    $.ajax({
			        url : "/pwChange" 
			        ,data : {"mail" :email
			        }
			        ,success: function(data){
			        	$("input[name=zbmmPW]").val(data);
			        	form.attr("action",goUrlUpdt).submit();
			        },error : function(req,status,err){
			        	alert('실패');
			        }
				})	
			})
/* 			if($("#newPw").val() != null){
				$("#newPw").on("change",function(e){
				 $.ajax({
				        url : "/pwChangeUpdt" 
				        ,data : {"zbmmPW" : $("#newPw").val()}
				        ,success: function(data){
				        },error : function(req,status,err){
				        }
					})	
				})
			} */
		</script>
	</body>
</html>