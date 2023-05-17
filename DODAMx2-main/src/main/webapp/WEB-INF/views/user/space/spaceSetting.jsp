<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<%@ page session="true"%>
<jsp:useBean id="CodeServiceImpl" class="com.dodam.infra.modules.code.CodeServiceImpl" />
<html>
	<head>
		<meta charset="uTF-8"> 
		<meta name ="viewport" content="width=device-width, initial-scaLe=1.0">
        <link rel="stylesheet" href="/resources/css/user/spaceSetting.css">
		<title></title>
	</head>
	<body>
	<form id="form">
		<c:set var="listCodeRegion" value="${CodeServiceImpl.selectListCachedCode('1')}"/>
		<c:set var="listCodeTravelTheme" value="${CodeServiceImpl.selectListCachedCode('4')}"/>
		<!-- 헤더영역s -->
        <%@include file="../../include/user/spaceHeader.jsp"%>
        <!-- 헤더영역e -->
		<div class="container">
			<!-- 사이드메뉴 s -->
			<%@include file="../../include/user/spaceSideBar.jsp"%>
            <!-- 사이드메뉴 e -->
            <div class="mainWrap">
				<div class="regWrap">
		            <!-- 1.대표이미지 설정 -->
		            <div class="spaceProfileWrap">
		                <img class="spaceProfileBox" src="https://cdn-icons-png.flaticon.com/512/3049/3049617.png" alt="">
		                <input type="file" id="spaceImg" name="uploadedImage">
		                <label class="spaceImgbtn"for="spaceImg">이미지 찾기<i class="fa-solid fa-magnifying-glass"></i></label>
		            </div>
		            <!-- 2.스페이스 이름 설정 -->
		            <div class="title">
		                <h3>스페이스 이름을 정해주세요</h3>
		            </div>
		            <div class="spacetitle-input">
		                <input type="text" id="zbspName"name="zbspName" value="<c:out value="${item.zbspName }"/>">
		            </div>
		            <!-- 3.기간설정 -->
		            <div class="title">
		                <h3>여행기간</h3>
		            </div>
		            <div class="dateWrap">
		                <ul class="dateinput">
		                        <li><input type="text" id="startDate" name="zbspStartDate" value="<c:out value="${item.zbspStartDate }"/>"></li>
		                        ~
		                        <li><input type="text" id="endDate" name="zbspEndDate" value="<c:out value="${item.zbspEndDate }"/>"></li>
		                    </li>
		                </ul>    
		            </div>
				</div>
				<div class="catagoryBox">	            
		            <!-- 4.테마설정 -->
		            <div class="title">
		                <img class="titleimg"src="https://cdn-icons-png.flaticon.com/512/926/926318.png" alt="">
		                <h3>여행테마를 선택하세요</h3>
		            </div>
		            <ul class="catagoryWrap">
		                <c:forEach items="${listCodeTravelTheme}" var="listTravelTheme">
							<li class="itemown me-5">
								<input type="radio" class="btn-check" name="zbskKeyword" 
										id="<c:out value="${listTravelTheme.codeSeq}"/>" 
										value="<c:out value="${listTravelTheme.codeSeq}"/>"
										<c:if test="${listTravelTheme.codeSeq eq Keywordlist2.zbskKeywordCode}">checked</c:if>
										>
								<label class="listitem" for="<c:out value="${listTravelTheme.codeSeq}"/>">
									<c:if test="${listTravelTheme.codeSeq eq 26}">
										<img src="https://cdn-icons-png.flaticon.com/512/6774/6774898.png">
									</c:if>
									<c:if test="${listTravelTheme.codeSeq eq 27}">
										<img src="https://cdn-icons-png.flaticon.com/512/2271/2271062.png">
									</c:if>
									<c:if test="${listTravelTheme.codeSeq eq 28}">
										<img src="https://cdn-icons-png.flaticon.com/512/6030/6030435.png">
									</c:if>
									<c:if test="${listTravelTheme.codeSeq eq 29}">
										<img src="https://cdn-icons-png.flaticon.com/512/5267/5267302.png">
									</c:if>
								</label>
								<p class="h6 text-center mt-3"><c:out value="${listTravelTheme.codeName}"/></p>
							</li>
						</c:forEach>
		            </ul>
		            <!-- 5.친구초대영역 -->
		            <div class="title">
		                <img class="titleimg"src="https://cdn-icons-png.flaticon.com/512/1000/1000373.png" alt="">
		                <h3>친구를 초대해보세요</h3>
		                <button type="button" id="open-modal">+</button>
		            </div>
		            <ul class="friendWrap">
		            	<c:forEach items="${list}" var="list">
		            		<input type="hidden" name="">
		            		<li class="friend_items" value=""><c:out value="${list.zbmmID}" /></li>
		            	</c:forEach>
		            </ul>                        
		            <!-- 모달 -->
		            <div class="modal">
		                <div class="modal-content">
		                    <div class="modal-header">
		                        <h3>친구초대</h3>
		                        <span id="close-modal">&times;</span>
		                    </div>
		                    <div class="modal-body">
		                        <input type="text" id="inputId" placeholder="아이디를 입력해주세요" onkeyup="enterkey();">
		                        <input type="hidden">
		                        <div class="modal-searchbox">
		                            <!-- <p>검색결과가 없습니다.</p> -->
		                        </div>
		                        <p>최대 10명까지 추가할 수 있습니다.</p>
		                        <ul class="modal-selectList">
		                        </ul>
		                    </div>
		                    <div class="modal_footer">
		                        <button type="button" id="sucessModalBtn">완료</button>
		                    </div>
		                </div>
		            </div>            
		            <!-- 6.지역선택 -->
		            <div class="keytitle">
		                <h3>지역을 선택해보세요</h3>
		                <h4>최대 두 지역 까지 선택 가능합니다</h4>
		            </div>
		            <div class="area_wrap">
		                <div class="toggle3">
	                    	<c:forEach items="${listCodeRegion}" var="listCodeRegion" varStatus="status">
                    			<input type="checkbox" class="region" id="<c:out value="${listCodeRegion.codeSeq}"/>" 
                    					name="zbskKeywordCode" 
                    					value="<c:out value="${listCodeRegion.codeSeq}"/>"
                    					>
                   				<label class="addrLabel" for="<c:out value="${listCodeRegion.codeSeq}"/>"><p class="regionP"><c:out value="${listCodeRegion.codeName}"/></p></label>
	                    	</c:forEach>
		                </div>
		                
		            </div>
		            <input type="hidden" id="dataRegion" value="<c:out value="${Keywordlist1.zbskKeywordCode}"/>">
		            <div class="btnList">
		                <!-- <button type="submit">수정</button> -->
		            </div>
	            </div>
            </div>
		</div><!-- 컨테이너영역e-->		
	</form>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://kit.fontawesome.com/a1961b2393.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script type="text/javascript">
    var c = $("#dataRegion").val();
    // Keywordlist1.zbskKeywordCode 배열로 만들기
    var a = c.split(','); 
    // 공통코드
    var b = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]; 
    for(var B=0; B<b.length; B++){
		for(var A=0; A<a.length; A++){
			console.log("a[A]: " + a[A]);
			if(a[A] == b[B]){
				console.log("b[B]: " + b[B]);
				$('#'+ b[B]).prop("checked", true);
			} 
		}    	
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
	 
		$(document).ready(function() {
		    	var tmpChkCnt = $(".addrLabel:checked").length;
		        console.log(tmpChkCnt);	// 3 (A,B,C)
		    });
		        const modal = document.querySelector(".modal");
		        const openModalBtn = document.querySelector("#open-modal");
		        const closeModalBtn = document.querySelector("#close-modal");
		        const sucessModalBtn = document.querySelector("#sucessModalBtn");
		        
		        openModalBtn.addEventListener("click", function () {
		        	modal.style.display = "block";
		        });
		        
		        closeModalBtn.addEventListener("click", function () {
		        	modal.style.display = "none";
		        });
		        sucessModalBtn.addEventListener("click", function () {
		        	modal.style.display = "none";
		        });
		
		    /* 달력 */
		    $(document).ready(function () {
		            $.datepicker.setDefaults($.datepicker.regional['ko']);
		            $("#startDate").datepicker({
		                changeMonth: true,
		                changeYear: true,
		                nextText: '다음 달',
		                prevText: '이전 달',
		                dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
		                dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		                monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		                monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		                dateFormat: "yy-mm-dd",
		                 /* maxDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가) */
		                onClose: function( selectedDate ) {
		                      //시작일(startDate) datepicker가 닫힐때
		                      //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
		                    $("#endDate").datepicker( "option", "minDate", selectedDate );
		                }
		            });
		            $("#endDate").datepicker({
		                changeMonth: true,
		                changeYear: true,
		                nextText: '다음 달',
		                prevText: '이전 달',
		                dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
		                dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		                monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		                monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		                dateFormat: "yy-mm-dd",
		                 /* maxDate: 0,                       // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가) */
		                onClose: function( selectedDate ) {
		                     // 종료일(endDate) datepicker가 닫힐때
		                     // 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
		                    $("#startDate").datepicker( "option", "maxDate", selectedDate );
		                }
		            });
		    });
		        
			$(document).ready(function(){ 
				$(".region").on("click" , function(){ 
					let count = $(".region:checked").length;
					if(count > 2) { 
						$(this).prop("checked" , false); 
						alert("2개까지만 선택할 수 있습니다."); 
					 }		 
				}); 
			});
			$('input[type="text"]').keydown(function() {
			  if (event.keyCode === 13) {
			    event.preventDefault();
			  };
			});
			
			function enterkey() {
				var inputId = $('[id="inputId"]').val();
				var div = "";
				var id = $('[id="inputId"]').val();
				if (window.event.keyCode == 13) {
			//친구초대
					if(id.length < 2){
						  alert("2자리 이상 입력하세요");
						  return false;
					 }
					$.ajax({
						async: true 
						,cache: false
						,type: "post"
						,url: "/searchUser"
						,data : { "shMember" : $("#inputId").val() }
						,success: function(response) {
							if(response.rt == "success") {
								$(".modal-searchbox *").remove();
								
								for(var i = 0; i < response.userList.length; i++) {
									var id = response.userList[i].zbmmID;
									var name = response.userList[i].zbmmName;
									div += '<input type="checkbox" id="user'+i+'" name="chkName" value='+id+'>';
									div += '<label for="user'+i+'" class="userbox">' + name + '('+ id +')</label>';
								}
								$(".modal-searchbox").append(div);								
							} else {
								$(".modal-searchbox *").remove();
								div += '<p>검색결과가 없다</p>';
								$(".modal-searchbox").append(div);
							}
						}
						,error : function(jqXHR, textStatus, errorThrown){
							alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
						} 
				});
			}
		}
			$(document).ready(function(){ 
				$(document).on("change","input:checkbox[name=chkName]",function(){
					var div = "";
					var div2 = "";
					var chk = $(this).val();
					 if($($(this)).is(":checked")) {
						let count = $("input:checked[name=chkName]").length;
						
						if(count > 10) { 
							$(this).prop("checked" , false); 
							alert("10명까지만 선택할 수 있습니다.");
							return false;
						 }		 
						
						div += '<input type="hidden" name="shMember" id="'+chk+'" value="'+chk+'">';
						div += '<li class="modal-selectList-item" id="'+chk+'">'+chk+'';
						div2 += '<li class="friend_items" id="'+chk+'">'+chk+'</li>'
						$(".modal-selectList").append(div);
						$(".friendWrap").append(div2);
					} else { 
						var chk = $(this).val();
						$(".modal-selectList #" + chk).remove();
						$(".friendWrap #" + chk).remove();
					}
				});
			});	
			
	        // 이미지 업로드
	        const fileDOM = document.querySelector('#spaceImg');
	        const preview = document.querySelector('.spaceProfileBox');
	        fileDOM.addEventListener('change', () => {
	        const reader = new FileReader();
	        reader.onload = ({ target }) => {
	            preview.src = target.result;
	        };
	        reader.readAsDataURL(fileDOM.files[0]);
	        });
	        
	        //---------유효성검사-------------
	        window.onload = function() {
	        // 폼에서 id가 joinForm인 폼의 submit 버튼이 눌러졌을 때 수행되는 이벤트 처리
	        document.getElementById('form').onsubmit = function() {

	        // 성명을 입력하지 않은 경우 경고창 띄우기
	        // 성명 입력 칸의 id를 찾아오기
	        var name = document.getElementById('zbspName')
	        // 값이 비었는지 확인 후 비었으면 경고 출력, 입력란에 포커스, 서버로 전송되지 않게(다음 페이지로 이동 못하게)
	        if(name.value == "") {
	            alert("스페이스 이름을 입력해주세요");
	            name.focus();
	            return false; // 서버로 전송되지 않게 함.
	        } // 이름 검증 끝
	        var stdate = document.getElementById('startDate')
	        var eddate = document.getElementById('zbspEndDate')
	        // 값이 비었는지 확인 후 비었으면 경고 출력, 입력란에 포커스, 서버로 전송되지 않게(다음 페이지로 이동 못하게)
	        if(stdate.value == "" || eddate.value =="") {
	            alert("여행기간을 입력해주세요");
	            return false; // 서버로 전송되지 않게 함.
	        } // 이름 검증 끝

	        return false;  
	        }
	    };
	 // window.onload 끝	
			
        </script>
</body>
</html>