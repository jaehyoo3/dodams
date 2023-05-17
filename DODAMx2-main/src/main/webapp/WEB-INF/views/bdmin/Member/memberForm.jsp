<!<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<html>
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="/resources/css/bdmin/bdmin.css">
	    <title>DoDam.X2</title>
	</head>
	<body>
	<form name="form" id="form">
	
	    <!-- 상단 네비게이션/사이드메뉴 s -->
		<%@include file="../../include/Bdmin/sideMenu.jsp" %>
	    <!-- 상단 네비게이션/사이드메뉴 e -->
	    <div class="container">
	    	<div class="form-wrap">
	    		<p>MemberSeq </p>
 			    <div class="img-wrap">
		    	</div>
	    		<p>아이디 *</p>
	    		<input type="text" name="zbmmID" value="<c:out value="${item.zbmmID }"/> ">
	    		<p>이름 *</p>
	    		<input type="text" name="zbmmName"  value="<c:out value="${item.zbmmName }"/> ">
	    		<p>이메일 *</p>
	    		<input type="text" name="zbmmEmail"  value="<c:out value="${item.zbmmEmail }"/> ">
	    		<p>회원번호 *</p>
	    		<input type="text" name="zbmmSeq" value="<c:out value="${item.zbmmSeq }"/> " readonly>
	    		<p>이메일 *</p>
	    		<input type="text">
	    		<p>지역</p>
	    		<select>
	    			<option>dd</option>
	    		</select>
	    		<p>회원 탈퇴 여부</p>
	    		<select>
	    			<option>dd</option>
	    		</select>
	    		<ul>
	    			<li>등록일: <input type="text" value="<fmt:formatDate value="${item.zbmmRegDate }" pattern="yyyy-MM-dd hh:mm:ss"/>"></li>
	    			<li>수정일: <input type="text"></li>
	    		</ul>
	    	</div>
	    	<div class='btn-wrap'>
	    	<ul>
	    		<li style="float:left;"><button class="leftColor">del</button></li>
	    		<li style="float:left;"><button class="leftColor">uel</button></li>
	    		
	    		<li style="float:right;"><button class="rightColor" type="button" id="btnSave" >commit</button></li>
	    		
	    		<li style="float:right;"><button class="rightColor" id="btnList">list</button></li>
	    	</ul>	    	
	    </div>
	    </div>
	    </form>
		<form name="formVo">
		<input type="hidden" name="zbmmSeq"  value="<c:out value="${vo.zbmmSeq}"/>"/>
		</form>
	    
	    <!-- 스크립트영역 s -->
		<%@include file="../../include/All/JSLink.jsp" %>
		<!-- 스크립트영역 e -->
		<script >
		var seq = $("input:hidden[name=zbmmSeq]"); 
		var form = $("form[name=form]");
		var formVo = $("form[name=formVo]");
		
		var goUrlList = "/bdmin/MemberList"; 			/* #-> */
		var goUrlInst = "/bdmin/MemberInst"; 			/* #-> */
		var goUrlUpdt = "/bdmin/MemberUpdate";				/* #-> */
		var goUrlUele = "/bdmin/MemberUelete";				/* #-> */
			
		$("#btnList").on("click", function(){
			form.attr("action", goUrlList).submit();
		}); 
			
			
		$("#btnSave").on("click", function(){
		if (seq.val() == "0" || seq.val() == ""){
	   		// insert
	   		form.attr("action", goUrlInst).submit();
	   	} else {
	   		// update
	   		/* keyName.val(atob(keyName.val())); */
	   		form.attr("action", goUrlUpdt).submit();
	   	}
	}); 
	
	$("#btnUelete").on("click", function(){
		$("input:hidden[name=exDeleteType]").val(1);
		$(".modal-title").text("확 인");
		$(".modal-body").text("해당 데이터를 삭제하시겠습니까 ?");
		$("#btnModalUelete").show();
		$("#btnModalDelete").hide();
		$("#modalConfirm").modal("show");
	});
	

	$("#btnDelete").on("click", function(){
		$("input:hidden[name=exDeleteType]").val(2);
		$(".modal-title").text("확 인");
		$(".modal-body").text("해당 데이터를 삭제하시겠습니까 ?");
		$("#btnModalUelete").hide();
		$("#btnModalDelete").show();
		$("#modalConfirm").modal("show");
	});
	
	
	
	$("#btnModalDelete").on("click", function(){
		$("#modalConfirm").modal("hide");
		formVo.attr("action", goUrlDele).submit();
	});
	
	
	
	
	$("#btnModalUelete").on("click", function(){
		$("#modalConfirm").modal("hide");
		formVo.attr("action", goUrlUele).submit();
	});
	
		</script>
	</body>
</html>