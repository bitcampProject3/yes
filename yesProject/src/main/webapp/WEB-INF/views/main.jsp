<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR"%>
<!Doctype html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/selectDesign.css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mapStyle.css?ver=2">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/clndrstyle.css?ver=1">
	    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
	    <script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.js"></script>
    </head>
    <style>
	    .selectTimeContent{
	        width: 50px;
            height: 25px;
            border: 1px solid gray;
            background-color: white;
            display: inline-block;
            margin-right: 3px;
		    margin-bottom: 5px;
		    text-align: center;
	    }
	    
	    .selectTime5, .selectTime10, .selectTime15, .selectTime15, .selectTime20,
	    .selectTime25, .selectTime30, .selectTime35, .selectTime40, .selectTime45,
	    .selectTime50, .selectTime55, .selectTime60,
	    .selectTime65, .selectTime70, .selectTime75
	    {
		    margin-right: 0px;
	    }
    </style>
 <body>
       
       <jsp:include page="./layout/header.jsp"/>
        
        <div class="page" id="page" style="z-index:0;position:relative;">
            <script type="text/javascript">
	           
            function mapResize() {
                var mapResize = document.getElementById('page');
                mapResize.style.width = window.innerWidth;
                mapResize.style.height = window.innerHeight - 100+'px';
            }
            window.onload = function() {
                mapResize();

                // 브라우저 크기가 변할 시 동적으로 사이즈를 조절해야 하는경우
                window.addEventListener('resize', mapResize);
            }
            
            function searchStart() {
                
                
                var testMsg;
                var searchArr = {};
                var searchLatArr = [],
	                searchLngArr = [],
	                searchNameArr = [];
                searchArr["searchSelect"] = $('#searchSelect').val();
                searchArr["searchInput"] = $("input[name='searchInput']").val();
                
                $.ajax({
                    url: "search",
                    type: 'POST',
                    contentType: 'application/json; charset=utf-8',
                    data: JSON.stringify(searchArr),
                    success: function (data) {
                        if (data.length === 0){
                            alert('해당하는 매장이 없습니다.');
                            $("input[name='searchInput']").val('');
                        } else {
                            $('#searchResult').empty();
                            $.each(data,  function (idx, val) {
                                searchLatArr.push(val.latlngy);
                                searchLngArr.push(val.latlngx);
                                
                                var searchListContent = '<div class="results" onmouseover="resultsMouseOver(this, '+val.latlngy+', '+val.latlngx+')" onmouseout="resultsMouseOut(this)">' +
				                                        '    <div class="searchResultContent">' +
		                                                '       <div class="searchResultContentTitle">' +
						                                '         ' + val.branchName +
			                                            '       </div>' +
		                                                '       <div class="searchResultContentDiv">' +
		                                                '           <div class="searchMainImage">' +
					                                    '               <img src="./imgs/foodimgs/'+val.mainImage+'" width="80" height="80" class="searchImageFile">' +
				                                        '           </div>' +
					                                    '           <div class="searchResultContentDetail"><br/>' +
						                                '               주소 : ' +val.roadAddress+ '<br/>' +
						                                '               연락처 : ' +val.phoneNum+ '<br/>' +
					                                    '               평점 : ' +val.score+ ' / 5.0 <br/>' +
					                                    '           </div>' +
		                                                '       </div>' +
				                                        '    </div>' +
			                                            '</div>';
                                
                                $('#searchResult').append(searchListContent);
                                
                            });
                            var searchCnt = searchLngArr.length;
                            searchResultList(searchLatArr, searchLngArr);
                            alert('총 ['+searchCnt+']건 검색 완료');
                            $('.searchResultDiv').css('height','400px');
                            $('#searchBox').css('height','470px');
                        }
                    },
                    error:function(request,status,error){
                        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
                    });
            }
            
            function resultsMouseOver(e, lat, lng) {
                
                $('.wrap').css('display', 'none');
	            $(e).css('background-color','#e04f5f');
	            $(e).css('color','white');
	            $(e).css('font-weight','bold');
	            var moveLatLng = new daum.maps.LatLng(lat, lng);
	            map.setLevel(3);
				map.panTo(moveLatLng);
            }
            function resultsMouseOut(e) {
                $(e).css('background-color','white');
                $(e).css('color','black');
                $(e).css('font-weight','none');
                
            }
            
            function searchResultList(searchLatArr , searchLngArr) {
                var points = [];
                for (i = 0; i<searchLatArr.length; i++){
                    var templatlng = new daum.maps.LatLng(searchLatArr[i], searchLngArr[i]);
                    
                    points.push(templatlng);
                }
                
                var bounds = new daum.maps.LatLngBounds();
                for (i = 0; i<points.length; i++){
                    bounds.extend(points[i]);
                }
                map.setBounds(bounds);
            }
            
            
            </script>
            <div><img src="./imgs/icon.png" id="searchIcon1"></div>
            <div id="searchBox" style="height: 70px; width: 300px;">
	            <div style="width: 100%; height: 40px; margin-top: 12px; margin-bottom: 12px;">
		            <div style="display: inline-block; width: 30%; height: 100%;">
                        <select id="searchSelect" style="width: 100%; height: 100%;">
                            <option value="searchRocate">지역별</option>
                            <option value="searchName">상호명</option>
                            <option value="searchMenu">메뉴</option>
                        </select>
                    </div>
                    <div style="display: inline-block; width: 50%; height: 100%;">
                        <input type="text" style="width: 100%; height: 100%;" name="searchInput">
                    </div>
                    <div style="display: inline-block; width: 15%; height: 100%;">
                        <button class="searchBtn" onclick="searchStart()" style="width: 100%; height: 100%;">검색</button>
                    </div>
	            </div>
	            <div class="searchResultDiv" style="width: 100%; height: 0px;">
		            <div id="searchResult">
		            </div>
	            </div>
            </div>
            
            <div id="map"></div>
	        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=630e98d8425188c04dae0728c65822bb&libraries=services,clusterer"></script>
	        <script>
		        
		        var container = document.getElementById('map');
		        var options = {
			        center: new daum.maps.LatLng(37.50438513347702, 127.07697329184347),
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
				        width : '53px', height : '52px',
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


		        daum.maps.event.addListener(map, 'zoom_changed', function () {
			        var level = map.getLevel();
			        if (level >= 5){
				        $('.wrap').css('display', 'none');
				        selectedMarker = null;
			        }
		        });

		        <c:forEach items="${alist}" var="articleList">
		        geocoder.addressSearch('${articleList.roadAddress}', function (result, status) {
					
			        // 정상적으로 검색이 완료됐으면
			        if (status === daum.maps.services.Status.OK) {

				        var branchArr = ['${articleList.id}', '${articleList.branchName}',
					        '${articleList.opTime}', '${articleList.breakTime}',
					        '${articleList.opDate}','${articleList.phoneNum}',
					        '${articleList.score}','${articleList.state}',
					        '${articleList.zoneCode}', '${articleList.roadAddress}',
					        '${articleList.jibunAddress}', '${articleList.detailAddress}',
					        '${articleList.markerImage}', '${articleList.mainImage}',
					        '${articleList.image1}', '${articleList.image2}',
					        '${articleList.image3}', '${articleList.image4}',
					        '${articleList.image5}','${articleList.image6}',
					        '${articleList.image7}','${articleList.image8}',
					        '${articleList.category}', '${articleList.branchExplain}',
					        '${articleList.sido}', '${articleList.sigungu}',
				            '${articleList.category}'];
				        
				        coords = new daum.maps.LatLng(result[0].y, result[0].x);


						if (('${articleList.latlngx}' && '${articleList.latlngy}')===''){
				        //기등록된 자료에 latlng 입력
							alert('좌표없음'+tempId);
						var latlngY = result[0].y,
							latlngX = result[0].x;
						var tempId = '${articleList.id}';
						$.ajax({
							type: 'POST',
							url: '/updatelatlng',
							data: JSON.stringify({
								latlngY: latlngY,
								latlngX: latlngX,
								id: tempId
							}),
							contentType: 'application/json; charset=utf-8',
							success: function (data) {
								console.log(tempId+' 좌표 업데이트 완료');
								// $.each(data,  function (idx, val) {
								//     test.push(val.menu);
								//     test.push(val.price);
								//     mapSetMarker(test);
								// });
							},
							error: function () {
								alert('latlng error');
							}
					    });
				        }


				        addMarker(coords, branchArr);
			        }
		        });
		        </c:forEach>


		        var selectedMarker = null;

		        function addMarker(markerPosition, branchArr) {
			        $('.btn-gradient').click(function(event){
				        event.preventDefault();
			        });
			        var id              = branchArr[0],
				        branchName      = branchArr[1],
				        opTime          = branchArr[2],
				        breakTime       = branchArr[3],
				        opDate          = branchArr[4],
				        phoneNum        = branchArr[5],
				        score           = branchArr[6],
				        state           = branchArr[7],
				        zoneCode        = branchArr[8],
				        roadAddress     = branchArr[9],
				        jibunAddress    = branchArr[10],
				        detailAddress   = branchArr[11],
				        markerImage     = branchArr[12],
				        mainImage       = branchArr[13],
				        image1          = branchArr[14],
				        image2          = branchArr[15],
				        image3          = branchArr[16],
				        image4          = branchArr[17],
				        image5          = branchArr[18],
				        image6          = branchArr[19],
				        image7          = branchArr[20],
				        image8          = branchArr[21],
			            category        = branchArr[22],
			            branchExplain   = branchArr[23],
				        sido            = branchArr[24],
				        sigungu         = branchArr[25],
				        category        = branchArr[26];
			            
			        var imageSrc = './imgs/markerIcon/'+markerImage, // 마커이미지의 주소입니다
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
				        '<img src="/imgs/foodimgs/'+mainImage+'" width="100" height="100">' +
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
				        '<div class="restDiv3_3">' +
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
				        '<div class="gradeDiv2">' +
				        score + ' / 5.0' +
				        '</div>' +
				        '<div class="gradeDiv3">' +
				        '<img src="./imgs/angryemoji.png"' + 'class="angryEmoji">' +
				        '</div>' +
				        '</div>' +
				        '<div class="btnDiv">' +
				        '<a href="#ex1" onclick="javascript:branchDetail(\''+branchArr+'\');" rel="modal:open" class="btn-gradient gray block">상세보기</a>' +
				        '<a href="#reserveModal" onclick="javascript:reserveModal(\''+branchName+'\',\''+id+'\')" rel="modal:open" class="btn-gradient red block">바로예약</a>' +
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
						        $.each(data,  function (idx, val) {
							        test.push(val.menu);
							        test.push(val.price);
							        mapSetMarker(test);
						        });
					        }
				        });

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
							        $('.restDiv2_3').text(test[1]);
						        }
						        if (test.length > 3) {
							        $('.restDiv3_2').css('border-bottom', '1px dotted gray');
							        $('.restDiv3_1').text(test[2]);
							        $('.restDiv3_3').text(test[3]);
						        }
						        if (test.length > 5) {
							        $('.restDiv4_2').css('border-bottom', '1px dotted gray');
							        $('.restDiv4_1').text(test[4]);
							        $('.restDiv4_3').text(test[5]);
						        }
					        }
				        }
			        };
			        daum.maps.event.addListener(marker, 'click', callback);
			        clusterer.addMarker(marker);
			        // 마커가 지도 위에 표시되도록 설정합니다
			        marker.setMap(map);
			        overlay.setMap(null);
		        } // for end
		        
				function reserveModal(name, id) {
			        $('.modalTopSpan').empty().append(name+' 예약');
			        $('.reserveTimeDiv').attr('id',id);
		        }
		        
		        function branchDetail(e){
		        	var branchDetailArr = [];
		        	    branchDetailArr = e.split(",");
		        	var id              = branchDetailArr[0],
                        branchName      = branchDetailArr[1],
                        opTime          = branchDetailArr[2],
                        breakTime       = branchDetailArr[3],
                        opDate          = branchDetailArr[4],
                        phoneNum        = branchDetailArr[5],
                        score           = branchDetailArr[6],
                        state           = branchDetailArr[7],
                        zoneCode        = branchDetailArr[8],
                        roadAddress     = branchDetailArr[9],
                        jibunAddress    = branchDetailArr[10],
                        detailAddress   = branchDetailArr[11],
                        markerImage     = branchDetailArr[12],
                        mainImage       = branchDetailArr[13],
                        image1          = branchDetailArr[14],
                        image2          = branchDetailArr[15],
                        image3          = branchDetailArr[16],
                        image4          = branchDetailArr[17],
                        image5          = branchDetailArr[18],
			            image6          = branchDetailArr[19],
				        image7          = branchDetailArr[20],
				        image8          = branchDetailArr[21],
			            category        = branchDetailArr[22],
			            branchExplain   = branchDetailArr[23],
			            sido            = branchDetailArr[24],
			            sigungu         = branchDetailArr[25],
				        category        = branchDetailArr[26];
		        	var test = [];
					$.ajax({
				        type: 'POST',
				        url: './branchdetail',
				        data: id,
				        dataType: 'json',
				        success: function (data) {
					        $.each(data,  function (idx, val) {
						        test.push(val.menu);
						        test.push(val.price);
					        });
					        for (i = 0; i <test.length; i++){
								$('.modalMenuName'+[i]).empty().append(test[i*2]);
								$('.modalMenuPrice'+[i]).empty().append(test[i*2+1]);
							}
				        },
						error: function(request,status,error) {
                            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							
                        }
			        });
					$.ajax({
				        type: 'POST',
				        url: '/waitingList',
				        data: id,
				        success: function (data) {
				        	if (data === 100) $('.modalStatus').css('display','none');
				        	else {
				        		$('.modalStatus').css('display','inline-block');
				        		$('.ticketingText').empty().append(data+' 명');
					        }
				        },
						error: function(request,status,error) {
                            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                        }
		            });
					$.ajax({
				        type: 'POST',
				        url: '/ticketingCheck',
				        data: id,
				        success: function (data) {
				        	alert(data);
				        	if (data !== 0){
				        		$('.ticketingBtn').empty().append('대기 중');
				        		$('.ticketingBtn').off("click");
					        }
				        	else $('.ticketingBtn').empty().append('대기 시작');
				        },
						error: function(request,status,error) {
                            // alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                        }
		            });
					
					
					$('.ticketingBtn').click(function () {
						$.ajax({
					        type: 'POST',
					        url: '/ticketingStart',
					        data: id,
					        success: function () {
					        	var ticketingNum = $('.ticketingText').text();
					        	var resultNum = ticketingNum.slice(0, ticketingNum.length-2);
					        	$('.ticketingText').empty().append((resultNum*1+1)+' 명');
					        	
					        },
							error: function () {
								alert('로그인을 해주시기 바랍니다.');
							}
	                    });
	                });
					
					
					
					// 매장 detail 페이지에 db정보 추가
					$('.detailModalTopTitle').empty().append(branchName);
					$('.modalScore').empty().append('평점 : '+score+' / 5.0');
					$('.modalAddress').empty().append(roadAddress);
					$('.modalJibunAddress').empty().append('(우) '+zoneCode+' (지번) '+jibunAddress);
					$('.modalPhoneNum').empty().append(phoneNum);
					$('.modalOpTime').empty().append(opTime);
					$('.modalBreakTime').empty().append(breakTime);
					$('.modalOpDay').empty().append(opDate);
					$('.modalExplain').empty().append(branchExplain);
					$('.categorySpan').empty().append(sido+' '+sigungu);
					$('.modalStatus').css('display','none');
					
					var imagePath = "/imgs/foodimgs/";
					
			        $('.gallerymain').attr('src',imagePath+image1);
			        $('.gallerylink').attr('href',imagePath+image1);
					
					for (i = 1; i<9; i++){
						$('.img'+[i]).attr('src',imagePath+(image1.substring(0,10))+i+'.jpg');
						$('.imgLink'+[i]).attr('href',imagePath+(image1.substring(0,10))+i+'.jpg');
					}
		        }
		        
		        
		         function insertReserve() {
    	
                  	var times = $('.resultTimeDiv').text();
                  	var time = times.slice(times.length-5, times.length);
                  	if (time.length === 4) time = '0'+time;
                  	console.log(time);
                  	
			        var data = {};
                    data.targetDate = $('#targetDate').val() + '-' + time;
                    data.targetPersonel = $('.reservePersonelInput').val();
                    data.targetRequest = $('.reserveRequestInput').val();
                    data.targetBranch = $('.reserveTimeDiv').attr('id');
                  
                    $.ajax({
                        type: "POST",
                        url: "/insertReserve",
                        data: JSON.stringify(data),
                        contentType: "application/json; charset=UTF-8",
                        dataType: "json",
                        success: function(data) {
                            alert('ajax-success');
                        },
                        error: function(request,status,error) {
                            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							
                        }
                    })
                  
                  }
	        </script>
	        <div id="ex1" class="modal">
			        <div class="detailModalTop">
			            <div class="detailModalTopTitle">
			            </div>
				        <div class="detailModalTopCategory">
					        <span class="categorySpan"></span>
				        </div>
			        </div>
	                <div class="detailModalLeft">
		                <div class="detailModalLeftImg">
			                <div class="popup-gallery">
			                    <a href="" class="gallerylink"><img src="" class="gallerymain"></a>
				
			                </div>
		                </div>
		                <div class="popup-gallery popup-gallery2">
						<a class="imgLink1" href=""><img src="" width="60" height="60" class="galleryimg img1"></a>
						<a class="imgLink2" href=""><img src="" width="60" height="60" class="galleryimg img2"></a>
						<a class="imgLink3" href=""><img src="" width="60" height="60" class="galleryimg img3"></a>
						<a class="imgLink4" href=""><img src="" width="60" height="60" class="galleryimg img4"></a>
						<a class="imgLink5" href=""><img src="" width="60" height="60" class="galleryimg img5"></a>
						<a class="imgLink6" href=""><img src="" width="60" height="60" class="galleryimg img6"></a>
						<a class="imgLink7" href=""><img src="" width="60" height="60" class="galleryimg img7"></a>
						<a class="imgLink8" href=""><img src="" width="60" height="60" class="galleryimg img8"></a>
	                
		                </div>
	                </div>
	                <div class="detailModalRight">
		                <div class="modalStatusDiv" style="text-align: center;">
			                <div class="modalScore" style="width: 330px; "></div>
			                <div class="modalStatus" style="width: 200px;height: 40px;display: inline-block;top: 0;right: 10px;position: absolute; text-align: right;">
				                <div class="ticketingText" style="display: inline-block; margin-right: 20px;"></div>
				                <div class="ticketingBtn" style="display: inline-block;">대기시작</div>
			                </div>
		                </div>
		                <div>
			                <div class="modalAddressDiv">주소</div>
			                <div class="modalAddress"></div>
		                </div>
		                <div class="modalJibunAddress">
		                </div>
		                <div>
			                <div class="modalPhoneNumDiv">연락처</div>
			                <div class="modalPhoneNum"></div>
		                </div>
		                <div>
			                <div class="modalOpTimeDiv">영업시간</div>
			                <div class="modalOpTime"></div>
		                </div>
		                <div>
			                <div class="modalBreakTimeDiv">휴게시간</div>
			                <div class="modalBreakTime"></div>
		                </div>
		                <div class="modalOpDayBox">
			                <div class="modalOpDayDiv">영업일</div>
			                <div class="modalOpDay" ></div>
		                </div>
		                
		                <div class="modalMenuBox">
			                <div class="modalMenuBoxLeft">
				                <div class="modalLeftMenu">
					                <div class="modalMenuName0"></div>
					                <div class="modalMenuPrice0"></div>
				                </div>
				                <div class="modalLeftMenu">
					                <div class="modalMenuName2"></div>
					                <div class="modalMenuPrice2"></div>
				                </div>
				                <div class="modalLeftMenu">
					                <div class="modalMenuName4"></div>
					                <div class="modalMenuPrice4"></div>
				                </div>
				                <div class="modalLeftMenu">
					                <div class="modalMenuName6"></div>
					                <div class="modalMenuPrice6"></div>
				                </div>
			                </div>
			                <div class="modalMenuBoxRight">
				                <div class="modalRightMenu">
					                <div class="modalMenuName1"></div>
					                <div class="modalMenuPrice1"></div>
				                </div>
				                <div class="modalRightMenu">
					                <div class="modalMenuName3"></div>
					                <div class="modalMenuPrice3"></div>
				                </div>
				                <div class="modalRightMenu">
					                <div class="modalMenuName5"></div>
					                <div class="modalMenuPrice5"></div>
				                </div>
				                <div class="modalRightMenu">
					                <div class="modalMenuName7"></div>
					                <div class="modalMenuPrice7"></div>
				                </div>
			                </div>
		                </div>
		                <div class="modalExplain">
		                </div>
		                <div class="modalBbs">
			                <div class="modalBbsMore">더보기</div>
			                <div class="modalBbsTitle">
				                <div class="modalBbsTitleSub">제목</div>
				                <div class="modalBbsTitleDate">날짜</div>
				                <div class="modalBbsTitleWriter">작성자</div>
			                </div>
			                <div class="modalBbsList">
				                <div class="modalBbsListSub">이렇게 맛없는 집은 처음 본다....</div>
				                <div class="modalBbsListDate">2018-07-19</div>
				                <div class="modalBbsListName">만복</div>
			                </div>
			                <div class="modalBbsList">
				                <div class="modalBbsListSub">이렇게 맛있는 집은 처음 본다....</div>
				                <div class="modalBbsListDate">2018-07-17</div>
				                <div class="modalBbsListName">천복</div>
			                </div>
		                </div>
	                </div>
                </div>
			

                <div>
                
                </div>
            
            </div>
            <div id="reserveModal" class="modal" style="height: 600px; max-height: 600px; max-width: 400px; width: 400px;">
		        <div class="detailModalTop" style="width: 400px; color: white;">
			        <span class="modalTopSpan">예약</span>
		        </div>
	            <div id="calendar"></div>
	            <input type="hidden" name="" id="targetDate" value="">
	            <div class="reserveTimeDiv">
		            <div class="reservePersonel">
			            <input type="number" min="1" max="10" class="reservePersonelInput" placeholder="1"/>명
		            </div>
		            <div class="reserveTimeSelect">
			            <div class="resultTimeDiv" style="height: 100%; width: 100%; font-size: 19px; line-height: 40px;">
	                    </div>
		            </div>
	            </div>
	            
	            <div class="reserveRequest">
		           <input type="text" class="reserveRequestInput" placeholder="요청사항"/>
	            </div>
	            <div class="reserveBtn">
		            <a href="#" class="btn-gradient gray block">취소</a>
		            <a href="#" onclick="insertReserve()" class="btn-gradient red block">예약</a>
	            </div>
	            <div class="selectTimeDiv" style="position: absolute; display: none; width: 300px; height: 400px; top: 120px; right: -320px;">
	                <div class="selectTimeTopDiv" style="text-align: center; color: white; font-weight: 500; font-size: 16pt; line-height: 70px;border-top-left-radius: 15px; border-top-right-radius: 15px; height: 70px; background-color: #e04f5f;"></div>
		            <div class="selectTimeContentDiv" style="overflow-y: scroll;border: 3px dashed #e04f5f; border-top: none; height: 330px; padding: 8px; padding-top: 10px;">
		            </div>
                </div>
            </div>
            
    <script>
    $.noConflict();
    $(document).ready(function () {
    	$('.popup-gallery').magnificPopup({
			delegate: 'a',
			type: 'image',
			tLoading: 'Loading image #%curr%...',
			mainClass: 'mfp-img-mobile',
			gallery: {
				enabled: true,
				navigateByImgClick: true,
				preload: [0,1]
			},
			image: {
				tError: '<a href="%url%">The image #%curr%</a> could not be loaded.',
				titleSrc: function(item) {
					return item.el.attr('title') + '<small></small>';
				}
			}
		});
		$('.galleryimg').mouseover(function (e) {
			var imageSrcArr = e.target.src.split('/');
			var imageSrc = "/imgs/foodimgs/"+imageSrcArr[5];
			$('.gallerymain').attr('src',imageSrc);
			$('.gallerylink').attr('href',imageSrc);
		})
    	
        $('.day').click(function (target) {
        	$('.day').css('background-color','white');
            $(this).css('background-color','lightgray');
        });
		
		
		$('.ticketingBtn').mouseover(function () {
			$('.ticketingBtn').css('color','#e04f5f');
		});
		$('.ticketingBtn').mouseout(function () {
			$('.ticketingBtn').css('color','black');
		});
	    
	   
    });
    
   
    
    </script>
	<script src="./js/clndr3.js"></script>
    <script src="./js/demo.js?ver=3"></script>
    </body>
</html>