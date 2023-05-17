<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<%@ page session="true"%>

					<div class="wP">
						<div class="category">
							<div class="radio">
								<input id="allMarker" name="flagType" type="radio" value="allMarker" checked>
								<label for="allMarker" class="radio-label">전체</label>
							</div>
							<div class="radio">
								<input id="planMarker" name="flagType" type="radio" value="planMarker">
								<label for="planMarker" class="radio-label">계획 루트</label>
							</div>
							<div class="radio">
								<input id="memMarker" name="flagType" type="radio" value="memMarker">
								<label for="memMarker" class="radio-label">추억 루트</label>
							</div>
						</div>
					</div>
					<div class="map_wrap">
					<!-- <div class="mapDetail" id="map"></div> -->
						<div class="mapDetail" id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
					<div id="menu_wrap" name="menu_wrap" class="bg_white d-none">
						<ul id="placesList">
							<li class="item"><div class="text-center"><h2 class="fw-bold">검색 결과가 존재하지 않습니다.</h5><span></span></div></li>
						</ul>
						<div id="pagination"></div>
					</div>
				</div>

	<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=08dd86f56b8d2604cae40cef7de922be&libraries=services,clusterer,drawing"></script> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/a1961b2393.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<script type="text/javascript">
	var zbtfSeq = $("input:hidden[name=zbtfSeq]").val();
	var zbtfFlagName = $("input:hidden[name=zbtfFlagName]");
	var zbtfName = $("input:hidden[name=zbtfName]");
	var zbtfAddr = $("input:hidden[name=zbtfAddr]");
	var zbtfLocX = $("input:hidden[name=zbtfLocationX]");
	var zbtfLocY = $("input:hidden[name=zbtfLocationY]");
	
	// controller 에서 전달받은 TravelFlag selectList 전역변수 선언
		var jsonData = JSON.parse('${flagListJson}');

		// 계획 flag JSON Data Array, Object 선언
		var planFlagArr = new Array();
		var planFlagObj = new Object();
		
		var linePath = new Array;
		var path = new Object;
		
		// 추억 flag JSON Data Array, Object 선언
		var memFlagArr = new Array();
		var memFlagObj = new Object();
		
		if (jsonData.length != 0) {
			for(var i = 0; i < jsonData.length; i++) {
				// 추억 flag JSON Data Array 형식으로 변환 s
				if (jsonData[i].zbtfTypeCode == 1) {
					memFlagObj = new Object(); // refresh array
					memFlagObj.zbtfSeq = jsonData[i].zbtfSeq;
					memFlagObj.zbtfDate = jsonData[i].zbtfDate;
					memFlagObj.zbtfFlagName = jsonData[i].zbtfFlagName;
					memFlagObj.zbtfTypeCode = jsonData[i].zbtfTypeCode;
					memFlagObj.zbtfName = jsonData[i].zbtfName;
					memFlagObj.zbtfAddr = jsonData[i].zbtfAddr;
					memFlagObj.zbtfSort = jsonData[i].zbtfSort;
					memFlagObj.zbtfLocationX = jsonData[i].zbtfLocationX;
					memFlagObj.zbtfLocationY = jsonData[i].zbtfLocationY;
					memFlagObj.zbspSeq = jsonData[i].zbspSeq;
					memFlagObj.position = new kakao.maps.LatLng(jsonData[i].zbtfLocationX, jsonData[i].zbtfLocationY);
					memFlagArr.push(memFlagObj);
				// 추억 flag JSON Data Array 형식으로 변환 e
				}
				
				// 계획 flag Json Data Array 형식으로 변환 s
				else {
					planFlagObj = new Object(); // refresh array
					planFlagObj.zbtfSeq = jsonData[i].zbtfSeq;
					planFlagObj.zbtfDate = jsonData[i].zbtfDate;
					planFlagObj.zbtfFlagName = jsonData[i].zbtfFlagName;
					planFlagObj.zbtfTypeCode = jsonData[i].zbtfTypeCode;
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
		}
		
		// CLICK EVENT로 현재 선택된 마커 null로 초기화
		selectedMarker = null;
		
		
		// radio값 기본 전체 마커 표시로 지정
		changeMarkerMap(allMarker);
		
		// 현재 위치는 여행 경로의 시작점 고정
		var normalLocation;
		var nowLocation;
		var voLocation;
		var mapLevel;
		
		console.log(zbtfSeq);
		if (zbtfSeq > 0) {
			voLocation = new kakao.maps.LatLng(zbtfLocX.val(), zbtfLocY.val());
			console.log("here");
			mapLevel = 7;
			normalLocation = voLocation;
		} else if (planFlagArr.length != 0) {
			nowLocation = planFlagArr[0].position;
			normalLocation = nowLocation;
			mapLevel = 11;
		} else {
			normalLocation = new kakao.maps.LatLng(37.502068650082194, 127.024550172101);
			mapLevel = 10;
		}
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : normalLocation, // 지도의 중심좌표 - 출발지로 설정됨
			level : mapLevel // 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		var mapTypeControl = new kakao.maps.MapTypeControl();
		var zoomControl = new kakao.maps.ZoomControl();

		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		var content = '<div class="wrap">' + 
        '    <div class="info">' + 
        '        <div class="title">' + 
        '           '+ zbtfFlagName.val() +'' + 
        '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
        '        </div>' + 
        '        <div class="body">' + 
        '            <div class="desc"> ' + 
        '                <div class="ellipsis">' + zbtfName.val() + '</div>' + 
        '                <div class="jibun ellipsis"> ' + zbtfAddr.val() + ' ' + 
        '                <div><a href="https://map.kakao.com/link/map/'+zbtfFlagName.val()+ ': '+zbtfAddr.val()+','+zbtfLocX.val()+','+zbtfLocY.val()+'" target="_blank" class="link">카카오맵 보기</a></div>' + 
        '            </div>' + 
        '        </div>' + 
        '    </div>' +    
        '</div>';
        
        var overlay = new kakao.maps.CustomOverlay({
            content: content,
            map: map,
            position: voLocation,
            zIndex: 9
        });

        // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
            overlay.setMap(map);

        // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
        function closeOverlay() {
            overlay.setMap(null);     
        }
        
		// 여행 경로 생성
 		var polyline = new kakao.maps.Polyline({
		    path: linePath, // 선을 구성하는 좌표배열 입니다
		    strokeWeight: 4, // 선의 두께 입니다
		    strokeColor: 'tomato', // 선의 색깔입니다
		    strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		    strokeStyle: 'solid' // 선의 스타일입니다
		});
		polyline.setMap(map);
	
		// 계획 마커 Array 선언
		var planMarkers = [];
		// 추억 마커 Array 선언
		var memMarkers = [];
		
		// 중심으로 이동
		function setCenter() {            
		    // 지도 중심을 여행 출발지로 이동 시킵니다
		    map.panTo(nowLocation);
		    map.setLevel(11);
		}
		
		
		// input value ID 변수
		var zbtfDate = document.getElementById('zbtfDate');
		var zbtfSort = document.getElementById('zbtfSort');
		var zbtfSeq = document.getElementById('zbtfSeq');
		var zbtfTypeCode = document.getElementById('zbtfTypeCodeHidden');
		var zbtfFlagName = document.getElementById('zbtfFlagName');
		var zbtfName = document.getElementById('zbtfName');
		var zbtfAddr = document.getElementById('zbtfAddr');
		var locationX = document.getElementById('zbtfLocationX');
		var locationY = document.getElementById('zbtfLocationY');
		var zbspSeq = document.getElementById('zbspSeq');
		
		
		// 장소검색 개체
		var ps = new kakao.maps.services.Places(); 
		
		var infowindow = new kakao.maps.InfoWindow({zIndex:4});
		
		var markers = [];
		function searchPlaces() {
		    var keyword = document.getElementById('keyword').value;
		    var inputData = document.querySelectorAll('.inputData');
	
			//$("button[id=searchBtn]").on("click", function() {
				if (!keyword.replace(/^\s+|\s+$/g, '')) {
					document.getElementById("keywordMsg").classList.remove('d-none');
					document.getElementById("keywordMsg").classList.add('d-inline-block');
					$('#keywordMsg').text('키워드를 입력해주세요!');
					return false;
				} else {
					document.getElementById("keywordMsg").classList.remove('d-inline-block');
					document.getElementById("keywordMsg").classList.add('d-none');
				}
				
				// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
				$("div[name='menu_wrap']").removeClass("d-none");
				$("div[name='menu_wrap']").addClass("d-block");
				inputData.forEach(function(input) {
					input.value = "";
				});
				ps.keywordSearch(keyword, placesSearchCB);

		}

		function placesSearchCB(data, status, pagination) {
			 if (status === kakao.maps.services.Status.ZERO_RESULT) {
				document.getElementById("keywordMsg").classList.remove('d-none');
				document.getElementById("keywordMsg").classList.add('d-inline-block');
				$('#keywordMsg').text('검색 결과가 존재하지 않습니다.');
				return;

			} else if (status === kakao.maps.services.Status.ERROR) {
				document.getElementById("keywordMsg").classList.remove('d-none');
				document.getElementById("keywordMsg").classList.add('d-inline-block');
				$('#keywordMsg').text('검색 결과 중 오류가 발생했습니다.');
				return;

			} else if (status === kakao.maps.services.Status.OK) {
				document.getElementById("keywordMsg").classList.remove('d-inline-block');
				document.getElementById("keywordMsg").classList.add('d-none');
				// 정상적으로 검색이 완료됐으면
				// 검색 목록과 마커를 표출합니다
				zbtfSeq.value = "";
				displayPlaces(data);
				btnHide();
				closeOverlay();

				// 페이지 번호를 표출합니다
				displayPagination(pagination);

			}
		}

		function displayPlaces(places) {

			var listEl = document.getElementById('placesList'), menuEl = document
					.getElementById('menu_wrap'), fragment = document
					.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

			// 검색 결과 목록에 추가된 항목들을 제거합니다
			removeAllChildNods(listEl);

			// 지도에 표시되고 있는 마커를 제거합니다
			removeMarker(null);

			for (var i = 0; i < places.length; i++) {

				// 마커를 생성하고 지도에 표시합니다
				var placePosition = new kakao.maps.LatLng(places[i].y,
						places[i].x), marker = addMarker(placePosition, i,
						places), itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				bounds.extend(placePosition);

				// 마커와 검색결과 항목에 mouseover 했을때
				// 해당 장소에 인포윈도우에 장소명을 표시합니다
				// mouseout 했을 때는 인포윈도우를 닫습니다
				(function(marker, title, places, addr) {
					// 지번주소 확인
					function getAddr(addr) {
						return addr ? addr : places;
					}
					var markerLoc = new kakao.maps.LatLng(marker.getPosition()
							.getLat(), marker.getPosition().getLng());
					kakao.maps.event.addListener(marker, 'mouseover',
							function() {
								displayInfowindow(marker, title);
							});

					kakao.maps.event.addListener(marker, 'mouseout',
							function() {
								infowindow.close();
							});
					itemEl.onmouseover = function() {
						displayInfowindow(marker, title);
					};

					itemEl.onmouseout = function() {
						infowindow.close();
					};
					itemEl.onclick = function() {
						displayInfowindow(marker, title);
						map.panTo(markerLoc);
						zbtfDate.value = "";
						zbtfSeq.value = "";
						zbtfFlagName.value = "";
						zbtfName.value = title;
						zbtfAddr.value = getAddr(addr);
						locationX.value = marker.getPosition().getLat();
						locationY.value = marker.getPosition().getLng();
						zbtfSort.value = planFlagArr.length + 1;
					};
					kakao.maps.event.addListener(marker, 'click', function() {
						zbtfDate.value = "";
						zbtfSeq.value = "";
						zbtfFlagName.value = "";
						zbtfName.value = title;
						zbtfAddr.value = getAddr(addr);
						locationX.value = marker.getPosition().getLat();
						locationY.value = marker.getPosition().getLng();
						
						zbtfSort.value = planFlagArr.length + 1;
					});
				})(marker, places[i].place_name, places[i].address_name,
						places[i].road_address_name);

				fragment.appendChild(itemEl);
			}

			// 검색결과 항목들을 검색결과 목록 Element에 추가합니다
			listEl.appendChild(fragment);
			menuEl.scrollTop = 0;

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			map.setBounds(bounds);
		}

		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {

			var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
					+ (index + 1)
					+ '"></span>'
					+ '<div class="info">'
					+ '   <h5>' + places.place_name + '</h5>';

			if (places.road_address_name) {
				itemStr += '    <span id="markerAddr_' + (index + 1) + '">'
						+ places.road_address_name + '</span>'
						+ '   <span class="jibun gray">' + places.address_name
						+ '</span>';
			} else {
				itemStr += '    <span>' + places.address_name + '</span>';
			}

			itemStr += '  <span class="tel">' + places.phone + '</span>'
					+ '</div>';

			el.innerHTML = itemStr;
			el.className = 'item';

			return el;
		}

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title, places) {
			var clickImage = "https://cdn-icons-png.flaticon.com/512/4151/4151471.png";
			var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
			imgOptions = {
				spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
				spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				offset : new kakao.maps.Point(13, 37)
			// 마커 좌표에 일치시킬 이미지 내에서의 좌표
			}, clickImage = new kakao.maps.MarkerImage(clickImage, imageSize), markerImage = new kakao.maps.MarkerImage(
					imageSrc, imageSize, imgOptions), marker = new kakao.maps.Marker({
						position : position, // 마커의 위치
						image : markerImage
					});
			marker.normalImage = markerImage;
			kakao.maps.event.addListener(marker, 'click', function() {

				if (!selectedMarker || selectedMarker != marker) {
					!!selectedMarker && selectedMarker.setImage(selectedMarker.normalImage);
					marker.setImage(clickImage);
				}
				selectedMarker = marker;
				btnHide();
			});

			marker.setMap(map); // 지도 위에 마커를 표출합니다
			markers.push(marker); // 배열에 생성된 마커를 추가합니다

			return marker;
		}

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker(map) {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(map);
			}
			markers = [];
		}

		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
			var paginationEl = document.getElementById('pagination'), fragment = document
					.createDocumentFragment(), i;

			// 기존에 추가된 페이지번호를 삭제합니다
			while (paginationEl.hasChildNodes()) {
				paginationEl.removeChild(paginationEl.lastChild);
			}

			for (i = 1; i <= pagination.last; i++) {
				var el = document.createElement('a');
				el.href = "#";
				el.innerHTML = i;

				if (i === pagination.current) {
					el.className = 'on';
				} else {
					el.onclick = (function(i) {
						return function() {
							pagination.gotoPage(i);
						}
					})(i);
				}

				fragment.appendChild(el);
			}
			paginationEl.appendChild(fragment);
		}

		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		// 인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, flagArr) {
			var flagContent =
	        '    <div class="info">' + 
	        '        <div class="title">' + 
	        '           '+ flagArr.zbtfFlagName +'' + 
	        '        </div>' + 
	        '        <div class="body">' + 
	        '            <div class="desc"> ' + 
	        '                <div class="ellipsis">' + flagArr.zbtfName + '</div>' + 
	        '                <div class="jibun ellipsis"> ' + flagArr.zbtfAddr + ' ' + 
	        '                <div><a href="https://map.kakao.com/link/map/'+flagArr.zbtfFlagName+ ': '+flagArr.zbtfAddr+','+flagArr.zbtfLocationX+','+flagArr.zbtfLocationY+'" target="_blank" class="link">카카오맵 보기</a></div>' + 
	        '            </div>' + 
	        '        </div>' + 
	        '    </div>';

			infowindow.setContent(flagContent);
			infowindow.open(map, marker);
		}

		// 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {
			while (el.hasChildNodes()) {
				el.removeChild(el.lastChild);
			}
		}
		var planSort;
		var planSortLast = (planFlagArr.length) - 1;
		
		
		function displayInfoPlan(marker, flagArr) {
			var flagContent = '<div class="wrap">' + 
	        '    <div class="info">' + 
	        '        <div class="title">' + 
	        '           '+ flag.zbtfFlagName +'' + 
	        '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
	        '        </div>' + 
	        '        <div class="body">' + 
	        '            <div class="desc"> ' + 
	        '                <div class="ellipsis">' + flag.zbtfName + '</div>' + 
	        '                <div class="jibun ellipsis"> ' + flag.zbtfAddr + ' ' + 
	        '                <div><a href="https://map.kakao.com/link/map/'+flag.zbtfFlagName+ ': '+flag.zbtfAddr+','+flag.zbtfLocationX+','+flag.zbtfLocationY+'" target="_blank" class="link">카카오맵 보기</a></div>' + 
	        '            </div>' + 
	        '        </div>' + 
	        '    </div>' +    
	        '</div>';

			infowindow.setContent(flagContent);
			infowindow.open(map, marker);
		}
		
		function displayFlagOverlay(flag, mapVal){
			// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
			var flagContent = '<div class="wrap">' + 
	        '    <div class="info">' + 
	        '        <div class="title">' + 
	        '           '+ flag.zbtfFlagName +'' + 
	        '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
	        '        </div>' + 
	        '        <div class="body">' + 
	        '            <div class="desc"> ' + 
	        '                <div class="ellipsis">' + flag.zbtfName + '</div>' + 
	        '                <div class="jibun ellipsis"> ' + flag.zbtfAddr + ' ' + 
	        '                <div><a href="https://map.kakao.com/link/map/'+flag.zbtfFlagName+ ': '+flag.zbtfAddr+','+flag.zbtfLocationX+','+flag.zbtfLocationY+'" target="_blank" class="link">카카오맵 보기</a></div>' + 
	        '            </div>' + 
	        '        </div>' + 
	        '    </div>' +    
	        '</div>';
			
			//마커 위에 커스텀오버레이를 표시합니다
			//마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
			var overlay = new kakao.maps.CustomOverlay({
				zIndex : 4,
				content: flagContent,
				position: flag.position    
			});
			
		}
		
		// 여행계획 flag 마커 생성
		for (var i = 0; i < planFlagArr.length; i++) {
			planSort = i;
			addPlanMarker(planFlagArr[i], planSort);
			displayFlagOverlay(planFlagArr[i], 0);
		};
		function addPlanMarker(planFlagArr, planSort) {
			
			var clickImage = "https://cdn-icons-png.flaticon.com/512/4151/4151471.png";
			var normalImage = "https://cdn-icons-png.flaticon.com/512/3037/3037939.png";
			/* var normalImage = "https://cdn-icons-png.flaticon.com/512/2776/2776000.png"; */
			var imageSize = new kakao.maps.Size(30, 35);

			var markerImage = new kakao.maps.MarkerImage(normalImage, imageSize);
			var clickImage = new kakao.maps.MarkerImage(clickImage, imageSize);
			
			var startSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_b.png', // 출발 마커이미지의 주소입니다    
		    startSize = new kakao.maps.Size(50, 45), // 출발 마커이미지의 크기입니다 
		    startOption = { 
		        offset: new kakao.maps.Point(15, 43) // 출발 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
		    };

			// 출발 마커 이미지를 생성합니다
			var startImage = new kakao.maps.MarkerImage(startSrc, startSize, startOption);
			
			var arriveSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_b.png', // 도착 마커이미지 주소입니다    
			arriveSize = new kakao.maps.Size(50, 45), // 도착 마커이미지의 크기입니다 
			arriveOption = { 
			    offset: new kakao.maps.Point(15, 43) // 도착 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
			};
			

			// 도착 마커 이미지를 생성합니다
			var arriveImage = new kakao.maps.MarkerImage(arriveSrc, arriveSize, arriveOption);
			
			var planMarker = new kakao.maps.Marker({
				position : planFlagArr.position, // 마커를 표시할 위치
				title : planFlagArr.zbtfFlagName, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				zIndex : 3,
				image : markerImage
			// 마커 이미지 
			});
			planMarker.setMap(map);
			
			if( planSort < 1 ) {
				planMarker.setImage(startImage);
			}
			else if ( planSort == planSortLast ) {
				planMarker.setImage(arriveImage);
			}
			else {
				planMarker.normalImage = markerImage
			}
			kakao.maps.event.addListener(planMarker, 'mouseover',
					function() {
						displayInfowindow(planMarker, planFlagArr);
						closeOverlay();
					});
			kakao.maps.event.addListener(planMarker, 'mouseout',
					function() {
						//infowindow.close();
						closeOverlay();
						//closeFlagOverlay();
					});
			kakao.maps.event.addListener(planMarker, 'click', function() {
				map.panTo(planFlagArr.position);
				closeOverlay();
				console.log("나옴");
				if (!selectedMarker || selectedMarker != planMarker) {
					if(planSort < 1 ) {
						planMarker.normalImage = startImage;
					}
					else if (planSort == planSortLast ) {
						planMarker.normalImage = arriveImage;
					}
					displayInfowindow(planMarker, planFlagArr);
					!!selectedMarker && selectedMarker.setImage(selectedMarker.normalImage);
					planMarker.setImage(clickImage);
				}
				selectedMarker = planMarker;
				zbtfSeq.value = planFlagArr.zbtfSeq;
				zbtfDate.value = planFlagArr.zbtfDate;
				zbtfFlagName.value = planFlagArr.zbtfFlagName;
				zbtfTypeCode.value = planFlagArr.zbtfTypeCode;
				zbtfSort.value = planFlagArr.zbtfSort;
				//console.log("sort: " + planFlagArr.zbtfSort);
				//console.log("marker" + zbtfTypeCode.value);
				zbtfName.value = planFlagArr.zbtfName;
				zbtfAddr.value = planFlagArr.zbtfAddr;
				locationX.value = planMarker.getPosition().getLat();
				locationY.value = planMarker.getPosition().getLng();
				//console.log("초기값 : " + $(typeCode).val());
				$("input[type=radio][name='zbtfTypeCode']").removeAttr("checked"); //우선 체크되어 있는 값을 초기화
				$("input[id=zbtfTypeCode-1]").prop("checked", true);
				btnHide();
				hideImage();
			});
			planMarkers.push(planMarker);
		}
		/* kakao.maps.event.addListener(planMarker, 'click', function() {
			
		}); */

		// 계획 flag 마커 맵 표시 function
		function setPlanMarkers(map) {
			for (var i = 0; i < planMarkers.length; i++) {
				planMarkers[i].setMap(map);
			}
		}
		
		
		function displayInfoPlan(memMarker, memFlagArr) {
			var content = '<div style="padding:5px;z-index:1;">' + memFlagArr.zbtfFlagName
					+ '</div>';
			infowindow.setContent(content);
			infowindow.open(map, memMarker);
		}
		
		// 추억 flag 마커 생성
		for (var j = 0; j < memFlagArr.length; j++) {
			addMemMarker(memFlagArr[j]);
		};
		function addMemMarker(memFlagArr) {
			/* var clickImage = "https://cdn-icons-png.flaticon.com/512/4151/4151471.png"; */
			var clickSrc = "https://cdn-icons-png.flaticon.com/512/4151/4151471.png";
			var normalImage = "https://cdn-icons-png.flaticon.com/512/3005/3005943.png";
			var imageSize = new kakao.maps.Size(30, 35);

			var markerImage = new kakao.maps.MarkerImage(normalImage, imageSize);
			var clickImage = new kakao.maps.MarkerImage(clickSrc, imageSize);

			var memMarker = new kakao.maps.Marker({
				position : memFlagArr.position, // 마커를 표시할 위치
				title : memFlagArr.zbtfFlagName, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				image : markerImage, // 마커 이미지 
			});

			memMarker.setMap(map);
			memMarker.normalImage = markerImage;
			kakao.maps.event.addListener(memMarker, 'mouseover',
					function() {
						displayInfowindow(memMarker, memFlagArr);
					});

			kakao.maps.event.addListener(memMarker, 'mouseout',
					function() {
						//infowindow.close();
					});
			kakao.maps.event.addListener(memMarker, 'click', function() {
				map.panTo(memFlagArr.position);
				closeOverlay();

				if (!selectedMarker || selectedMarker != memMarker) {

					!!selectedMarker && selectedMarker.setImage(selectedMarker.normalImage);
					memMarker.setImage(clickImage);
				}
				selectedMarker = memMarker;
				zbtfSeq.value = memFlagArr.zbtfSeq;
				zbtfDate.value = memFlagArr.zbtfDate;
				zbtfFlagName.value = memFlagArr.zbtfFlagName;
				zbtfTypeCode.value = memFlagArr.zbtfTypeCode;
				zbtfName.value = memFlagArr.zbtfName;
				zbtfAddr.value = memFlagArr.zbtfAddr;
				locationX.value = memMarker.getPosition().getLat();
				locationY.value = memMarker.getPosition().getLng();

				$("input[type=radio][name='zbtfTypeCode']").removeAttr("checked"); //우선 체크되어 있는 값을 초기화
				$("input[id=zbtfTypeCode-2]").prop("checked", true);
				btnHide();
				hideImage();
			});
			memMarkers.push(memMarker);
		}
		// 추억 flag 마커 맵 표시 function
		function setMemMarkers(map) {
			for (var i = 0; i < memMarkers.length; i++) {
				memMarkers[i].setMap(map);
			}
		}
		
		var searchBox = $("form[id=searchBox]");
		var menuWrap = $("div[name=menu_wrap]");
		
		// 지도에 표시될 마커 radio Jquery
		$('input[type=radio][name=flagType]').change(function() {
			var type = $('input[type=radio][name=flagType]');
			changeMarkerMap($(this).val());
		});
		
		// radio 값에 따라 지도에 표시 옵션 설정
		function changeMarkerMap(type) {
			hideImage();
			if (type == 'allMarker') {
				setCenter();
				setPlanMarkers(map);
				setMemMarkers(map);
				menuWrap.removeClass("d-block");
				menuWrap.addClass("d-none");
				removeMarker(null);
				setFlagOverlay(null);
			} else if (type == 'planMarker') {
				setCenter();
				setPlanMarkers(map);
				setMemMarkers(null);
				menuWrap.removeClass("d-block");
				menuWrap.addClass("d-none");
				removeMarker(null);
				setFlagOverlay(null);
			} else if (type == 'memMarker') {
				setCenter();
				setPlanMarkers(null);
				setMemMarkers(map);
				menuWrap.removeClass("d-block");
				menuWrap.addClass("d-none");
				removeMarker(null);
				setFlagOverlay(null);
			} 
		}
		function btnHide() {
				var btnSave = $('button[name=btnSave]');
				var btnUelete = $('button[name=btnUelete]');
				if(zbtfSeq.value > 0) {
					btnSave.removeClass("d-none");
					btnSave.addClass("d-inline-block");
					btnUelete.removeClass("d-none");
					btnUelete.addClass("d-inline-block");
				}
				else {
					btnSave.removeClass("d-none");
					btnSave.addClass("d-inline-block");
					btnUelete.removeClass("d-inline-block");
					btnUelete.addClass("d-none");
				}
		}

		function hideImage() {
			if ($('input[type=radio][name=zbtfTypeCode]:checked').val() > 0) {
				$("div[id='imageBox']").removeClass("d-none"); //우선 체크되어 있는 값을 초기화
				$("div[id='imageBox']").addClass("d-block"); //우선 체크되어 있는 값을 초기화
			}
			else {
				$("div[id='imageBox']").removeClass("d-block"); //우선 체크되어 있는 값을 초기화
				$("div[id='imageBox']").addClass("d-none"); //우선 체크되어 있는 값을 초기화
				if(zbtfSeq.value == null || zbtfSeq.value < 0 || zbtfTypeCode.value == 0) {
					zbtfSort.value = (planFlagArr.length + 1);
				}
			}
		}
	</script>
