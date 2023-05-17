<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<%@ page session="true" %>

<!doctype html>
<html lang="ko">
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>로그인</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="/resources/favicon/favicon.jpg" />
    <link rel="stylesheet" href="/resources/css/user/login.css">
    <style type="text/css">
    	
    
    </style>
</head>
<body>

<!-- start --> 
<div class="container">
        <h2><a href="/main">DODAM</a></h2>
        <div class="typing-demo">
            Let's go to space!
        </div>
        <div class="loginBox">
            <div class="box-input">
                <input type="text" id="id" onkeyup="enterkey();" placeholder="아이디" value="yee">
                <input type="password" id="pwd" onkeyup="enterkey();" placeholder="비밀번호" value="test">
                <div class="box-chk">
                    <input type="checkbox" id="chklogin">
                    <label for="chklogin">자동로그인</label>
                </div>
                <button type="button" id="btnLogin" name="btnLogin">로그인</button>    
            </div>
            <div id="g_id_onload"
		        data-client_id="439405612766-b9ou12ubgfp9hemasfq03rn8h075l90o.apps.googleusercontent.com"
		        data-callback="handleCredentialResponse">
		   </div>
            <p>소셜아이디로 로그인</p>
            <ul class="loginbtnWrap">
                <li class="loginbtn" id="naverIdLogin"><img class="loginbtn_img" src="https://cdn-icons-png.flaticon.com/512/8142/8142645.png"></li>
                <li class="loginbtn" id="kakaoBtn"><img class="loginbtn_img" src="https://cdn-icons-png.flaticon.com/512/4494/4494622.png"></li>
                <li class="loginbtn g_id_signin" data-type="standard" id="buttonDiv"></li>
            </ul>
        </div>
        <ul class="info">
            <li><a href="find">비밀번호 찾기</a></li>
            <li><a href="find">아이디 찾기</a></li>
            <li><a href="/signup">회원가입</a></li>
        </ul>
    </div>
	<form name="form">
		<input type="hidden" name="snsId"/>
		<input type="hidden" name="zbmmMobile"/>
		<input type="hidden" name="zbmmEmail"/>
		<input type="hidden" name="zbmmName"/>
		<input type="hidden" name="token"/>
		<input type="hidden" name="zbmmSocialType"/>
		<input type="hidden" name="snsImg"/>
	</form>
</section>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<!-- end -->
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script src="https://accounts.google.com/gsi/client" async defer></script>
		<script type="text/javascript">
		
		// 구글 로그인 Start_______________________________________________________________________
		function parseJwt (token) {
		    var base64Url = token.split('.')[1];
		    var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
		    var jsonPayload = decodeURIComponent(atob(base64).split('').map(function(c) {
		        return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
		    }).join(''));
			console.log("test: " + jsonPayload)
			// json으로 되어있는 데이터 읽을 수 있게 바꾸기
		    return JSON.parse(jsonPayload);
		};
		
		function handleCredentialResponse(response) {
			const responsePayload = parseJwt(response.credential);
		    console.log("ID: " + responsePayload.sub);
		    console.log('Full Name: ' + responsePayload.name);
		    console.log('Given Name: ' + responsePayload.given_name);
		    console.log('Family Name: ' + responsePayload.family_name);
		    console.log("Image URL: " + responsePayload.picture);
		    console.log("Email: " + responsePayload.email); 
	        console.log("Encoded JWT ID token: " + response.credential);
	        // 데이터 전송
	        $.ajax({
				async: true
				,cache: false
				,type:"POST"
				,url: "/snsLoginProc"
				,data: {"zbmmID":responsePayload.name, "zbmmEmail":responsePayload.email,"snsImg":responsePayload.picture,"zbmmName":responsePayload.name,"zbmmSocialType":"3"}
				,success : function(response) {
					if (response.rt == "fail") {
						alert("해당 이메일로 가입한 계정이 있습니다");
						return false;
					} else if(response.rt == "success"){
						window.location.href = "/main";
					}
				},
				error : function(jqXHR, status, error) {
					alert("알 수 없는 에러 [ " + error + " ]");
				}
			});
	     }
	    // 버튼 커스텀
        window.onload = function () {
          google.accounts.id.initialize({
            client_id: "439405612766-b9ou12ubgfp9hemasfq03rn8h075l90o.apps.googleusercontent.com",
            callback: handleCredentialResponse
          });
          google.accounts.id.renderButton(
            document.getElementById("buttonDiv"),
            { theme: "outline", size: "large", type:"icon" ,shape:"pill"}
          );
          google.accounts.id.prompt();
        }
     // 구글 로그인 end_______________________________________________________________________
		function loginAjax(){
			$.ajax({
				async: true 
				,cache: false
				,type: "post"
				,url: "/loginProc"
				,data : { "zbmmID" : $("#id").val(), "zbmmPW" : $("#pwd").val()}
				,success: function(response) {
					if(response.rt == "success") {
						location.href = "/main";
					} else {
						alert("로그인 실패");
					}
				}
				,error : function(jqXHR, textStatus, errorThrown){
					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
				}
			});
		}
		
		$("#btnLogin").on("click", function(){
			loginAjax();
		});
		
		//엔터키 로그인
		function enterkey() {
	       if(window.event.keyCode == 13) {
			loginAjax();
	       	}
		}
			
			
			Kakao.init('1c3e148b9d3b6d9eee46fb31507354ea'); // test 용
			console.log(Kakao.isInitialized());
			$("#kakaoBtn").on("click", function() {
				/* Kakao.Auth.authorize({
				      redirectUri: 'http://localhost:8080/member/kakaoCallback',
				    }); */
				
				Kakao.Auth.login({
				      success: function (response) {
				        Kakao.API.request({
				          url: '/v2/user/me',
				          success: function (response) {
				        	  
				        	  var accessToken = Kakao.Auth.getAccessToken();
				        	  Kakao.Auth.setAccessToken(accessToken);

				        	  var account = response.kakao_account;
				        	  
				        	  console.log(response)
				        	  console.log(accessToken);
				        	 /*  alert("email : " + account.email);
				        	  alert("name : " + account.name); //
				        	  alert("name : " + account.phone_number); //
				        	  alert("nickname : " + account.profile.nickname);
				        	  alert("picture : " + account.profile.thumbnail_image_url);
				        	  alert("picture : " + account.gender); */
				        	  $("input[name=snsId]").val(account.profile.nickname);
				        	  $("input[name=zbmmMobile]").val(account.profile.phone_number);
				        	  $("input[name=zbmmEmail]").val(account.email);
				        	  $("input[name=zbmmName]").val(account.profile.name);
				        	  $("input[name=token]").val(accessToken);
				        	  $.ajax({
							async: true
							,cache: false
							,type:"POST"
							,url: "/snsLoginProc"
							,data: {"zbmmID": $("input[name=snsId]").val(), "zbmmMobile": $("input[name=zbmmMobile]").val(), "zbmmEmail": $("input[name=zbmmEmail]").val(),"token": $("input[name=token]").val(),"zbmmName":$("input[name=zbmmName]").val(),"zbmmSocialType":"1"}
							,success : function(response) {
								if (response.rt == "fail") {
									alert("해당 이메일로 가입한 계정이 있습니다");
									return false;
								} else if(response.rt == "success"){
									window.location.href = "/main";
								} 
							},
							error : function(jqXHR, status, error) {
								alert("알 수 없는 에러 [ " + error + " ]");
							}
						});
				          },
				          fail: function (error) {
				            console.log(error)
				          },
				        })
				      },
				      fail: function (error) {
				        console.log(error)
				      },
				    })
			});


			// nnnnnnnaaaaavvvveeeeerrrr

					var naverLogin = new naver.LoginWithNaverId(
						{
							clientId: "UknTHyg5AxKlx93f9kKY",
							callbackUrl: "http://localhost:8089/login",
							isPopup: false,
							callbackHandle: true,
						}
					);
					naverLogin.init();	
					$("#naverIdLogin").on("click", function() {
			   			naverLogin.getLoginStatus(function (status) {
			  				if (!status) {
			  					naverLogin.authorize();
			  				} else {
								setLoginStatus();
			  				}
			  			});
					})
					window.addEventListener('load', function () {
						if (naverLogin.accessToken != null) { 
				  			naverLogin.getLoginStatus(function (status) {
				  				if (status) {
				  					setLoginStatus();
				  				}
			  				});
						}
			   		});
			   		function setLoginStatus() {
						$.ajax({
							async: true
							,cache: false
							,type:"POST"
							,url: "/snsLoginProc"
							,data: {"zbmmID": naverLogin.user.nickname, "zbmmMobile": naverLogin.user.mobile, "zbmmEmail": naverLogin.user.email,"snsImg": naverLogin.user.profile_image,"zbmmName":naverLogin.user.name,"zbmmSocialType":"2"}
							,success : function(response) {
								if (response.rt == "fail") {
									alert("해당 이메일로 가입한 계정이 있습니다");
									return false;
								} else if(response.rt == "success"){
									window.location.href = "/main";
								}
							},
							error : function(jqXHR, status, error) {
								alert("알 수 없는 에러 [ " + error + " ]");
							}
						});
					}
			   		
		</script>
	</body>
</html>