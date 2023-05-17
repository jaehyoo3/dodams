<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>회원가입</title>
<!-- favicon -->
<link rel="icon" type="image/x-icon" href="/resources/favicon/favicon.jpg" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
<link rel="icon" type="image/x-icon" href="/resources/user/main/template/assets/favicon.ico" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/0089819b08.js" crossorigin="anonymous"></script>
<!-- Datepicker -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<style type="text/css">


/*  */
@font-face {
	font-family: 'SUIT-Medium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Medium.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}
* {
	font-family: 'SUIT-Medium';
}
.form-check-input:checked {
	background-color: #FF4A4A;
}
.form-control {
	height: 45px;
}
.form-select {
	width: 400px;
	height: 45px;
}
.chBtn {
	width: 140px;
	height: 45px;
	margin-left: 10px;
}
.logoColor {
	background-color: #FF4A4A;
}
.signup {
	width: 150px;
}
/* 공통 클래스 */
.hide {
	display: none;
}
/* 경고 메세지 */
.msg {
	display: block;
	width: 100%;
	font-size: 12px;
	color: #666;
	margin-bottom: 5px;
	text-align: start;
}
.msg:before {
	display: inline-block;
	content: "";
	clear: both;
	vertical-align: middle;
	width: 3px;
	height: 3px;
	margin-right: 5px;
	border-radius: 50%;
	background: #333;
}
.msg.hide {
	display: none;
}
.msg.success {
	color: green;
}
.msg.success:before {
	background: green;
}
.icon {
	width: 100px;
}


/* 프로필 이미지 */
.profileWrap{
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}
.profileCircle{
    width: 100px;
    height: 100px;
    margin-bottom: 10px;
    border-radius: 50%;
    overflow: hidden;
}
.profileImg{
    display: flex;
    width:100%;
    height:100%;
    justify-content: center;
    align-items: center;
}
.profileImgUpload #uploadedImage{
    display:none;
}

.profileImgUpload label{
    font-size: 15px;
    font-weight: 200;
    cursor: pointer;
    text-align: center;
    border: 1px solid #e0e0e0;
    border-radius: 15px;
    padding: 4px;
}
.profileImgUpload label:hover{
    background: #191970;
    border: 1px solid #fff;
    color: #fff;
}
</style>

</head>
<body>

	<!-- start -->
	<section>
		<form name="formIsrt" id="formIsrt" method="post" enctype="multipart/form-data">
			<div class="container py-5 h-100">
				<div class="row d-flex justify-content-center h-100">
					<div class="col-12 col-md-8 col-lg-6">
						<div class="card shadow-2-strong" style="border-radius: 1rem;">
							<div class="card-body p-5 text-center">
								<div class="mb-5">
									<div class="profileWrap">
						                <div class="profileCircle">
						                    <img class="profileImg" src="https://cdn-icons-png.flaticon.com/512/547/547413.png">
						                </div>
						                <div class="profileImgUpload">
						                    <input id="uploadedImage" name="uploadedImage" type="file" accept="image/*"  >
						                    <label for="uploadedImage">이미지선택<i class="fa-regular fa-file-image"></i></label>
						                </div>
						            </div>					              	
								</div>
								<div class="form-group">
									<label for="id" class="form-label d-flex justify-content-start mb-2">아이디</label> <input id="zbmmID" name="zbmmID" type="text" class="form-control" placeholder="아이디"> <input type="hidden" id="idAllowedNy" type="text" name="idAllowedNy"> <input type="hidden" id="idAllowedNyTwo" type="text" name="idAllowedNyTwo">
									<div class='failure-message hide msg'>4자 이상의 영문 혹은 영문과 숫자를 조합</div>
									<div class='success-message hide msg success'>사용할 수 있는 아이디입니다.</div>
								</div>
								<div class="form-group">
									<label for="password" type="password" class="form-label d-flex justify-content-start">비밀번호</label> <input id="password" type="password" class="form-control" placeholder="비밀번호" name="zbmmPW">
									<div class='password-message-wrap'>
										<span class='password-failure-length hide msg'>7자 이상 입력</span> <span class='password-failure-comb hide msg'>영문/숫자/특수문자(공백 제외)만 허용하며, 2개 이상 조합</span> <span class='password-failure-contn hide msg'>동일한 숫자 3개 이상 연속 사용 불가</span> <span class='password-failure-upper hide msg'>영어 대문자 하나 이상 포함</span> <span class='password-success-message hide msg success'>사용할 수 있는 비밀번호입니다.</span>
									</div>
								</div>
								<div class="form-group">
									<label for="passwordCheck" class="form-label d-flex justify-content-start">비밀번호 확인</label> <input id="passwordCheck" type="password" class="form-control" placeholder="비밀번호 확인">
									<div class="mismatch-message hide msg">동일한 비밀번호를 입력해주세요.</div>
									<div class="match-message hide msg success">동일한 비밀번호가 입력되었습니다.</div>
								</div>
								<div class="form-group">
									<label for="name" class="form-label d-flex justify-content-start">이름</label> <input id="name" type="text" class="form-control" placeholder="이름" name="zbmmName">
								</div>
								<div class="form-group">
									<input type="hidden" id="emailAuthAllowedYn">
									<label for="email" class="form-label d-flex justify-content-start">이메일</label>
									<div class="d-flex justify-content-start">
										<input id="email" type="text" class="form-control mb-3" placeholder="이메일" style="display: inline-block;">&nbsp;&nbsp;@&nbsp;&nbsp;
										<select class="form-select pt-1" id="domain-list">
											<option value="type">직접 입력</option>
											<option value="naver.com" selected>naver.com</option>
											<option value="gmail.com">gmail.com</option>
											<option value="daum.net">daum.net</option>
										</select>
										<button id="mailAuth" type="button" class="btn btn-danger logoColor chBtn"style="background: #191970; color:#fff; border:none;">인증</button>
									</div>
									<input type="hidden" name="zbmmEmail" name="zbmmEmail">
								</div>
								<div class="form-group hide" id="emailCheck">
									<div class="d-flex justify-content-start">
										<label for="emailA" class="form-label inline-block">인증번호</label>
										<p class="time d-flex inline-block text-danger ms-2"></p>
									</div>
									<div class="d-flex justify-content-start">
										<input type="text" id="emailAuth" class="form-control mb-3" placeholder="인증번호" style="display: inline-block;">
									</div>
									<p id="mailCheckMsg" class="d-flex justify-content-start"></p>
									<input id="hiddenCheck" type="hidden">
								</div>
								<div class="form-group">
									<label for="numberPhone" class="form-label d-flex justify-content-start">휴대전화</label> <input id="numberPhone" type="tel" class="form-control mb-5" placeholder="휴대전화" name="zbmmMobile">
								</div>
								<div class="form-group">
									<button type="button" style="background: #191970; color:#fff; border:none;" class="btn btn-danger signup logoColor" onclick="isAllCheck()">가입하기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="text-center">
					이미 아이디가 있다면? <a href="login">로그인하러 가기</a>
				</div>
				<br> <br>
			</div>
		</form>
	</section>


	<script type="text/javascript">
	const elInputUsername = document.querySelector('#zbmmID');
	const elFailureMessage = document.querySelector('.failure-message');
	const elSuccessMessage = document.querySelector('.success-message');
	const elPassword = document.querySelector('#password');
	const elPasswordRetype = document.querySelector('#passwordCheck');
	const elPWRetypeFailureMsg = document.querySelector('.mismatch-message');
	const elPWRetypeSuccessMsg = document.querySelector('.match-message');
	const elPWFailureLeng = document.querySelector('.password-failure-length');
	const elPWFailureComb = document.querySelector('.password-failure-comb');
	const elPWFailureContn = document.querySelector('.password-failure-contn');
	const elPWFailureUpper = document.querySelector('.password-failure-upper');
	const elPWSuccessMessage = document.querySelector('.password-success-message');
	const elNmFailureComb = document.querySelector('.name-failure-comb');
	const elSubmitButton = document.querySelector('#subit-button');
	/* var idCh = true; */
	var idCh = true;
	var pwCh = true;
	var pwChCh = true;
	var nameCh = true;
	var emailCh = true;
	var chboxCh = true;
	var goUrlInst = "/memberIsrt"; /* #-> */
	var form = $("form[name=formIsrt]");
	  
	function isAllCheck() {  
		while(idCh || pwCh || pwChCh || emailCh) {	  
		 	if(document.getElementById("idAllowedNyTwo").value == 1){
				idCh = false;
			} else{
				alert("아이디 확인 바람");
				idCh = true;
				break;
			}
		    if( (isMoreThan7Length(elPassword.value)) && 
		        (isPasswordEng(elPassword.value) + isPasswordNum(elPassword.value) + isPasswordSpeci(elPassword.value) >= 2) &&
		        (isPasswordChar(elPassword.value)) &&
		        (isPasswordBlank(elPassword.value)) && 
		        (!isPasswordRepeat(elPassword.value)) && 
		        ((elPassword.value))
		      ) { // 비밀번호
		    	pwCh = false;
		   	} else{
		    	alert("pw조건을 맞추시오");
			   	pwCh = true;
			   	break;
		   	}
		   	if(isMatch(elPassword.value, elPasswordRetype.value)) { // 비밀번호 확인
		    	pwChCh = false;
			} else{
				alert("pw가 서로 다름");
				pwChCh = true;	
				break;
			}
		   	if(document.getElementById("emailAuthAllowedYn").value == 1){
		   		emailCh = false;
			} else{
				alert("인증번호 확인 바람");
				emailCh = true;
				break;
			}
		    if(idCh || pwCh || pwChCh || emailCh) {
		    	alert('모든 조건이 충족되어야합니다.');
			    break;
			} else {
				  alert('회원가입이 완료되었습니다!');
				  form.attr("action", goUrlInst).submit();
			}
		}
	}  	 
	
	function usernameFn() {
	    if(isMoreThan4Length(elInputUsername.value) && isUserNameChar(elInputUsername.value)) {
	    	// 성공
	    	document.getElementById("zbmmID").classList.remove('is-invalid');
			//document.getElementById("zbmmID").classList.add('is-valid');
	      	elFailureMessage.classList.add('hide');
	    } else {
	    	// 실패
	    	 elSuccessMessage.classList.add('hide');
	    	 elFailureMessage.classList.remove('hide');
	    	document.getElementById("zbmmID").classList.remove('is-valid');
			document.getElementById("zbmmID").classList.add('is-invalid');
	    }
	  }
	  elInputUsername.addEventListener('click', usernameFn);
	  elInputUsername.addEventListener('keyup', usernameFn);
	  
	  $("#zbmmID").on("keyup", function(){
		  if(isMoreThan4Length(elInputUsername.value) && isUserNameChar(elInputUsername.value)) {
			  document.getElementById("idAllowedNy").value = "";
			  document.getElementById("idAllowedNy").value = 1;
		  } else{
			  document.getElementById("idAllowedNy").value = "";
			  document.getElementById("idAllowedNy").value = 0;
		  }
	  });
	
	$("#zbmmID").on("focusout", function(){
		if(document.getElementById("idAllowedNy").value == 1){
					$.ajax({
						async: true 
						,cache: false
						,type: "post"
						/* ,dataType:"json" */
						,url: "/checkId"
						/* ,data : $("#formLogin").serialize() */
						,data : { "zbmmID" : $("#zbmmID").val() }
						,success: function(response) {
							if(response.rt == "success") {
								document.getElementById("zbmmID").classList.remove('is-invalid');
								document.getElementById("zbmmID").classList.add('is-valid');
			
								/* document.getElementById("idFeedback").classList.remove('invalid-feedback');
								document.getElementById("idFeedback").classList.add('valid-feedback');
								document.getElementById("idFeedback").innerText = "사용 가능 합니다."; */
								
								document.getElementById("idAllowedNyTwo").value = 1;
								elSuccessMessage.classList.remove('hide');
								
							} else {
								document.getElementById("zbmmID").classList.remove('is-valid');
								document.getElementById("zbmmID").classList.add('is-invalid');
								/* document.getElementById("idFeedback").classList.remove('valid-feedback');
								document.getElementById("idFeedback").classList.add('invalid-feedback');
								document.getElementById("idFeedback").innerText = "사용 불가능 합니다"; */
								document.getElementById("idAllowedNyTwo").value = 0;
								alert("아이디가 중복되었습니다");
							}
						}
					})
				}
		else{
			document.getElementById("zbmmID").classList.remove('is-valid');
			document.getElementById("zbmmID").classList.add('is-invalid');
			document.getElementById("idAllowedNyTwo").value = 0;
		}
	
	
	});
	
	$(document).ready(function(){
		$("#domain-list").change(function(){
			/* console.log("값변경테스트: " + $(this).val()); */
			/* alert($(this).val()) */
			var opMainV = $(this).val();
			if(opMainV == 'type'){
				$("#domain-list").replaceWith("<input type='text' class='form-control' id='domain-list'></input>");
			}
		});
	 }); 
	
	var timer = null;
	var isRunning = false;
	var resultV = 0;
	$("#mailAuth").on("click",function(e){
		const email = $('#email').val() + '@' + $('#domain-list').val();
		$('input[name=zbmmEmail]').val(email)
		if(!email_check(email)){
			alert("이메일 형식에 맞게 입력해주세요");
		} else{
				$.ajax({
					async: true 
					,cache: false
					,type: "post"
					/* ,dataType:"json" */
					,url: "/checkEmail"
					/* ,data : $("#formLogin").serialize() */
					,data : { "zbmmEmail" : email }
					,success: function(response) {
						if(response.rt == "success") {
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
								if(inputCode == $('#hiddenCheck').val() && $('#hiddenCheck').val() != ''){
									$resultMsg.html('인증번호가 일치합니다.');
									$resultMsg.css('color','green');
									$('#mail-Check-Btn').attr('disabled',true);
									$('#userEamil1').attr('readonly',true);
									$('#userEamil2').attr('readonly',true);
									$('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
							        $('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
							        $('#emailAuthAllowedYn').val("");
							        $('#emailAuthAllowedYn').val("1");
								}else{
									$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
									$resultMsg.css('color','red');
									$('#emailAuthAllowedYn').val("");
							        $('#emailAuthAllowedYn').val("0");
								}
							})
						} else {
							alert("이메일이 중복되었습니다");
						}
					}
				})
			}
		});
	
	
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
	
	//-------- 유효성 검사 ---------//
	  // { 아이디 } input 유효성 검사
	  
	  // { 비밀번호 } input 유효성 검사  
	  function passwordFn () {
		 
		// 비밀번호 자리수
	    if( isMoreThan7Length(elPassword.value) ) {
	      elPWFailureLeng.classList.add('hide');
	    } else {
	      elPWFailureLeng.classList.remove('hide');
	    }
		// 
	    if( (isPasswordEng(elPassword.value) + isPasswordNum(elPassword.value) + isPasswordSpeci(elPassword.value) >= 2) &&
	        (isPasswordBlank(elPassword.value)) &&
	        (isPasswordChar(elPassword.value)) 
	      ) {
	      elPWFailureComb.classList.add('hide');
	    } else {
	      elPWFailureComb.classList.remove('hide');
	    }
	    if( isPasswordRepeat(elPassword.value) ) {
	      elPWFailureContn.classList.remove('hide');
	    } else {
	      elPWFailureContn.classList.add('hide');
	    }
	    if( (isMoreThan7Length(elPassword.value)) && 
	        (isPasswordEng(elPassword.value) + isPasswordNum(elPassword.value) + isPasswordSpeci(elPassword.value) >= 2) && 
	        (isPasswordChar(elPassword.value)) && 
	        (isPasswordBlank(elPassword.value)) && 
	        (!isPasswordRepeat(elPassword.value))
	      ) {
	    	
	    	document.getElementById("password").classList.remove('is-invalid');
		    document.getElementById("password").classList.add('is-valid');
		      
	      	/* elPWSuccessMessage.classList.remove('hide'); */
	    } else {
	    	
	    	document.getElementById("password").classList.remove('is-valid');
			document.getElementById("password").classList.add('is-invalid');
	      	/* elPWSuccessMessage.classList.add('hide'); */
	      	
	    }
	  }
	  elPassword.addEventListener('click', passwordFn)
	  elPassword.addEventListener('keyup', passwordFn)
	  elPassword.addEventListener('keyup', passwordRetypeFn)
		
	  // { 비밀번호 확인 } input 유효성 검사
	  function passwordRetypeFn() {
		  if(document.getElementById("password").value == null && document.getElementById("password").value == ""){
		  } else{
			  if( isMatch(elPassword.value, elPasswordRetype.value) && isPasswordBlank(elPasswordRetype.value) ) {
			      //console.log('두 비밀번호가 동일하다..');
			      document.getElementById("passwordCheck").classList.remove('is-invalid');
			      document.getElementById("passwordCheck").classList.add('is-valid');
			      elPWRetypeFailureMsg.classList.add('hide');
			     /*  elPWRetypeSuccessMsg.classList.remove('hide'); */
			    } else {
			      //console.log('두 비밀번호가 다르다...!!!');
			      elPWRetypeFailureMsg.classList.remove('hide');
			      /* elPWRetypeSuccessMsg.classList.add('hide'); */
			      
			      document.getElementById("passwordCheck").classList.remove('is-valid');
					document.getElementById("passwordCheck").classList.add('is-invalid');
			    }
		  }
	  }
	  elPasswordRetype.onclick = passwordRetypeFn;
	  elPasswordRetype.onkeyup = passwordRetypeFn;
	  
	  //-------- 최종 유효성 검사에서 사용하는 함수다 ---------//	  
	
	//-------- 유효성 검사에서 사용하는 함수다 ---------//
	  // [아이디] 길이가 4자 이상이면 true를 리턴하는 함수
	  function isMoreThan4Length(value) {
	    // 아이디 입력창에 사용자가 입력을 할 때 
	    // 글자 수가 4개이상인지 판단한다.
	    // 글자가 4개 이상이면 success메세지가 보여야 한다.
	    return value.length >= 4;
	  }
	  // [아이디] '영문, 숫자'만 있으면 true를 리턴하는 함수
	  function isUserNameChar(username) {
	    var letters = /^[A-Za-z0-9]+$/;
	    if( username.match(letters) ) {
	      return true;
	    } else {   
	      return false;
	    }
	  }
	  // [비밀번호] 길이가 10자 이상이면 true를 리턴하는 함수
	  function isMoreThan7Length (password) {
	    return password.length >= 7;
	  }
	  // [비밀번호] 영문이 있으면 true를 리턴하는 함수
	  function isPasswordEng (password) {
	    var letters = /[A-Za-z]/; // 잘 모르겠지만 이것은 정규표현식으로 AZ - az 모든 알파벳을 담고 있다.
	    
	    if( letters.test(password) ) {  // 정규표현식에 영어문자가 모두 들었고. 정규표현식의 메소드인 test()로 비밀번호 문자에 영어가 있는지 판단한다.
	      return true;
	    } else {
	      return false;
	    }
	  }
	  // [비밀번호] 숫자가 있으면 true를 리턴하는 함수
	  function isPasswordNum (password) {
	    var letters = /[0-9]/;
	    
	    if( letters.test(password) ) {
	      return true;
	    } else {
	      return false;
	    }
	  }
	  // [비밀번호] 특수문자가 있으면 true를 리턴하는 함수
	  function isPasswordSpeci (password) {
	    var letters = /[~!@#$%^&*()\-_=+\\\|\[\]{};:\'",.<>\/?]/;
	    
	    if( letters.test(password) ) {
	      return true;
	    } else {
	      return false;
	    }
	  }
	  // [비밀번호][비밀번호 확인] 스페이스가 없을 경우 true를 리턴하는 함수
	  function isPasswordBlank (password) {
	    if( password.search(/\s/) === -1 ) {
	      return true;
	    } else {
	      return false;
	    }
	  }
	  // [비밀번호] '영문, 숫자, 특수문자'만 있으면 true를 리턴하는 함수
	  function isPasswordChar(password) {
	    var letters = /^[A-Za-z0-9~!@#$%^&*()\-_=+\\\|\[\]{};:\'",.<>\/?]+$/;
	    if( password.match(letters) ) {
	      //console.log('가능한 것만 있네!');
	      return true;
	    } else {
	      //console.log('안되는 것도 있네?');
	      return false;
	    }
	  }
	  // [비밀번호] 동일한 숫자 3개 이상 연속 사용하면 true를 리턴하는 함수
	  function isPasswordRepeat (password) {
	    // password의 길이만큼 반복되는 반복문이 있어야 한다.
	    // 문자 하나와 나 자신+1과 나자신 +2와 비교한다.
	    // 숫자인지 아닌지 판단한다.숫자이면 true 아니면 false
	    for( let i=0; i<password.length-2; i++ ) {
	      if( password[i]===password[i+1] && password[i]===password[i+2] ) {
	        if( !isNaN(Number(password[i])) ) {
	          return true;
	        }
	      }
	    }
	    return false;
	  }
	  // [비밀번호 확인] 매치가 동일하면 true를 리턴하는 함수
	  function isMatch (password1, password2) {
	    if( password1 && password2 ) {
	      if(password1 === password2) {
	        return true;
	      }
	    } else {
	      return false;
	    }
	  }
	  
	  //이메일 정규식
	  function email_check(email) {
			var reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			return reg.test(email);
		}
	  
	  // 이미지 업로드
	  const fileDOM = document.querySelector('#uploadedImage');
	  const preview = document.querySelector('.profileImg');
	  fileDOM.addEventListener('change', () => {
	    const reader = new FileReader();
	    reader.onload = ({ target }) => {
	      preview.src = target.result;
	    };
	    reader.readAsDataURL(fileDOM.files[0]);
	  });
	  
</script>



</body>
</html>