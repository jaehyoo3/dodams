<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<%@ page session="true"%>
<!DOCTYPE HTML>

<html>
	<head>
		<meta charset="uTF-8"> 
		<meta name ="viewport" content="width=device-width, initial-scaLe=1.0">
		<title>DODAM</title>
		<link rel="stylesheet" href="/resources/css/user/spaceDutch.css">
	</head>
	<body>
	<form method="post" action="/DutchPayInst">
		<input type="hidden" name="zbspSeq" value="<c:out value="${vo.zbspSeq }"/>">
	       	<%@include file="../../include/user/spaceHeader.jsp"%>
        	<div class="container">
		<%@include file="../../include/user/spaceSideBar.jsp"%>	   
            
			<!-- 더치페이 테이블s  -->
                <div class="mainWrap">
					<h1>더치페이 시작하기</h1><br>
					<div class="dutchTitle">
					    <img class="titleImgbox"src="https://cdn-icons-png.flaticon.com/512/2867/2867924.png" alt="">
					    <div class="titleContent">
					    <p>여행중 사용한 금액을 멤버들과 나눠보세요<br><span style="color: tomato;">식대,교통,숙소,etc</span> 네가지로 분류 되어있습니다.</p>
					    </div>
					</div><br>
					<div class="tableWrap">
	                    <table>
	                        <tr>
	                            <th class="th_checkbox">
	                                <input type="checkbox" name="" id="">
	                            </th>
	                            <th>사용분류</th>
	                            <th>인원수</th>
	                            <th>인당 예상비용</th>
	                            <th>영수증</th>
	                            <th>사용일</th>
	                        </tr>
	                        <c:forEach items="${dutchPay}" var="dutchPay">
		                        <tr>
		                            <td><input type="checkbox" name="" id=""></th>
		                            <td><c:out value="${dutchPay.zbdpDutchType}"/></td>
		                            <td><c:out value="${dutchPay.zbsiCnt}"/>명</td>
		                            <td><fmt:formatNumber value="${dutchPay.zbdpNcost}" pattern="###,###" />원</td>
		                            <td>ㅁㄴㅇ</td>
		                            <td><fmt:formatDate value="${dutchPay.zbdpDate}" pattern="yyyy-MM-dd"/>
		                            </td>
		                        </tr>
	                        </c:forEach>
	                    </table>
	                </div>
					<div class="addbtnWrap">
						<button type="button" >삭제하기</button>
						<button type="button" class="btn" id="open-modal">추가하기</button>
					</div>
				<!-- 더치페이 테이블e  -->
				
	     		<!-- 추가모달영역s -->
	             <div class="modal">
	                 <div class="modal-content">
	                     <div class="receipt-modal-header">
	                         <h3>RECEIPT</h3>
	                         <span id="close-modal">&times;</span><hr>
	                     </div>
	                     <h4>리스트명을 입력하세요</h4>
	                     <div class="list_name">
	                         <input type="text" name="zbdpTitle">
	                     </div>
	                     <h4>어떤곳에 사용했나요?</h4>
	                     <div class="modal-body">
	                         <ul class="modal_catagory">
	                             <li><input type="radio" name="zbdpDutchType" value="17" id="Fooddutch">
		                             <label for="Fooddutch" class="dutchItem">
		                             	<img src="https://cdn-icons-png.flaticon.com/512/2145/2145916.png">
	                             	 </label>
	                             </li>
	                             <li><input type="radio" name="zbdpDutchType" value="18" id="cardutch">
	                             	<label for="cardutch" class="dutchItem">
		                             	<img src="https://cdn-icons-png.flaticon.com/512/1048/1048313.png">
	                             	 </label>
	                             </li>
	                             <li><input type="radio" name="zbdpDutchType" value="19" id="hotteldutch">
	                             	<label for="hotteldutch" class="dutchItem">
		                             	<img src="https://cdn-icons-png.flaticon.com/512/1946/1946788.png">
	                             	 </label>
	                             </li>
	                             <li><input type="radio" name="zbdpDutchType" value="20" id="etcdutch">
	                             	<label for="etcdutch" class="dutchItem">
		                             	<img src="https://cdn-icons-png.flaticon.com/512/8667/8667025.png">
		                             	<p>ETC</p>
	                             	 </label>
	                             </li>
	                         </ul>                                        
	                     </div>
	                     <h4>누구랑 사용했나요?</h4>
	                     <div class="modal-body">
	                         <ul class="modal_people">
	                          <c:forEach items="${list}" var="list">
	                          	<input type="hidden" name="zbsiSeq" value="<c:out value="${list.zbsiSeq}" />">
	                            <li><input type="checkbox" name="memberID" id="UserID" onchange="inputValueChange();"><c:out value="${list.zbmmID}" /></li>
	                          </c:forEach>     
	                         </ul>                            
	                     </div>
	                     <h4>영수증이 있다면 첨부해보세요</h4>
	                     <div class="modal-img">
	                         <span>영수증 사진 들어가는 곳</span>
	                         <input type="file" name="" id="">                                
	                     </div>
	                     <div class="modal-btn">
	                         <ul class="total">
	                             <li>총 비용:<input type="text" id='totalpay' name="zbdpTotal" onchange="inputValueChange();"></li>
	                             <li>1인당 예상 비용:<input type="text" id="ducts" name="zbdpNcost"></li>
	                         </ul>
	                         <div class="btn">
	                             <button>생성</button>
	                         </div>
	                     </div>
	                 </div>
	             </div>
	             <!-- 추가 모달영역e -->
	             
	             <!-- view 모달s -->
	             <div class="modal">
	                 <div class="modal-content">
	                     <div class="modal-header">
	                         <h3>RECEIPT</h3>
	                         <span id="close-modal">&times;</span><hr>
	                     </div>
	                     <h4>리스트명을 입력하세요</h4>
	                     <div class="list_name">
	                         <input type="text" name="zbdpTitle">
	                     </div>
	                     <h4>어떤곳에 사용했나요?</h4>
	                     <div class="modal-body">
	                         <ul class="modal_catagory">
	                             <li>분류1</li>
	                             <li>분류2</li>
	                             <li>분류3</li>
	                             <li>분류4</li>
	                         </ul>                                        
	                     </div>
	                     <h4>누구랑 사용했나요?</h4>
	                     <div class="modal-body">
	                         <ul class="modal_people">
	                          <c:forEach items="${list}" var="list">
	                          	<input type="hidden" name="zbsiSeq" value="<c:out value="${list.zbsiSeq}" />">
	                              <li><input type="checkbox" name="memberID" id="UserID" onchange="inputValueChange();"><c:out value="${list.zbmmID}" /></li>
	                          </c:forEach>     
	                         </ul>                            
	                     </div>
	                     <h4>영수증이 있다면 첨부해보세요</h4>
	                     <div class="modal-img">
	                         <span>영수증 사진 들어가는 곳</span>
	                         <input type="file" name="" id="">                                
	                     </div>
	                     <div class="modal-btn">
	                         <ul class="total">
	                             <li>총 비용:<input type="text" id='totalpay' name="zbdpTotal" onchange="inputValueChange();"></li>
	                             <li>1인당 예상 비용:<input type="text" id="ducts" name="zbdpNcost"></li>
	                         </ul>
	                         <div class="btn">
	                             <button>생성</button>
	                         </div>
	                     </div>
	                 </div>
	             </div>
	             <!-- view 모달e -->
	             
			</div>
		</div>
	</form>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<script src="https://kit.fontawesome.com/86d85c3d85.js" crossorigin="anonymous"></script>
		<script>

		//리스트 추가 모달
		const modal = document.querySelector(".modal");
		const openModalBtn = document.querySelector("#open-modal");
		const closeModalBtn = document.querySelector("#close-modal");
		
		openModalBtn.addEventListener("click", function () {
			modal.style.display = "block";
		});
		
		closeModalBtn.addEventListener("click", function () {
			modal.style.display = "none";
		});
		
		 function inputValueChange(){
			var chkLangth =  $("input:checkbox[name=memberID]:checked").length;
		    var inputValue = document.getElementById('totalpay').value;
		    document.getElementById("ducts").value = inputValue / chkLangth;
		 }
		 
		// 멤버리스트 모달
		 const listmodal = document.querySelector(".memberList-modal");
		 const listopenModalBtn = document.querySelector("#open-memberList-modal");
		 const listcloseModalBtn = document.querySelector("#close-memberList-modal");

		 listopenModalBtn.addEventListener("click", function () {
		 listmodal.style.display = "block";
		 });

		 listcloseModalBtn.addEventListener("click", function () {
		 listmodal.style.display = "none";
		 });
		</script>

</body>
</html>
