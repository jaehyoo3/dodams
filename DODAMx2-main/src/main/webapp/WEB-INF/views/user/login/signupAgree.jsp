<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<%@ page session="false" %>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>회원가입</title>
<!-- favicon -->
<link rel="icon" type="image/x-icon" href="/resources/favicon/favicon.jpg" />



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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

<style type="text/css">
	
	.ch{
	 width: 48%;
	}
	@font-face {
	    font-family: 'SUIT-Medium';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Medium.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
	}
	*{
	    font-family: 'SUIT-Medium';
	}
	.borderOne{
		width:100%;
		height:40%; 
	}
	.borderTwo{
		width:100%;
		height:20%;
	}
	.colorLogo{
		color: #FF4A4A;
	}
	.btn-danger{
		background-color: #FF4A4A;
	}
	label,p{
		display: inline-block;
	}
	.allCheckSub{
		font-size:12px;
		color: gray;
	}
	.col{
		width: 70%;
	}
	.container{
	 width: 60%;
	}
</style>
</head>
<body>
	<form method="post" action="signup"></form>
	<!-- start -->
	<section style="background:url('/resources/images/login_background.jpg'); background-size: cover; height: 100%; background-attachment: fixed;">
		<div class="container">
			<div class="row d-flex justify-content-center h-100 mt-5">
				<div class="col-12 col-md-8 col-lg-6">
					<div class="d-flex justify-content-center mb-5">
						<a href="#"><img class="icon" src="/resources/images/icon.PNG"></a>
					</div>
					<div class="borderOne border d-flex align-items-center">
						<input type="checkbox" id="allCheck" class="ms-3"/>
						<div class="ms-3">
							<label for="allCheck" class="mb-0">모두 동의합니다</label>
							<div>
								<p class="allCheckSub mb-0">이용약관, 개인정보 수집 및 이용, 처리 위탁에 모두 동의합니다.</p>
							</div>
						</div>
					</div>
					<div class="border borderTwo border-top-0 pt-3">
						<input type="checkbox" id="checkOne" name="essentialChk" class="mb-0 ms-3"/>
						<label for="checkOne" class="ms-3">개인정보 처리 위탁 동의<p class="colorLogo mb-0 mt-2 ms-1">(필수)</p></label>
						<button type="button" class="btn rounded-circle float-end" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa-regular fa-plus"></i></button>
						<!-- Modal -->
						<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							 <div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
										<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">...</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
									</div>
								</div>
							</div> 
						</div>
					</div>
					<div class="border borderTwo border-top-0 pt-3">
						<input type="checkbox" id="checkTwo" name="essentialChk" class="mb-0 ms-3"/>
						<label for="checkTwo" class="ms-3">개인정보 수집 및 이용 동의<p class="colorLogo mb-0 mt-2 ms-1">(필수)</p></label>
						<!-- Button trigger modal -->
						<button type="button" class="btn rounded-circle float-end" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa-regular fa-plus"></i></button>
						<!-- Modal -->
						<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							 <div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
										<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">...</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
									</div>
								</div>
							</div> 
						</div>
					</div>
					<div class="border borderTwo border-top-0 pt-3">
						<input type="checkbox" id="checkThree" name="essentialChk" class="mb-0 ms-3"/>
						<label for="checkThree" class="ms-3">sms수신동의<p class="colorLogo mb-0 mt-2 ms-1">(필수)</p></label>
						<button type="button" class="btn rounded-circle float-end" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa-regular fa-plus"></i></button>
						<!-- Modal -->
						<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							 <div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
										<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">...</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
									</div>
								</div>
							</div> 
						</div>
					</div>
					<div class="mt-5">
						<button type="button" class="btn btn-secondary ch">취소</button>
						<button type="button" class="btn btn-danger ms-3 ch" onclick="isAllCheck()"><p class="text-light mb-0">동의</p></button>
					</div>
					<!-- <div class="border border-dark borderTwo d-flex align-items-center border-top-0">
						<div>
							<input type="checkbox" id="checkTwo" class="mb-0 ms-3" />
							<label for="checkTwo" class="ms-3">개인정보 수집 및 이용 동의<p class="colorLogo mb-0 mt-2">(필수)</p></label>
						</div>
					</div>
					<div class="border border-dark borderTwo d-flex align-items-center border-top-0">
						<div>
							<input type="checkbox" id="checkThree" class="mb-0 ms-3"/>
							<label for="checkThree" class="ms-3">sms수신동의<p class="colorLogo mb-0 mt-1">(필수)</p></label>
						</div>
					</div> -->
				</div>
			</div>
			<br>
			<br>
		</div>
	</section>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#allCheck").click(function() {
			if($("#allCheck").is(":checked")) $("input[name=essentialChk]").prop("checked", true);
			else $("input[name=essentialChk]").prop("checked", false);
		});

		$("input[name=essentialChk]").click(function() {
			var total = $("input[name=essentialChk]").length;
			var checked = $("input[name=essentialChk]:checked").length;

			if(total != checked) $("#allCheck").prop("checked", false);
			else $("#allCheck").prop("checked", true); 
		});
	});
	
	function isAllCheck() {  
		 /* while(checkbtn) { */	 
			if($("input:checked[id='checkOne']").is(":checked")
				&& $("input:checked[id='checkTwo']").is(":checked") 
				&& $("input:checked[id='checkThree']").is(":checked")){
				console.log("true");
				alert('완료');
				location.href = signup 
			 	/* checkbtn = false; */
			} else{
				console.log("false");
				alert("필수항목을 체크해주세요");
				/* break; */
				/* checkbtn = true; */
			}
	/* 	}  */
	}
	
	</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/50704cc15b.js" crossorigin="anonymous"></script>
</body>
</html>
