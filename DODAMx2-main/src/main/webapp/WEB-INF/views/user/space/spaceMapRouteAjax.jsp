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
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<!--         <link rel="stylesheet" href="/resources/css/user/space.css"> -->
		<link rel="stylesheet" href="/resources/css/user/spaceMapRoute.css">
        <link rel="stylesheet" href="/resources/css/user/spaceCommon.css">
		<title>Dodam</title>
		<!-- Datepicker -->
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
		<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
		<style type="text/css">
			.wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;}
		    .wrap * {padding: 0;margin: 0;}
		    .wrap .info {width: 285px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
		    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
		    .info .title {position: relative;padding: 5px 0 0 10px;height: 30px;border-bottom: 1px solid #ddd;font-size: 15px;font-weight: bold;}
		    /* .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');} */
		    /* .info .close:hover {cursor: pointer;} */
		    .info .body {margin: 0;overflow: hidden;}
		    .info .desc {position: relative;margin: 13px;height: 75px;}
		    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
		    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
		    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
		    /* .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')} */
		    .info .link {color: #5085BB;}
		</style>
	</head>
	<body>
			<!-- 헤더영역s -->
        <nav class="header">
            <div class="header-logo">
                <a href="main">DODAM</a><span class="spname"><c:out value="${item.zbspName }"/></span>
            </div>
            <div class="header-userbox" id="open-memberList-modal">
                <img class="user-img" src="https://cdn-icons-png.flaticon.com/512/476/476700.png" alt="">
                <div class="user-name">스페이스 회원수</div>
                <div class="user_count"><c:out value="${item.xSpaceUser }"/>명</div>
            </div>
            <!-- 멤버리스트 모달영역s -->
            <div class="memberList-modal">
                <div class="modalBox">
                    <div class="memberList-modal-content">
                        <div class="modal-header">
                            <h3><c:out value="${item.zbspName }"/></h3>
                            <span id="close-memberList-modal">&times;</span>
                        </div>
                        <ul class="memberList-modal-body">
                            <li class="userBOX">
                                <img class="userBOXImg"src="">
                                <span class="userBOXId">아이디나오는 영역</span>
                                <span class="userBOXName">이름나오는 영역</span>
                            </li>
                        </ul>
                    </div>    
                </div>
            </div>
            <!-- 멤버리스트 모달영역e -->
        </nav>
        <!-- 헤더영역e -->
	<div class="containers">
		<!-- 사이드메뉴 s -->
		<div class="sidebar">
			<div class="user_profile">
				<img src="https://cdn-icons-png.flaticon.com/512/547/547413.png">
			</div>
			<div class="user_name">
				<a href="#"><c:out value="${sessName }" /></a>
			</div>
			<ul class="side_menu_list">
				<h1>MENU</h1>
				<li onclick="location.href='/spaceMain?zbspSeq=<c:out value="${vo.zbspSeq }"/>'">SPACE MAIN</li>
				<li onclick="location.href='/spaceChat?zbspSeq=<c:out value="${vo.zbspSeq }"/>'">CHATTING</li>
				<li onclick="location.href='/spaceMapRouteAjax?zbspSeq=<c:out value="${vo.zbspSeq }"/>'">MAP</li>
				<li onclick="location.href='/spaceDucthPay?zbspSeq=<c:out value="${vo.zbspSeq }"/>'">PAY</li>
				<li>ZOOM</li>
				<li>SETTING</li>
			</ul>
		</div>
		<!-- 사이드메뉴 e -->


		<div class="wrapper">
			<!-- 지도영역s -->
			<div class="mpaArea">
				<div class="mapTitle">
					<p>🌏&nbsp;여행 지도
					<p>
				</div>
				<input type="hidden" id="zbspSeq" value="${vo.zbspSeq }">
				<div class="wP" id="lita"></div>
			</div>
			<!-- 지도영역e -->
			<!-- 등록영역s -->
			<div class="mapReg">
				<div class="mapRegTitle">
					<p>등록</p>
				</div>
				<div class="mapRegDetail">
					<div class="RegCatagory">
						<input id="zbtfTypeCodeHidden" name="zbtfTypeCodeHidden" type="hidden">
						<div class="radio">
							<input id="zbtfTypeCode-1" name="zbtfTypeCode" type="radio" value="0">
							<label for="zbtfTypeCode-1" class="radio-label">계획</label>
						</div>
						<div class="radio">
							<input id="zbtfTypeCode-2" name="zbtfTypeCode" type="radio" value="1">
							<label for="zbtfTypeCode-2" class="radio-label">추억</label>
						</div>
					</div>
					<div class="mapRegDetail-item ms-1">
						<p class="mb-0 me-3">여행지 검색</p>
						<div class="searchWrap">
							<form id="searchBox" onsubmit="searchPlaces(); return false;">
								<input class="form-control" type="text" placeholder="여행지를 입력하세요" id="keyword" size="14">
								<button class="btn" type="submit" id="searchBtn" style="background: #191970; color: #fff;">
									<i class="fa-solid fa-magnifying-glass"></i>
								</button>
							</form>
							<label for="keyword" id="keywordMsg" class="invalid-feedback "></label>
						</div>
					</div>
					<div class="mapRegDetail-item">
						<p class="mb-0 me-3">여행 날짜</p>
						<input type="text" id="zbtfDate" class="form-control disIn  inputData feedBack" placeholder="여행날짜를 선택하세요">
						<label for="zbtfDate" id="zbtfDateMsg" class="d-none invalid-feedback"></label>
					</div>
					<!-- <label for="keyword" class="radio-label">새로운 장소 검색</label> -->
					<!-- <input id="searchKeyword" name="flagType" type="checkbox" value="searchKeyword"> -->
					<div class="d-none">
						<input type="hidden" id="zbtfSort" class="textBox form-control mb-3 inputData">
						<input type="hidden" id="zbtfSeq" class="textBox form-control mb-3 inputData">
						<input type="hidden" id="zbtfLocationX" class="textBox form-control mb-3 inputData">
						<input type="hidden" id="zbtfLocationY" class="textBox form-control mb-3 inputData">
					</div>
					<div class="mapRegDetail-item">
						<label for="zbtfFlagName" class="col-form-label"><p class="mb-0">깃발 명</p></label>
						<input type="text" id="zbtfFlagName" class="textBox form-control inputData feedBack">
						<label for="zbtfFlagName" id="zbtfFlagNameMsg" class="d-none invalid-feedback"></label>
					</div>
					<div class="mapRegDetail-item">
						<label for="zbtfName" class="col-form-label"><p class="mb-0">장소 명</p></label>
						<input type="text" id="zbtfName" class="textBox form-control inputData" readonly>
					</div>
					<div class="mapRegDetail-item">
						<label for="zbtfAddr" class="col-form-label"><p class="mb-0">장소 주소</p></label>
						<br>
						<input type="text" id="zbtfAddr" class="textBox form-control disIn inputData" readonly>
						<label id="latLngMsg" class="col-form-label invalid-feedback"><p class="mb-0"></p></label>
						<input type="hidden" name="zbtfFlagName" value="<c:out value="${flagOne.zbtfFlagName}"/>"/>
						<input type="hidden" name="zbtfName" value="<c:out value="${flagOne.zbtfName}"/>"/>
						<input type="hidden" name="zbtfAddr" value="<c:out value="${flagOne.zbtfAddr}"/>"/>
						<input type="hidden" name="zbtfLocationX" value="<c:out value="${flagOne.zbtfLocationX}"/>"/>
						<input type="hidden" name="zbtfLocationY" value="<c:out value="${flagOne.zbtfLocationY}"/>"/>
						<!-- <button type="button" id="jsonTest" class="btn btn-danger btnBox mb-1">검색</button> -->
					</div>

					<div class="imgbox d-none" id="imageBox">
						<!-- 이미지업로드 여러개 -->
						<div id='image_preview'>
							<input type='file' id='btnAtt' multiple='multiple' />
							<label for="btnAtt">
								<div class="btnAttCss">파일추가</div>
							</label>
							<div id='att_zone' data-placeholder='파일을 첨부 하려면 파일 선택 버튼을 클릭하거나 파일을 드래그앤드롭 하세요'></div>
						</div>
					</div>


					<div class="RegBtn">
						<button type="button" id="btnSave" name="btnSave" class="btn regBtn mt-3" style="background: #191970; color: #fff;">깃발 꽂기</button>
						<button type="button" id="btnUelete" name="btnUelete" class="btn btn-secondary regBtn mt-3 ms-3 d-none">깃발 뽑기</button>
					</div>
				</div>
				<%@include file="./spaceModal.jsp"%>
			</div>
		</div>
	</div>
	<form name="formVo" id="formVo" method="post">
		<!-- *Vo.jsp s -->
		<%@include file="spaceVo.jsp"%>
		<!-- #-> -->
		<!-- *Vo.jsp e -->
	</form>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=08dd86f56b8d2604cae40cef7de922be&libraries=services,clusterer,drawing"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/a1961b2393.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<script>
	$(document).ready(function(){
		$('input[type=radio][id=zbtfTypeCode-1]').prop("checked", true);
		document.getElementById('zbtfTypeCodeHidden').value = 0;
		
		// modal s
		const modal = document.querySelector(".modal");
		const openModalBtn = document.querySelector("#btnUelete");
		const closeModalBtn = document.querySelector("#close-modal");
		const closeBtn = document.querySelector("#closeBtn");
		
		openModalBtn.addEventListener("click", function () {
		modal.style.display = "block";
		});

		closeModalBtn.addEventListener("click", function () {
		modal.style.display = "none";
		});
		
		closeBtn.addEventListener("click", function () {
		modal.style.display = "none";
		});
		
		$("#btnUelete").on("click", function(){
			$("#btnModalUelete").show();
		});
		
		$("#btnModalUelete").on("click", function(){
			$("#modalConfirm").modal("hide");
		});

		// modal e
		
		
		// validation e
		$.datepicker.setDefaults($.datepicker.regional['ko']);
        $("#zbtfDate").datepicker({
            changeMonth: true,
            changeYear: true,
            nextText: '다음 달',
            prevText: '이전 달',
            dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
            monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            dateFormat: "yy-mm-dd"
             /* maxDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가) */
           /*  onClose: function( selectedDate ) {
                  //시작일(startDate) datepicker가 닫힐때
                  //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                $('${item.zbspEndDate}').datepicker( "option", "minDate", selectedDate );
            } */
        });
        
		setLita();
	}); 
	
	var goUrlLita = "/spaceMapRouteAjaxMap";	
	
	function setLita() {
		$.ajax({
			async: true 
			,cache: false
			,type: "get"
			/* ,dataType:"json" */
			,data: {
				"zbspSeq" : $("#zbspSeq").val()
			}
			,url: goUrlLita
			/* ,data : $("#formList").serialize() */
			
			,success: function(response) {
				$("#lita").empty();
				$("#lita").append(response);
			}
			,error : function(jqXHR, textStatus, errorThrown){
				alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
			}
		});
	};
	
	// zbtfFlagType value radio Jquery
	var zbtfTypeCode = document.getElementById('zbtfTypeCodeHidden');
	var zbtfSeq = document.getElementById('zbtfSeq');
	var zbtfSort = document.getElementById('zbtfSort');
	var zbtfDate = document.getElementById('zbtfDate');
	var zbtfFlagName = document.getElementById('zbtfFlagName');
	var locationX = document.getElementById('zbtfLocationX');
	var locationY = document.getElementById('zbtfLocationY');
	
	$('input[type=radio][name=zbtfTypeCode]').change(function(){
		var type = $('input[type=radio][name=zbtfTypeCode]');
		
	    for(var i=0; i<type.length; i++){
	       if($(this).val() != $(type[i]).val()){
	            $(type[i]).siblings('input').val("");
	       } 
	    }
		//console.log($(this).val());
		zbtfTypeCode.value = $(this).val();
		if (zbtfTypeCode.value > 0) {
			$("div[id='imageBox']").removeClass("d-none"); //우선 체크되어 있는 값을 초기화
			$("div[id='imageBox']").addClass("d-block"); //우선 체크되어 있는 값을 초기화
		}
		else {
			$("div[id='imageBox']").removeClass("d-block"); //우선 체크되어 있는 값을 초기화
			$("div[id='imageBox']").addClass("d-none"); //우선 체크되어 있는 값을 초기화
		}
		
	});
	
	$("#btnModalUelete").on("click", function() {
		$.ajax({
			async : true,
			cache : false,
			type : "post",
			dataType:"json"
			,
			url : "/spaceFlagUelete"
			,
			data : {
				"zbtfSeq" : $("#zbtfSeq").val(),
			},
			success : function(response) {
				if (response.rt == "success") {
					$(".modal").hide();
					setLita();
					
				} else {
					alert("삭제 실패");
					setLita();
				}
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("ajaxUpdate " + jqXHR.textStatus + " : "
						+ jqXHR.errorThrown);
			}
		});
	});
	$("#btnSave").on("click", function() {
		var dateCheck = true;
		var flagNameCheck = true;
		var latLngCheck = true;
		while(dateCheck || flagNameCheck || latLngCheck) {
			if($('#zbtfDate').val() == '' ){
				document.getElementById("zbtfDate").classList.add('is-invalid');
				document.getElementById("zbtfDateMsg").classList.remove('d-none');
				document.getElementById("zbtfDateMsg").classList.add('d-inline-block');
				$('#zbtfDateMsg').text('여행 날짜를 입력해주세요.');
				dateCheck = true;
				//break;
			}
			else {
				document.getElementById("zbtfDate").classList.remove('is-invalid');
				document.getElementById("zbtfDateMsg").classList.remove('d-inline-block');
				document.getElementById("zbtfDateMsg").classList.add('d-none');
				dateCheck = false;
			}
			if($('#zbtfFlagName').val() == ''){
				document.getElementById("zbtfFlagName").classList.add('is-invalid');
				document.getElementById("zbtfFlagNameMsg").classList.remove('d-none');
				document.getElementById("zbtfFlagNameMsg").classList.add('d-inline-block');
				$('#zbtfFlagNameMsg').text('깃발 명칭을 입력해주세요.');
				flagNameCheck = true;
				//break;
			}
			else {
				document.getElementById("zbtfFlagName").classList.remove('is-invalid');
				document.getElementById("zbtfFlagNameMsg").classList.remove('d-inline-block');
				document.getElementById("zbtfFlagNameMsg").classList.add('d-none');
				flagNameCheck = false;
			}
			if($('#zbtfLocationX').val() == '' || $('#zbtfLocationY').val() == ''){
				document.getElementById("latLngMsg").classList.remove('d-none');
				document.getElementById("latLngMsg").classList.add('d-inline-block');
				$('#latLngMsg').text('여행지 검색 후 지도의 깃발을 선택해주세요.');
				latLngCheck = true;
				//break;
			}
			else {
				document.getElementById("latLngMsg").classList.remove('d-inline-block');
				document.getElementById("latLngMsg").classList.add('d-none');
				latLngCheck = false;
			}
			if (dateCheck || flagNameCheck || latLngCheck){
				// 계속 체크하게끔
				break; 
			}
			else {
				$.ajax({
					async : true,
					cache : false,
					type : "post",
					dataType:"json"
					,
					url : "/spaceFlagInst"
					,
					data : {
						"zbtfSeq" : $("#zbtfSeq").val(),
						"zbtfTypeCode" : $("input[type=hidden][id=zbtfTypeCodeHidden]").val(),
						//"zbtfTypeCode" : $("input[type=radio][name=zbtfTypeCode]").val(),
						"zbtfDate" : $("#zbtfDate").val(),
						"zbtfFlagName" : $("#zbtfFlagName").val(),
						"zbtfName" : $("#zbtfName").val(),
						"zbtfSort" : $("#zbtfSort").val(),
						"zbtfAddr" : $("#zbtfAddr").val(),
						"zbtfLocationX" : $("#zbtfLocationX").val(),
						"zbtfLocationY" : $("#zbtfLocationY").val(),
						"zbspSeq" : $("#zbspSeq").val(),
					},
					success : function(response) {
						if (response.rt == "success") {
							alert("깃발 등록 완료");
							setLita();
							var inputData = document.querySelectorAll('.inputData');
								inputData.forEach(function(input) {
									input.value = "";
								});
						} else {
							alert("등록 실패");
							setLita();
						}
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert("ajaxUpdate " + jqXHR.textStatus + " : "
								+ jqXHR.errorThrown);
					}
				});
			}
		}
			
	});

	
	( /* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
		    imageView = function imageView(att_zone, btn){

		    var attZone = document.getElementById(att_zone);
		    var btnAtt = document.getElementById(btn)
		    var sel_files = [];
		    
		    // 이미지와 체크 박스를 감싸고 있는 div 속성
		    var div_style = 'display:inline-block;position:relative;' + 'width:150px;height:120px;margin:5px;border:1px solid #e0e0e0;z-index:1';
		    // 미리보기 이미지 속성
		    var img_style = 'width:100%;height:100%;z-index:none';
		    // 이미지안에 표시되는 체크박스의 속성
		    var chk_style = 'width:30px;height:30px;position:absolute;font-size:24px;' + 'right:0px;bottom:0px;z-index:999;background-color:rgba(255,255,255,0.1);color:#f00';

		    btnAtt.onchange = function(e){
		    var files = e.target.files;
		    var fileArr = Array.prototype.slice.call(files)
		        for(f of fileArr){
		            imageLoader(f);
		        }
		    }  
		    // 탐색기에서 드래그앤 드롭 사용
		    attZone.addEventListener('dragenter', function(e){
		    e.preventDefault();
		    e.stopPropagation();
		    }, false)
		    
		    attZone.addEventListener('dragover', function(e){
		    e.preventDefault();
		    e.stopPropagation();
		    
		    }, false)

		    attZone.addEventListener('drop', function(e){
		    var files = {};
		    e.preventDefault();
		    e.stopPropagation();
		    var dt = e.dataTransfer;
		    files = dt.files;
		    for(f of files){
		        imageLoader(f);
		    }
		    
		    }, false)
		    

		    
		    /*첨부된 이미지들을 배열에 넣고 미리보기 */
		    imageLoader = function(file){
		        sel_files.push(file);
		        var reader = new FileReader();
		        reader.onload = function(ee){
		        let img = document.createElement('img')
		        img.setAttribute('style', img_style)
		        img.src = ee.target.result;
		        attZone.appendChild(makeDiv(img, file));
		    }
		    
		    reader.readAsDataURL(file);   
		    }
		    
		    /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
		    makeDiv = function(img, file){
		    var div = document.createElement('div')
		    div.setAttribute('style', div_style)
		    
		    var btn = document.createElement('input')
		    btn.setAttribute('type', 'button')
		    btn.setAttribute('value', 'x')
		    btn.setAttribute('delFile', file.name);
		    btn.setAttribute('style', chk_style);
		    btn.onclick = function(ev){
		        var ele = ev.srcElement;
		        var delFile = ele.getAttribute('delFile');
		        for(var i=0 ;i<sel_files.length; i++){
		        if(delFile== sel_files[i].name){
		            sel_files.splice(i, 1);      
		            }
		        }
		        
		        dt = new DataTransfer();
		        for(f in sel_files) {
		        var file = sel_files[f];
		        dt.items.add(file);
		        }
		        btnAtt.files = dt.files;
		        var p = ele.parentNode;
		        attZone.removeChild(p)
		    }
		        div.appendChild(img)
		        div.appendChild(btn)
		    return div
		    }
		}
		)('att_zone', 'btnAtt')
	
	
	</script>
</body>
</html>