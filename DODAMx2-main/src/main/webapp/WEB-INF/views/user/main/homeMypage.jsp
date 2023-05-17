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
	<link rel="stylesheet" href="/resources/css/user/homeMypage.css">
    <title>DODAMDODAM</title>
</head>
<body>
<form name="form">
<input type="hidden" name="zbmmSeq" value="<c:out value="${sessSeq}"/>" >
<!-- Navbar s  -->
<%@include file="../../include/user/homeNav.jsp"%>
<!-- Navbar e  --> 
<div class="background">
    <h1>My Page</h1>
    <h2>회원님의 소중한 정보를 조회/수정하실 수 있습니다.</h2>
</div>
<div class="main-container">
    <div class="selectbox">
        <div class="boxitem">
            <div class="icon">
                <img src="https://cdn-icons-png.flaticon.com/512/3076/3076343.png">
            </div>
            <ul class="setlist">
                <li>회원정보 수정</li>
                <li>고객님의 회원정보를 수정할 수 있습니다.</li>
                <li><button onclick="javascript:goForm(<c:out value="${sessSeq }"/>)">Move</button></li>
            </ul>
        </div>
        <div class="boxitem">
            <div class="icon">
                <img src="https://cdn-icons-png.flaticon.com/512/4929/4929204.png">
            </div>
            <ul class="setlist">
                <li>나의 스페이스</li>
                <li>나의 스페이스를 확인 할 수 있습니다.</li>
                <li><button type="button"onclick="location.href='/Mypage/SpaceList?zbmmSeq=<c:out value="${sessSeq}"/>'">Move</button></li>
            </ul>
        </div>
        <div class="boxitem">
            <div class="icon">
                <img src="https://cdn-icons-png.flaticon.com/512/3596/3596141.png">
            </div>
            <ul class="setlist">
                <li>회원탈퇴신청</li>
                <li>고객님의 회원정보를 수정할 수 있습니다.</li>
                <li><button>Move</button></li>
            </ul>
        </div>
        <div class="boxitem">
            <div class="icon">
                <img src="https://cdn-icons-png.flaticon.com/512/3076/3076343.png">
            </div>
            <ul class="setlist">
                <li>기타 추가사항</li>
                <li>추가할거 있으면 추가해</li>
                <li><button>Move</button></li>
            </ul>
        </div>
    </div>
</div>
</form>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://kit.fontawesome.com/86d85c3d85.js" crossorigin="anonymous"></script>
<script>
var form = $("form[name=form]");
var seq = $("input:hidden[name=zbmmSeq]");
var goUrlForm = "/Mypage/Mod";
	goForm = function(keyValue) {
	/* if(keyValue != 0) seq.val(btoa(keyValue)); */
	seq.val(keyValue);
	form.attr("action", goUrlForm).submit();
	}	
	
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

    </script>   
	</body>
</html>

