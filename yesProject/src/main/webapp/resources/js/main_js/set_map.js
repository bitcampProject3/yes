
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(37.554976260087024, 127.12879044359133),
			level: 2
		};

		var map = new daum.maps.Map(container, options);

		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new daum.maps.MapTypeControl();

		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new daum.maps.ZoomControl();
		map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

		// 마커 클러스터러를 생성
		var clusterer = new daum.maps.MarkerClusterer({
			map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
			averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
			minLevel: 6, // 클러스터 할 최소 지도 레벨
			minClusterSize: 1,
			styles: [{
				width: '53px', height: '52px',
				background: 'url("./imgs/clusterer.png") no-repeat',
				color: '#fff',
				textAlign: 'center',
				lineHeight: '50px'
			}]
		});
		var branchCom = [];
		var addressArray = [];

		var geocoder = new daum.maps.services.Geocoder();
		var coords = null;
		var markerPosition = null;


		// 일정 레벨 이상으로 축소 됐을 경우에 popup display none
		daum.maps.event.addListener(map, 'zoom_changed', function () {
			var level = map.getLevel();
			if (level >= 5) {
				$('.wrap').css('display', 'none');
				selectedMarker = null;
			}
		});


		var selectedMarker = null;

		function addMarker(markerPosition, branchArr) {
			$('.btn-gradient').click(function (event) {
				event.preventDefault();
			});



			var id = branchArr[0],
				branchName = branchArr[1],
				opTime = branchArr[2],
				breakTime = branchArr[3],
				opDate = branchArr[4],
				phoneNum = branchArr[5],
				score = branchArr[6],
				state = branchArr[7],
				zoneCode = branchArr[8],
				roadAddress = branchArr[9],
				jibunAddress = branchArr[10],
				detailAddress = branchArr[11],
				markerImage = branchArr[12],
				mainImage = branchArr[13],
				image1 = branchArr[14],
				image2 = branchArr[15],
				image3 = branchArr[16],
				image4 = branchArr[17],
				image5 = branchArr[18],
				image6 = branchArr[19],
				image7 = branchArr[20],
				image8 = branchArr[21],
				category = branchArr[22],
				branchExplain = branchArr[23],
				sido = branchArr[24],
				sigungu = branchArr[25],
				category = branchArr[26];

			var imageSrc = './imgs/markerIcon/' + markerImage, // 마커이미지의 주소입니다
				imageSize = new daum.maps.Size(55, 55), // 마커이미지의 크기입니다
				imageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

			// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
			var marker = new daum.maps.Marker({
				position: markerPosition,
				title: id,
				image: markerImage // 마커이미지 설정
			});
			var className = '' + id + ' wrap';


			// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정
			// 커스텀 오버레이에 표시할 컨텐츠
			var content = document.createElement('div');
			content.className = className;
			content.innerHTML = '<div class="info">' +
				'<div class="title">' +
				'<p>' + branchName + '</p>' +
				'<div class="close" title="닫기"></div>' +
				'</div>' +
				'<div class="popupBody">' +
				'<div class="img">' +
				'<img src="./imgs/foodimgs/' + mainImage + '" width="100" height="100">' +
				'</div>' +
				'<div class="desc">' +
				'<div class="address ellipsis">' + roadAddress + ' ' + detailAddress + '</div>' +
				'<div class="jibun ellipsis">(우) ' + zoneCode + ' (지번) ' + jibunAddress + '</div>' +
				'<div class="phone ellipsis">' + phoneNum + '</div>' +
				'<div class="ellipsis"><br/></div>' +
				'<div class="timeDiv">' +
				'<div class="timeDiv1">' +
				'영업시간' +
				'</div>' +
				'<div class="timeDiv2">' +
				opTime +
				'</div>' +
				'</div>' +
				'<div class="dayDiv">' +
				'<div class="dayDiv1">' +
				'영업일' +
				'</div>' +
				'<div class="dayDiv2">' +
				opDate +
				'</div>' +
				'</div>' +
				'<div class="breakDiv">' +
				'<div class="breakDiv1">' +
				'휴게시간' +
				'</div>' +
				'<div class="breakDiv2">' +
				breakTime +
				'</div>' +
				'</div>' +
				'<div class="restDiv">' +
				'<div class="restDiv1">' +
				'대표메뉴' +
				'</div>' +
				'<div class="restDiv2">' +
				'<div class="restDiv2_1">' +
				'</div>' +
				'<div class="restDiv2_2">' +
				'</div>' +
				'<div class="restDiv2_3">' +
				'</div>' +
				'<div class="restDiv3_1">' +
				'</div>' +
				'<div class="restDiv3_2">' +
				'</div>' +
				'<div class="restDiv3_3" style="text-align: left;">' +
				'</div>' +
				'<div class="restDiv4_1">' +
				'</div>' +
				'<div class="restDiv4_2">' +
				'</div>' +
				'<div class="restDiv4_3">' +
				'</div>' +
				'</div>' +
				'</div>' +
				'<div class="gradeDiv">' +
				'<div class="gradeDiv1">' +
				'이용자 평점' +
				'</div>' +
				'<div class="gradeDiv2" style="font-size: 15px;">' +
				'<span class="reviewScoreAvg"></span>' + ' / 5.0' +
				'</div>' +
				'<div class="gradeDiv3">' +
				'<img src="./imgs/angryemoji.png"' + 'class="angryEmoji">' +
				'</div>' +
				'</div>' +
				'<div class="btnDiv">' +
				'<a href="#branchDetailModal" onclick="javascript:branchDetail(\'' + branchArr + '\');" rel="modal:open" class="btn-gradient gray block">상세보기</a>' +
				'<a href="#reserveModal" onclick="javascript:reserveModal(\'' + branchName + '\',\'' + id + '\')" rel="modal:open" class="btn-gradient red block">바로예약</a>' +
				'</div>' +
				'</div>' +
				'</div>' +
				'</div>';

			// 마커 위에 커스텀오버레이를 표시합니다

			// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
			var overlay = new daum.maps.CustomOverlay({
				content: content,
				map: map,
				position: marker.getPosition()
			});


			$('.wrap').css('display', 'none');



			var callback = function () {
				var test = [];
				$.ajax({
					type: 'POST',
					url: './popup',
					data: id,
					dataType: 'json',
					success: function (data) {
						$.each(data, function (idx, val) {
							test.push(val.menu);
							test.push(val.price);
							mapSetMarker(test);
						}); // each end
					}     // success end
				});     // ajax end



				function mapSetMarker(test) {

					var mapProjection = map.getProjection(),
						// 해당 위도 경도값을 X,Y값으로 반환해줌
						latlng = markerPosition,
						// 지도 좌표에 해당하는 위치 좌표
						mapPixel = mapProjection.containerPointFromCoords(latlng);

					var center = map.getCenter();
					var mapCenter = mapProjection.containerPointFromCoords(center);
					var deltaX = mapPixel.x - mapCenter.x,
						deltaY = mapPixel.y - mapCenter.y;


					// case 1 : 마커 최초 클릭
					// case 2 : 다른 마커가 활성화 되어있는 상황에서 다른 마커 클릭
					// case 3 : 다른 마커를 none 한 후에 또 다른 마커 클릭
					// state 초기값은 null

					// 마커를 클릭 시에 모든 오버레이를 none 한 후 마커의 오버레이만 inherit
					// -> 마커에서 스토어의 이름을 가져올 방법 생각해봐야 함
					// -> 마커에 Title을 set,get 하는 방법으로 해결

					// 해결
					// case 1 : state가 null인 상태에서 오버레이를 생성하고 display inherit으로 변경
					// case 2 : state가 처음에 클릭했던 marker가 아니면 모든 오버레이 display none 후에
					//          markerTitle으로 선택된 marker을 골라내어 해당 오버레이의 display inherit함
					// case 3 : state가 이전에 선택했던 marker와 같다면 모든 오버레이의 display none

					var markerTitle = marker.getTitle();

					// case 1
					if (selectedMarker === null) {
						selectedMarker = markerTitle;
						overlay.setMap(map);
						map.panBy(deltaX - 25, deltaY - 250);
						$('.' + markerTitle + '').css('display', 'inherit');
						// case 2
					} else if (selectedMarker !== markerTitle) {
						overlay.setMap(map);
						map.panBy(deltaX - 25, deltaY - 250);
						$('.wrap').css('display', 'none');
						$('.' + markerTitle + '').css('display', 'inherit');
						selectedMarker = markerTitle;
						// case3
					} else if (selectedMarker === markerTitle) {
						$('.wrap').css('display', 'none');
						selectedMarker = null;
//                              overlay.setMap(null);
					}
					// close 버튼으로 종료 했을시 case 3으로 변경되는 문제
					// 버튼 클릭시에 selectedMarker를 null 잡아주면 될듯 --> 완료
					$('.close').click(function () {
						$('.wrap').css('display', 'none');
						selectedMarker = null;
					});

					for (i = 0; i < test.length; i++) {
						if (test.length > 1) {
							$('.restDiv2_2').css('border-bottom', '1px dotted gray');
							$('.restDiv2_1').text(test[0]);
							$('.restDiv2_3').text(test[1]+"원");
						}
						if (test.length > 3) {
							$('.restDiv3_2').css('border-bottom', '1px dotted gray');
							$('.restDiv3_1').text(test[2]);
							$('.restDiv3_3').text(test[3]+"원");
						}
						if (test.length > 5) {
							$('.restDiv4_2').css('border-bottom', '1px dotted gray');
							$('.restDiv4_1').text(test[4]);
							$('.restDiv4_3').text(test[5]+"원");
						}
					}

					// // 리뷰게시판의 평점 평균을 불러옴
					$.ajax({
						type: 'POST',
						url: './loadReviewScoreAvg',
						data: id,
						dataType: 'text',
						success: function (data) {
							if(data === '6.0') $('.reviewScoreAvg').text('평가없음');
							else $('.reviewScoreAvg').text(data);
						},
						error: function (request, status, error) {
							alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
						}
					});
				}
			};
			daum.maps.event.addListener(marker, 'click', callback);
			clusterer.addMarker(marker);
			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
			overlay.setMap(null);
		} // for end
