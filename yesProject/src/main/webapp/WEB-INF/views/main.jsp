<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!Doctype html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
        <link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Jua|Nanum+Gothic" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/selectDesign.css">
        <link rel="stylesheet" href="./css/mapStyle.css?ver=1">
        <link rel="stylesheet" href="./css/mainStyle.css?ver=1">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
		
    </head>
    <body>
       <jsp:include page="./layout/header.jsp"></jsp:include>
         
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
            // var arr = [];
            // function getSigungu() {
            //     $.ajax({
            //         url: "/json/area.json",
            //         dataType : "text",
            //         error: function () {
            //             alert('error');
            //
            //         },
            //         success: function (data) {
            //             $("select[name='gugun1'] option").remove();
            //             $.each(JSON.parse(data),function (index, value) {
            //                 if (index === ($('#sido1').val())) {
            //                     arr = value;
            //                     for(i = 0; i<arr.length; i++){
            //                         $('#gugun1').append(new Option(arr[i],"temp"));
            //                     }
            //                 }
            //
            //             })
            //         }
            //     })
            // }
            
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
					                                    '               <img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="80" height="80" class="searchImageFile">' +
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
			           <%--<div style="width: 100%; height: 126px; border-bottom: 1px solid black;"></div>--%>
			           <%--<div style="width: 100%; height: 126px; border-bottom: 1px solid black;"></div>--%>
			           <%--<div style="width: 100%; height: 126px; border-bottom: 1px solid black;"></div>--%>
		            </div>
	            </div>
            </div>
            
            <div id="map"></div>
            <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=630e98d8425188c04dae0728c65822bb&libraries=services,clusterer"></script>
            <script>
                var container = document.getElementById('map');
                var options = {
                    center: new daum.maps.LatLng(37.552651, 126.937765),
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
                            
                            var branchArr = ['${articleList.id}', '${articleList.branchName}', '${articleList.opTime}', '${articleList.breakTime}', '${articleList.opDate}','${articleList.phoneNum}','${articleList.score}','${articleList.state}','${articleList.zoneCode}', '${articleList.roadAddress}', '${articleList.jibunAddress}', '${articleList.detailAddress}', '${articleList.markerImage}', '${articleList.mainImage}', '${articleList.image1}', '${articleList.image2}', '${articleList.image3}', '${articleList.image4}','${articleList.image5}'];
                            coords = new daum.maps.LatLng(result[0].y, result[0].x);
                            
                            
                            
                            <%--기등록된 자료에 latlng 입력 
                            var latlngY = result[0].y,
	                            latlngX = result[0].x;
                            var tempId = '${articleList.id}';
                            $.ajax({
                            type: 'POST',
                            url: './updatelatlng',
                            data: JSON.stringify({
	                            latlngY: latlngY,
		                        latlngX: latlngX,
		                        id: tempId
                            }),
                            contentType: 'application/json; charset=utf-8',
                            success: function (data) {
                                // $.each(data,  function (idx, val) {
                                //     test.push(val.menu);
                                //     test.push(val.price);
                                //     mapSetMarker(test);
                                // });
                            },
                            error: function () {
                            }
                             });--%>
	                        
	                        
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
	                    image5          = branchArr[18];
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
                        '<img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="100" height="100">' +
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
                        '<a href="#" class="btn-gradient gray block">상세보기</a>' +
                        '<a href="#" class="btn-gradient red block">바로예약</a>' +
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
                
	            
            </script>
    
            
                <div>
                    
                </div>
            
            </div>
        
    </body>
</html>