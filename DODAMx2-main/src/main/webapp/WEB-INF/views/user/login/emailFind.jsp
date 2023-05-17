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
	    <!-- Datepicker -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	    
	</head>
	<body>
		<form action="/find/result">
			<div class='loginWrap'>
				<div class="logo">
					<img src="/resources/logo/logo2.jpg">
				</div>
				<div class="content">
					<div class="boxList">
						<div class="listTitle">
							<h2>등록된 이메일로 계정을 찾습니다.
							</h2>
							<strong class="tit_prove">가입시 등록한 이메일 주소와 이름을 입력해주세요.</strong>
						</div>
						<!-- <div class="findBox">
							<p class="findFont">
							이름
							</p>
							<input type="text" value="" name="zbmmName">
						</div> -->
						<div class="findBox">
							<div class="email">
								<p class="findFont">
								이메일
								</p>
								<input type="text" id="email">
								<select id="domain-list">
									<option value="type">직접입력</option>
									<option value="naver.com" selected>naver.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="daum.net">daum.net</option>
									<option value="nate.com">nate.com</option>
								</select>
								<input type="hidden" id="email" name="zbmmEmail">
								<input type="text" id="emailAuth">
								<p id="mailCheckMsg" class="d-flex justify-content-start"></p>
								<input type="text" id="hiddenCheck">
							</div>
						</div>
						<div class="findBox">
						<button type="button" id="mailAuth">인증</button>
						<button type="submit" id="next" style="display: none;">확인</button>
						</div>
					</div>
				</div>
			</div>
		</form>
		<script type="text/javascript">
		var timer = null;
		var isRunning = false;
		var resultV = 0;
		$("#mailAuth").on("click",function(e){
			const email = $('#email').val() + '@' + $('#domain-list').val();
			$('input[name=zbmmEmail]').val(email)
			if(!email_check(email)){
				alert("이메일 형식에 맞게 입력해주세요");
			} else{
				isMailAuthed=true;
			    alert('인증번호가 전송되었습니다.')
			    $.ajax({
			        url : "/join/mailAuth" 
			        ,data : {"mail" : email}
			        ,success: function(data){
			           $('#hiddenCheck').val(data);
			        },error : function(req,status,err){
			        	alert('이메일을 입력해주세요');
			            console.log(req);
			        }
			    });
			    $('#emailCheck').show();
			    $(function(){
			    	var display = $('.time');
			    	var leftSec = 300;
			    	// 남은 시간
			    	// 이미 타이머가 작동중이면 중지
			    	if (isRunning){
			    		clearInterval(timer);
			    		display.html("");
			    		startTimer(leftSec, display);
			    	}else{
			    	startTimer(leftSec, display);
			    		
			    	}
				})
				$('#emailAuth').focusout(function () {
					const inputCode = $(this).val();
					const $resultMsg = $('#mailCheckMsg');
					if(inputCode == $('#hiddenCheck').val() && inputCode != ''){
						$resultMsg.html('인증번호가 일치합니다.');
						$resultMsg.css('color','green');
						$('#mail-Check-Btn').attr('disabled',true);
						$('#userEamil1').attr('readonly',true);
						$('#userEamil2').attr('readonly',true);
						$('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
				        $('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
				        $('#emailAuthAllowedYn').val("");
				        $('#emailAuthAllowedYn').val("1");
				        $('#mailAuth').hide();
				        $('#next').show();
					}else{
						$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
						$resultMsg.css('color','red');
						$('#emailAuthAllowedYn').val("");
				        $('#emailAuthAllowedYn').val("0");
				        $('#mailAuth').show();
				        $('#next').hide();
					}
				})	
			}
		})
		
		function startTimer(count, display) {
	        
			var minutes, seconds;
	        timer = setInterval(function () {
	        minutes = parseInt(count / 60, 10);
	        seconds = parseInt(count % 60, 10);
	        minutes = minutes < 10 ? "0" + minutes : minutes;
	        seconds = seconds < 10 ? "0" + seconds : seconds;
	        display.html(minutes + ":" + seconds);
	        // 타이머 끝
	        if (--count < 0) {
		     clearInterval(timer);
		     alert("시간초과");
		     display.html("시간초과");
		     $('.btn_chk').attr("disabled","disabled");
		     isRunning = false;
	        }
	    }, 1000);
	         isRunning = true;
	}
		
		//이메일 정규식
		  function email_check(email) {
				var reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
				return reg.test(email);
			}
		</script>
	</body>
</html>