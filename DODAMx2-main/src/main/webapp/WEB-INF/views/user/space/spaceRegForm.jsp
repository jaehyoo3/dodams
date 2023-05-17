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
		<title>DODAMDODAM</title>
        <link rel="stylesheet" href="/resources/css/user/spaceReg.css">
	</head>
	<body>
	<form name="form" id='form' method="post" autocomplete="off" action="/SpaceInst" enctype="multipart/form-data">
		<input type="hidden" name="zbmmSeq" value="<c:out value="${sessSeq}"/>">
		<!-- Navbar s  -->
		<%@include file="../../include/user/homeNav.jsp"%>
		<!-- Navbar e  -->
		<div class="container"><!-- main s  -->
            <!-- 1.대표이미지 설정 -->
            <h3>스페이스 대표이미지를 선택해주세요</h3>
            <div class="spaceProfileWrap">
                <img class="spaceProfileBox" src="https://cdn-icons-png.flaticon.com/512/3049/3049617.png" alt="">
                <input type="file" id="spaceImg" name="uploadedImage">
                <label class="spaceImgbtn"for="spaceImg">이미지 찾기<i class="fa-solid fa-magnifying-glass"></i></label>
            </div>
            <!-- 2.스페이스 이름 설정 -->
            <div class="title">
                <img class="titleimg"src="https://cdn-icons-png.flaticon.com/512/6089/6089035.png" alt="">
                <h3>스페이스 이름을 정해주세요</h3>
            </div>
            <div class="spacetitle-input">
                <input type="text" id="zbspName"name="zbspName" placeholder="스페이스명 입력">
            </div>
            <!-- 3.기간설정 -->
            <div class="title">
                <img class="titleimg"src="https://cdn-icons-png.flaticon.com/512/668/668278.png" alt="">
                <h3>여행기간을 알려주세요</h3>
            </div>
            <div class="dateWrap">
                <ul class="dateinput">
                        <li><input type="text" id="startDate" name="zbspStartDate" placeholder="출발일"></li>
                        ~
                        <li><input type="text" id="endDate" name="zbspEndDate" placeholder="도착일"></li>
                    </li>
                </ul>    
            </div>
            <!-- 4.테마설정 -->
            <div class="title">
                <img class="titleimg"src="https://cdn-icons-png.flaticon.com/512/926/926318.png" alt="">
                <h3>여행테마를 선택하세요</h3>
            </div>
            <ul class="catagoryWrap">
                <li class="itemown">
                    <input type="radio" name="zbskKeyword" value="26" id="food">
                    <label class="listitem" for="food"><img src="https://cdn-icons-png.flaticon.com/512/6774/6774898.png"></label>
                    <p>식도락 여행</p>
                </li>
                
                <li class="itemown">
                    <input type="radio" name="zbskKeyword" value="27" id="activity">
                    <label class="listitem" for="activity"><img src="https://cdn-icons-png.flaticon.com/512/2271/2271062.png"></label>
                    <p>활동적인 여행</p>
                </li>
                <li class="itemown">
                    <input type="radio" name="zbskKeyword" value="28" id="hotel">
                    <label class="listitem" for="hotel"><img src="https://cdn-icons-png.flaticon.com/512/6030/6030435.png"></label>
                    <p>호캉스</p>
                </li>
                <li class="itemown">
                    <input type="radio" name="zbskKeyword" value="29" id="pet">
                    <label class="listitem" for="pet"><img src="https://cdn-icons-png.flaticon.com/512/5267/5267302.png"></label>
                    <p>동물들과 함께</p>
                </li>
            </ul>
            <!-- 5.친구초대영역 -->
            <div class="title">
                <img class="titleimg"src="https://cdn-icons-png.flaticon.com/512/1000/1000373.png" alt="">
                <h3>친구를 초대해보세요</h3>
                <button type="button" id="open-modal">+</button>
            </div>
            <ul class="friendWrap">
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
                    <input type="checkbox" id="ch1" name="zbskKeywordCode" value="2">
                    <label class="addrLabel" for="ch1">경기</label>
                    <input type="checkbox" id="ch2" name="zbskKeywordCode" value="1">
                    <label class="addrLabel" for="ch2">서울</label>           
                    <input type="checkbox" id="ch3" name="zbskKeywordCode" value="4">
                    <label class="addrLabel"for="ch3">강원</label>
                    <input type="checkbox" id="ch4" name="zbskKeywordCode" value="5">
                    <label class="addrLabel" for="ch4">충북</label>
                    <input type="checkbox" id="ch5" name="zbskKeywordCode" value="6">
                    <label class="addrLabel" for="ch5">충남</label>
                    <input type="checkbox" id="ch6" name="zbskKeywordCode" value="8">
                    <label class="addrLabel" for="ch6">경북</label>
                    <input type="checkbox" id="ch7" name="zbskKeywordCode" value="9">
                    <label class="addrLabel" for="ch7">경남</label>
                    <input type="checkbox" id="ch8" name="zbskKeywordCode" value="12">
                    <label class="addrLabel" for="ch8">울산</label>
                </div>
                <ul class="toggle3">
                    <input type="checkbox" id="ch9" name="zbskKeywordCode" value="3">
                    <label class="addrLabel" for="ch9">인천</label>
                    <input type="checkbox" id="ch10" name="zbskKeywordCode" value="13">
                    <label class="addrLabel" for="ch10">전북</label>  
                    <input type="checkbox" id="ch11" name="zbskKeywordCode" value="14">
                    <label class="addrLabel" for="ch11">전남</label>
                    <input type="checkbox" id="ch12" name="zbskKeywordCode" value="11">
                    <label class="addrLabel" for="ch12">부산</label>
                    <input type="checkbox" id="ch13" name="zbskKeywordCode" value="7">
                    <label class="addrLabel" for="ch13">대전</label>
                    <input type="checkbox" id="ch14" name="zbskKeywordCode" value="10">
                    <label class="addrLabel" for="ch14">대구</label>
                    <input type="checkbox" id="ch15" name="zbskKeywordCode" value="16">
                    <label class="addrLabel" for="ch15">제주</label>
                    <input type="checkbox" id="ch16" name="zbskKeywordCode" value="15">
                    <label class="addrLabel" for="ch16">광주</label>
                </ul>
            </div>
            <div class="btnList">
                <button type="submit">생성</button>
            </div>
        </div><!-- main e -->
</form>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://kit.fontawesome.com/a1961b2393.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
    <script type="text/javascript">
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
				$("input[name='zbskKeywordCode']").on("click" , function(){ 
					let count = $("input:checked[name='zbskKeywordCode']").length;
					
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
