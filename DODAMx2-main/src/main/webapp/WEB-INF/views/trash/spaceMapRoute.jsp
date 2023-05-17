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
        <link rel="stylesheet" href="/resources/css/user/space.css">
		<title>Dodam</title>
		<!-- Datepicker -->
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
		<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
		<link rel="stylesheet" href="/resources/css/user/spaceMapRoute.css">
	</head>
	<body>
		<div class="containers">
		<div class="wrapper">
			<div class="body">
				<div class="map">
					<div class="mapTitle">
						<p class="TitleDetail">여행깃발</p>
					</div>
					<div class="wP">
						<div class="category">
							<div class="radio">
								<input id="allMarker" name="flagType" type="radio" value="allMarker" checked>
								<label for="allMarker" class="radio-label">전체</label>
							</div>
							<div class="radio">
								<input id="planMarker" name="flagType" type="radio" value="planMarker">
								<label for="planMarker" class="radio-label">계획</label>
							</div>
							<div class="radio">
								<input id="memMarker" name="flagType" type="radio" value="memMarker">
								<label for="memMarker" class="radio-label">추억</label>
							</div>
						</div>
					</div>
					<div class="map_wrap">
					<!-- <div class="mapDetail" id="map"></div> -->
					<div class="mapDetail" id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

					<!-- <div id="menu_wrap" class="bg_white">
						<div class="option">
							<div>
								<form onsubmit="searchPlaces(); return false;">
									키워드 :
									<input type="text" value=" " id="keyword" size="15">
									<button type="submit">검색하기</button>
								</form>
							</div>
						</div>
						<hr>
						<ul id="placesList"></ul>
						<div id="pagination"></div>
					</div> -->
					</div>
				</div>
				<div class="mapReg">
					<div class="mapRegTitle">
						<p class="TitleDetail">여행깃발등록(경로)</p>
					</div>
					<form>
						<div class="mapRegDetail">
							<div class="wP mb-4">
								<input type="date" class="disIn box">
								~
								<input type="date" class="disIn box">
							</div>
							<div class="wP">
								<div class="radio">
									<input id="radio-11" name="zbtfTypeCode" type="radio" value="0" checked>
									<label for="radio-11" class="radio-label">계획</label>
								</div>
								<div class="radio">
									<input id="radio-22" name="zbtfTypeCode" type="radio" value="1">
									<label for="radio-22" class="radio-label">추억</label>
								</div>
								<!-- <div class="radio">
									<input id="radio-33" name="radio" type="radio">
									<label for="radio-33" class="radio-label">도착</label>
								</div> -->
								
							</div>
							<div class="wP">
								<input type="text" id="zbtfSort" class="textBox form-control mb-3">
							</div>
							<div class="wP">
								<input type="text" id="zbtfSeq" class="textBox form-control mb-3">
							</div>
							<div class="wP">
								<label for="zbtfName" class="col-form-label"><p class="mb-0">장소 명</p></label>
								<input type="text" id="zbtfName" class="textBox form-control mb-3">
								<input type="hidden" id="zbspSeq" class="textBox form-control mb-3" value="<c:out value="${vo.zbspSeq }"/>">
							</div>
							<div class="wP mb-5">
								<label for="zbtfAddr" class="col-form-label"><p class="mb-0">장소 주소</p></label>
								<br>
								<input type="text" id="zbtfAddr" class="textBox form-control disIn">
								<!-- <button type="button" id="jsonTest" class="btn btn-danger btnBox mb-1">검색</button> -->
							</div>
							
							<div class="wP mb-5 row">
								<label for="locationX" class="col-form-label"><p class="mb-0">좌표</p></label>
								<br>
								<div class="col"><input type="text" id="zbtfLocationX" class="textBox form-control disIn"></div>
								<div class="col"><input type="text" id="zbtfLocationY" class="textBox form-control disIn"></div>
							</div>
							<div class="wP">
								<button type="button" class="btn btn-secondary regBtn mb-3">삭제</button>
								<button type="button" id="btnSave" class="btn btn-danger regBtn mb-3">등록</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=08dd86f56b8d2604cae40cef7de922be&libraries=services,clusterer,drawing"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/a1961b2393.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<script>
		var jsonData = JSON.parse('${flagListJson}');
//		console.log(jsonData);
//		console.log(jsonData.length);

		var planFlagArr = new Array();
		var planFlagObj = new Object();
		
		var linePath = new Array;
		var path = new Object;
		
		// 추억 flag JSON Data Array 형식으로 변환 s
		var memFlagArr = new Array();
		var memFlagObj = new Object();
		
		for(var i = 0; i < jsonData.length; i++) {
			if (jsonData[i].zbtfTypeCode == 1) {
				// 추억 flag JSON Data Array 형식으로 변환 s
				memFlagObj = new Object(); // refresh array
				memFlagObj.zbtfSeq = jsonData[i].zbtfSeq;
				memFlagObj.zbtfStartDate = jsonData[i].zbtfStartDate;
				memFlagObj.zbtfEndDate = jsonData[i].zbtfEndDate;
				memFlagObj.zbtfName = jsonData[i].zbtfName;
				memFlagObj.zbtfAddr = jsonData[i].zbtfAddr;
				memFlagObj.zbtfSort = jsonData[i].zbtfSort;
				memFlagObj.zbtfLocationX = jsonData[i].zbtfLocationX;
				memFlagObj.zbtfLocationY = jsonData[i].zbtfLocationY;
				memFlagObj.zbspSeq = jsonData[i].zbspSeq;
				memFlagObj.position = new kakao.maps.LatLng(jsonData[i].zbtfLocationX, jsonData[i].zbtfLocationY);
				memFlagArr.push(memFlagObj);
				
//				console.log(memFlagArr);
				
//				console.log(memFlagArr[i].location);
				// 추억 flag JSON Data Array 형식으로 변환 e
			}
			else {
				// 계획 flag Json Data Array 형식으로 변환 s
				planFlagObj = new Object(); // refresh array
				planFlagObj.zbtfSeq = jsonData[i].zbtfSeq;
				planFlagObj.zbtfStartDate = jsonData[i].zbtfStartDate;
				planFlagObj.zbtfEndDate = jsonData[i].zbtfEndDate;
				planFlagObj.zbtfName = jsonData[i].zbtfName;
				planFlagObj.zbtfAddr = jsonData[i].zbtfAddr;
				planFlagObj.zbtfSort = jsonData[i].zbtfSort;
				planFlagObj.zbtfLocationX = jsonData[i].zbtfLocationX;
				planFlagObj.zbtfLocationY = jsonData[i].zbtfLocationY;
				planFlagObj.zbspSeq = jsonData[i].zbspSeq;
				planFlagObj.position = new kakao.maps.LatLng(jsonData[i].zbtfLocationX, jsonData[i].zbtfLocationY);
				planFlagArr.push(planFlagObj);
				
				// 여행 경로 Array 생성 s
				var path = new Object;
				path = new kakao.maps.LatLng(jsonData[i].zbtfLocationX, jsonData[i].zbtfLocationY);
				linePath.push(path);
				
			// 계획 flag Json Data Array 형식으로 변환 e
			}
		};
				
		selectedMarker = null;
		
		var nowLocation = linePath[0];
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : nowLocation, // 지도의 중심좌표 - 출발지로 설정됨
			level : 12
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		// 여행 경로 생성
	 		var polyline = new kakao.maps.Polyline({
			    path: linePath, // 선을 구성하는 좌표배열 입니다
			    strokeWeight: 4, // 선의 두께 입니다
			    strokeColor: 'lightGreen', // 선의 색깔입니다
			    strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
			    strokeStyle: 'solid' // 선의 스타일입니다
			});
			polyline.setMap(map);
			
		var planMarkers = [];
		var memMarkers = [];
		
		// input value ID 변수
		var zbtfStartDate = document.getElementById('zbtfStartDate');
		var zbtfEndDate = document.getElementById('zbtfEndDate');
		var zbtfSort = document.getElementById('zbtfSort');
		var zbtfSeq = document.getElementById('zbtfSeq');
		var zbtfName = document.getElementById('zbtfName');
		var zbtfAddr = document.getElementById('zbtfAddr');
		var locationX = document.getElementById('zbtfLocationX');
		var locationY = document.getElementById('zbtfLocationY');
		var zbspSeq = document.getElementById('zbspSeq');
		
	 	// 여행계획 flag 마커 생성
			for (var i = 0; i < planFlagArr.length; i ++) {
				addPlanMarker(planFlagArr[i]);
			};
			function addPlanMarker(planFlagArr) {
				var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
		   		var imageSize = new kakao.maps.Size(24, 35); 
			    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
			    
			    var planMarker = new kakao.maps.Marker({
			        position: planFlagArr.position, // 마커를 표시할 위치
			        title : planFlagArr.zbtfName, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			        zIndex : 3,
			        //image : markerImage // 마커 이미지 
			    });
			    planMarker.setMap(map);
				kakao.maps.event.addListener(planMarker, 'click', function() {
					    
						if (!selectedMarker || selectedMarker != planMarker ) {
							
						}
						selectedMarker = planMarker;
						zbtfSeq.value = planFlagArr.zbtfSeq;
						zbtfName.value = planMarker.getTitle();
						zbtfAddr.value = planFlagArr.zbtfAddr;
						locationX.value = planMarker.getPosition().getLat();
						locationY.value = planMarker.getPosition().getLng();
				});
				planMarkers.push(planMarker);
			}
			function setPlanMarkers(map) {
			    for (var i = 0; i < planMarkers.length; i++) {
			    	planMarkers[i].setMap(map);
			    }            
			}
		//		console.log(planMarkers);
		// 추억 flag 마커 생성
			for (var j = 0; j < memFlagArr.length; j ++) {
			    addMemMarker(memFlagArr[j]);
			};
			function addMemMarker(memFlagArr) {
				var ImageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
			    var imageSize = new kakao.maps.Size(24, 35); 
			    var MarkerImage = new kakao.maps.MarkerImage(ImageSrc, imageSize); 
			    
			    var memMarker = new kakao.maps.Marker({
			        position: memFlagArr.position, // 마커를 표시할 위치
			        title : memFlagArr.zbtfName, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			        image : MarkerImage, // 마커 이미지 
			    });
				    
			    memMarker.setMap(map);
				kakao.maps.event.addListener(memMarker, 'click', function() {
				      // 마커 위에 인포윈도우를 표시합니다
					//var latlng = mouseEvent.latLng;
					
					if (!selectedMarker || selectedMarker != memMarker ) {
						
					}
					selectedMarker = memMarker;
					zbtfSeq.value = memFlagArr.zbtfSeq;
					zbtfName.value = memMarker.getTitle();
					zbtfAddr.value = memFlagArr.zbtfAddr;
					locationX.value = memMarker.getPosition().getLat();
					locationY.value = memMarker.getPosition().getLng();
				});
				memMarkers.push(memMarker);
			}
			function setMemMarkers(map) {
			    for (var i = 0; i < memMarkers.length; i++) {
			    	memMarkers[i].setMap(map);
			    }            
			}
			function changeMarkerMap(type) {
				if (type == 'allMarker') {
					setPlanMarkers(map);
					setMemMarkers(map);
		        }
				else if (type == 'planMarker') {
					setPlanMarkers(map);
					setMemMarkers(null);
		        }
				else if (type == 'memMarker') {
					setPlanMarkers(null);
					setMemMarkers(map);
		        }
			}
			$('input[type=radio][name=flagType]').change(function(){
			    var type = $('input[type=radio][name=flagType]');
			    changeMarkerMap($(this).val());
			    /* for(var i=0; i<type.length; i++){
			        if($(this).val() != $(type[i]).val()){
			            $(type[i]).siblings('input').val("");
			        }
			    } */
			});
			$('input[type=radio][name=zbtfTypeCode]').change(function(){
			    var type = $('input[type=radio][name=zbtfTypeCode]');
			     for(var i=0; i<type.length; i++){
			    	 
			        if($(this).val() != $(type[i]).val()){
			            $(type[i]).siblings('input').val("");
			       }
			    }
					console.log($(this).val());	    
					//zbtfSort.val("0");
			});
			
			
			
		 	$("#btnSave").on("click", function() {
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
								"zbtfTypeCode" : $("#zbtfTypeCode").val(),
								"zbtfStartDate" : $("#zbtfStartDate").val(),
								"zbtfEndDate" : $("#zbtfEndDate").val(),
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
									
									
								} else {
									alert("등록 실패");
									console.log(response.flagListJson);
									jsonData = response.flagListJson;
									
								}
							},
							error : function(jqXHR, textStatus, errorThrown) {
								alert("ajaxUpdate " + jqXHR.textStatus + " : "
										+ jqXHR.errorThrown);
							}
						});
					});
	</script>
</body>
</html>