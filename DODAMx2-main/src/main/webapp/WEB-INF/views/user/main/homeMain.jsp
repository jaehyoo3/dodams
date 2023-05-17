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
   	<link rel="stylesheet" href="/resources/css/user/HomeMain.css">
   	<link rel="shortcut icon" href="/resources/images/favicon2.ico" type="image/x-icon">
	<link rel="icon" href="/resources/images/favicon2.ico" type="image/x-icon">
    <title>DODAM</title>
</head>
<body>
<!-- Navbar s  -->
<%@include file="../../include/user/homeNav.jsp"%>
<!-- Navbar e  -->
<div class="background">
    <div class="spaceWrap">
        <div class="spaceEnter">
            <h1>SPACE</h1>
            <ul class="itembody">
            	<form name="form" method="get">
            	<input type="hidden" name="zbmmSeq" value="<c:out value="${sessSeq}"/>" >
				<input type="hidden" name="zbspSeq">
	            <c:forEach items="${list}" var="list" varStatus="status">
	            	<c:if test="${list.zbsiInviteNy ne 1 }"><li class="item" onclick="location.href='javascript:gospace(<c:out value="${list.zbspSeq}"/>)'"><c:out value="${list.zbspName }"/></li></c:if>
	        	</c:forEach>   
	               <!--  <li class="item">리스트가 들어오는 구역</li> -->
	                <div class="btnWrap">
	                	<a href name="gospace"></a>
	                    <div class="item" id="spaceForm">+</div>
	                </div>
	        	</form>
            </ul>
        </div>
    </div>
</div>
<div class="bdcontainer">
    <h1>다른사람들의 스페이스를 확인해보세요</h1>
    <div class="image-container">
      <c:forEach items="${randView}" var="randList" varStatus="status" end="5">
		<c:if test="${status.index % 3 == 0 }">
			<div class="filler-large"onclick="location.href='/spaceMain?zbspSeq=<c:out value="${randList.zbspSeq }"/>'">
	         	<c:choose>
	         		<c:when test="${randList.path ne null}"><img class="bdimgbox" src="<c:out value="${randList.path}"/><c:out value="${randList.uuidName}"/>"></c:when>
		         	<c:otherwise> <img class="bdimgbox" src="https://cdn.pixabay.com/photo/2017/10/25/12/33/rocket-2887845_960_720.png"></c:otherwise>
	         	</c:choose>
	            <ul class="imgtextbox">
	                <li>이름:<c:out value="${randList.zbspName}"/></li>
	                <li>평점:<c:out value="${randList.zbspavg}"/></li>
	            </ul>
	       	</div>
		</c:if>
		<c:if test="${status.index % 3 != 0 }">
			<div class="filler-medium" onclick="location.href='/spaceMain?zbspSeq=<c:out value="${randList.zbspSeq }"/>'">
				<c:choose>
	         		<c:when test="${randList.path ne null}"><img class="bdimgbox" src="<c:out value="${randList.path}"/><c:out value="${randList.uuidName}"/>"></c:when>
		         	<c:otherwise> <img class="bdimgbox" src="https://cdn.pixabay.com/photo/2017/10/25/12/33/rocket-2887845_960_720.png"></c:otherwise>
	         	</c:choose>
	            <ul class="imgtextbox">
	                <li>이름:<c:out value="${randList.zbspName}"/></li>
	                <li>평점:<c:out value="${randList.zbspavg}"/></li>
	            </ul>
			</div>
		</c:if>
     </c:forEach>
    </div>
</div>
<div class="comentWrap">
    <div class="coment">
        <div class="imgbox">
            <img src="https://cdn-icons-png.flaticon.com/512/2204/2204726.png">
        </div>
        <div class="textbox">
            <h1>DODAM에서 여행 계획을 세워보세요</h1>
            <h2>새로운 세상이 펼쳐집니다. </h2><br><br>
            <p>여행을 계획하고 출발 할 준비가 되었나요? <br>지도에 핀을 꽂고 여행계획을 세워보세요</p>
        </div>
    </div>
    <div class="coment" style="background:#f5f5f5;">
        <div class="textbox">
            <h1>DODAM에서는 경비계산 어렵지않습니다.</h1>
            <h2>멤버들과 쉽게 나누고 분배하세요</h2><br><br>
            <p>언제 어디서 사용했나요? <br>사용내역을 등록하고 관리할 수 있습니다.</p>
        </div>
        <div class="imgbox">
            <img src="https://cdn-icons-png.flaticon.com/512/3136/3136007.png">
        </div>
        <br>
    </div>
    <div class="coment">
        <div class="imgbox">
            <img src="https://cdn-icons-png.flaticon.com/512/2665/2665393.png">
        </div>
        <div class="textbox">
            <h1>멤버들과 채팅</h1>
            <h2>멤버들과 대화를 나누며 설레는 여행을 기다려보세요</h2><br><br>
            <p>여행을 떠날 시간이 얼마 남지 않았습니다<br>무료로 스페이스 멤버들과 채팅을 나눠보세요</p>
        </div>
    </div>
    <div class="coment" style="background:#f5f5f5;">
        <div class="textbox">
            <h1>스페이스는 준비되어있습니다.</h1>
            <h2>지금바로 여행을 떠나보세요</h2><br><br>
            <p>이 모든것을 지금 바로 확인해보세요.</p>
        </div>
        <div class="imgbox">
            <img src="https://cdn-icons-png.flaticon.com/512/2687/2687017.png">
        </div><br>
    </div>
    <div class="buttonarea">
    	<button type="button" onClick="location.href='spaceForm'">스페이스 생성</button>
    </div>
</div>
<footer>
    <p>DODAM</p>
    <ul class="info">
        <li>copyright © all rights reserved</li>
        <li></li>
        <li></li>
    </ul>
</footer>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://kit.fontawesome.com/86d85c3d85.js" crossorigin="anonymous"></script>
<script type="text/javascript">
	var goUrlSpace = "/spaceMain";
	var goUrlSpaceReg = "/SpaceInst"
	var seq = $("input:hidden[name=zbspSeq]");
	var form = $("form[name=form]");
	
	$('#spaceForm').on("click", function() {
		gospace(0);                
	});
	
	function gospace(keyValue){
    	seq.val(keyValue);
		form.attr("action",goUrlSpace).submit();
	}
    
    //소개영역 js
    
    let observer = new IntersectionObserver((e)=>{
            e.forEach((box)=>{
                if(box.isIntersecting){
                    box.target.style.opacity = 1;
                    box.target.style.transform = 'translateY(-27%)';
                }else{
                    box.target.style.opacity = 0;
                    box.target.style.transform = 'translateY(-15%)';
                }
            });
        });
        let box = document.querySelectorAll(".coment")
        observer.observe(box[0])
        observer.observe(box[1])
        observer.observe(box[2])
        observer.observe(box[3])
        //감시해주는 객체


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
        
	//초대장 모달영역
     	const modal = document.querySelector(".modal");
		const openModalBtn = document.querySelector("#open-modal");
		const closeModalBtn = document.querySelector("#close-modal");
		const closeBtn = document.querySelector("#closeBtn");
		openModalBtn.addEventListener("click", function () {
		modal.style.display = "block";
		});
		
		closeModalBtn.addEventListener("click", function () {
		modal.style.display = "none";
		});
		 
	//초대장 거절ajax	
		function inviteN(keyValue) {
			$.ajax({
				async: false
				,cache: false
				,type: "post"
				,url: "/inviteN"
				,data: {"zbsiSeq" : JSON.stringify(keyValue)} 
 				,success: function(response) {
					if(response.rt == "success") {
						alert("초대를 거절했습니다.");
						$('#closeNew').load(window.location.href + ' #closeNew')
						window.location.reload();
					}else{
						alert("오류");
					}
				}
				,error : function(jqXHR, textStatus, errorThrown){
					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
				}
			});
		}
		
	//초대장 수락ajax
		function inviteY(keyValue) {
			$.ajax({
				async: false
				,cache: false
				,type: "post"
				,url: "/inviteY"
				,data: {"zbsiSeq" : JSON.stringify(keyValue)} 
 				,success: function(response) {
					if(response.rt == "success") {
						alert("초대를 수락완료");
						$('#closeNew').load(window.location.href + ' #closeNew')
						window.location.reload();
					}else{
						alert("오류");
					}
				}
				,error : function(jqXHR, textStatus, errorThrown){
					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
				}
			});
		}		
		
        
    </script>
</body>
</html>
