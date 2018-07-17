<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!Doctype html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
        <link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Jua|Nanum+Gothic" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/selectDesign.css">
        <link rel="stylesheet" href="./css/mapStyle.css">
        <link rel="stylesheet" href="./css/mainStyle.css">
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
                mapResize.style.height = window.innerHeight - 120+'px';
            }
            window.onload = function() {
                mapResize();

                // 브라우저 크기가 변할 시 동적으로 사이즈를 조절해야 하는경우
                window.addEventListener('resize', mapResize);
            }                
            </script>
            <div><img src="./imgs/icon.png" id="searchIcon1"></div>
            <div id="searchBox">
            <table class="searchTable">
                <tr>
                    <td class="searchLocal"><span class="searchText">지역별</span></td>
                    <td class="searchSel">
                    <div class="selectbox">
                      <dl class="dropdownSelect">
                        <dt><a class="searchSelLink" href="#"><span>서울시</span></a></dt>
                        <dd>
                          <ul class="dropdown2">
                            <li><a href="#">신상품순</a></li>
                            <li><a href="#">인기상품순</a></li>
                            <li><a href="#">낮은가격순</a></li>
                            <li><a href="#">높은가격순</a></li>
                          </ul>
                        </dd>
                      </dl>
                    </div>
                    </td>
                    <td class="searchSel">
                    <div class="selectbox">
                      <dl class="dropdownSelect2">
                        <dt><a class="searchSelLink" href="#"><span>마포구</span></a></dt>
                        <dd>
                          <ul class="dropdown2">
                            <li><a href="#">신상품순</a></li>
                            <li><a href="#">인기상품순</a></li>
                            <li><a href="#">낮은가격순</a></li>
                            <li><a href="#">높은가격순</a></li>
                          </ul>
                        </dd>
                      </dl>
                    </div>
                    </td>
                    <td class="searchSel">
                    <div class="selectbox">
                      <dl class="dropdownSelect3">
                        <dt><a class="searchSelLink" href="#"><span>신수동</span></a></dt>
                        <dd>
                          <ul class="dropdown2">
                            <li><a href="#">신상품순</a></li>
                            <li><a href="#">인기상품순</a></li>
                            <li><a href="#">낮은가격순</a></li>
                            <li><a href="#">높은가격순</a></li>
                          </ul>
                        </dd>
                      </dl>
                    </div>
                    </td>
                    <td class="searchSel">
                    <div class="selectbox">
                      <dl class="dropdownSelect4">
                        <dt><a class="searchSelLink" href="#"><span>선택</span></a></dt>
                        <dd>
                          <ul class="dropdown2">
                            <li><a href="#">신상품순</a></li>
                            <li><a href="#">인기상품순</a></li>
                            <li><a href="#">낮은가격순</a></li>
                            <li><a href="#">높은가격순</a></li>
                          </ul>
                        </dd>
                      </dl>
                    </div>
                    </td>
                    <td class="searchSel"></td>
                </tr>    
                <tr>
                    <td class="searchMenu"><span class="searchText">메뉴별</span></td>
                    <td class="searchSel">
                    <div class="selectbox">
                      <dl class="dropdownSelect5">
                        <dt><a class="searchSelLink" href="#"><span>한식</span></a></dt>
                        <dd>
                          <ul class="dropdown2">
                            <li><a href="#">신상품순</a></li>
                            <li><a href="#">인기상품순</a></li>
                            <li><a href="#">낮은가격순</a></li>
                            <li><a href="#">높은가격순</a></li>
                          </ul>
                        </dd>
                      </dl>
                    </div>
                    </td>
                    <td class="localText">
                        <span class="searchRe">[서울시 마포구 신수동]</span>의 
                    </td>
                    <td class="menuText">
                        <span class="searchRe">[한식]</span><span class="searchText">검  색</span>
                    </td>
                    <td class="tdInput"><input type="text" class="form-control" id="searchName"></td>
                    <td class="tdBtn"><button type="button" class="btn btn-default">Search</button></td>
                </tr>    
            </table>
            </div>
            
            <div id="map"></div>
            
            <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=630e98d8425188c04dae0728c65822bb&libraries=clusterer"></script>
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
                
                var positionTest = [37.552651,126.937765,37.553660,126.937316];
                var selectedMarker = null;
                var array = ['store0','store1'];
               // 마커 클러스터러를 생성 
                var clusterer = new daum.maps.MarkerClusterer({
                    map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
                    averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
                    minLevel: 5, // 클러스터 할 최소 지도 레벨 
                    styles: [{
                        width : '53px', height : '52px',
                        background: 'url("./imgs/clusterer.png") no-repeat',
                        color: '#fff',
                        textAlign: 'center',
                        lineHeight: '50px',
                    }]
                });    
                //-------------------------------------------------------------------------
                for(var i=0; i<2; i++){
                    var imageSrc = './imgs/markerIcon/foodIcon'+i+'.png', // 마커이미지의 주소입니다
                    imageSize = new daum.maps.Size(55, 55), // 마커이미지의 크기입니다
                    imageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
                    
                    // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
                    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption),
                        markerPosition = new daum.maps.LatLng(positionTest[i+i],positionTest[i+i+1]); // 마커가 표시될 위치입니다
                    addMarker(markerPosition, markerImage, i);

                }
                function addMarker(markerPosition, markerImage, i){
                    
//                    $('.btn-gradient').click(function(event){
//                        event.preventDefault();
//                    });
                    // 마커가 지도 위에 표시되도록 설정합니다
                    var marker = new daum.maps.Marker({
                        position: markerPosition, 
                        title: array[i],
                        image: markerImage // 마커이미지 설정 
                    });
                    var className = ''+array[i]+' wrap';
                        // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정
                        // 커스텀 오버레이에 표시할 컨텐츠
                    var content = document.createElement('div');
                    content.className = className;
                    content.innerHTML = '<div class="info">'+  
                                            '<div class="title">'+  
                                                '<p>'+array[i]+'</p>'+  
                                                '<div class="close" title="닫기"></div>'+  
                                            '</div>'+  
                                            '<div class="popupBody">'+
                                                '<div class="img">'+
                                                    '<img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="100" height="100">'+ 
                                               '</div>'+  
                                                '<div class="desc">'+  
                                                    '<div class="address ellipsis">제주특별자치도 제주시 첨제주특별자치도 제주시 첨제주특별자치도 제주시 첨</div>'+  
                                                    '<div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>'+
                                                    '<div class="phone ellipsis">010 - 2222 - 3333</div>'+  
                                                    '<div class="ellipsis"><br/></div>'+
                                                    '<div class="timeDiv">'+
                                                        '<div class="timeDiv1">'+
                                                            '영업시간'+ 
                                                        '</div>'+
                                                        '<div class="timeDiv2">'+
                                                            '10:00 ~ 22:00'+
                                                        '</div>'+
                                                    '</div>'+
                                                    '<div class="dayDiv">'+
                                                        '<div class="dayDiv1">'+
                                                            '영업일'+
                                                        '</div>'+
                                                        '<div class="dayDiv2">'+
                                                            '매주 2,4번째 일요일 휴무'+
                                                        '</div>'+
                                                    '</div>'+
                                                    '<div class="breakDiv">'+
                                                        '<div class="breakDiv1">'+
                                                            '휴게시간'+
                                                        '</div>'+
                                                        '<div class="breakDiv2">'+
                                                            '15:00 ~ 17:00'+
                                                        '</div>'+
                                                    '</div>'+
                                                    '<div class="restDiv">'+
                                                        '<div class="restDiv1">'+
                                                            '대표메뉴'+
                                                        '</div>'+
                                                        '<div class="restDiv2">'+
                                                            '<div class="restDiv2_1">'+
                                                                '참치김밥'+
                                                            '</div>'+
                                                            '<div class="restDiv2_2">'+
                                                            '</div>'+
                                                            '<div class="restDiv2_3">'+
                                                                '13,000원'+
                                                            '</div>'+
                                                            '<div class="restDiv2_1">'+
                                                                '치즈김밥'+
                                                            '</div>'+
                                                            '<div class="restDiv2_2">'+
                                                            '</div>'+
                                                            '<div class="restDiv2_3">'+
                                                                '20,000원'+
                                                            '</div>'+
                                                            '<div class="restDiv2_1">'+
                                                                '신라면'+
                                                            '</div>'+
                                                            '<div class="restDiv2_2">'+
                                                            '</div>'+
                                                            '<div class="restDiv2_3">'+
                                                                '50,000원'+
                                                            '</div>'+
                                                        '</div>'+
                                                    '</div>'+
                                                    '<div class="gradeDiv">'+
                                                        '<div class="gradeDiv1">'+
                                                            '이용자 평점'+
                                                        '</div>'+
                                                        '<div class="gradeDiv2">'+
                                                            '4.3 / 5.0'+
                                                        '</div>'+
                                                        '<div class="gradeDiv3">'+
                                                            '<img src="./imgs/angryemoji.png"'+ 'class="angryEmoji">'+
                                                        '</div>'+
                                                    '</div>'+
                                                    '<div class="btnDiv">'+
                                                        '<a href="#" class="btn-gradient gray block">상세보기</a>'+
                                                        '<a href="#" class="btn-gradient red block">바로예약</a>'+
                                                    '</div>'+
                                                '</div>'+  
                                            '</div>'+  
                                        '</div>';

                // 마커 위에 커스텀오버레이를 표시합니다
                
                // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
                var overlay = new daum.maps.CustomOverlay({
                    content: content,
                    map: map,
                    position: marker.getPosition()       
                });

                // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
                
                
                $('.wrap').css('display','none');
                
                    
                daum.maps.event.addListener(marker, 'click', function() {
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
                    if(selectedMarker === null){
                        console.log('case 1 : '+selectedMarker);
                        selectedMarker = markerTitle;
                        overlay.setMap(map);                        
                        map.panBy(deltaX - 25, deltaY - 200);
                        $('.'+markerTitle+'').css('display','inherit');
                    // case 2
                    }else if(selectedMarker !== markerTitle){
                        console.log('case 2 : '+selectedMarker);
                        overlay.setMap(map);
                        map.panBy(deltaX - 25, deltaY - 200);
                        $('.wrap').css('display','none');
                        $('.'+markerTitle+'').css('display','inherit');
                        selectedMarker = markerTitle;      
                        
                    // case3
                    }else if(selectedMarker === markerTitle){
                        console.log('case 3 : '+selectedMarker);
                        $('.wrap').css('display','none');
                        selectedMarker = null;
//                        overlay.setMap(null);
                    }
                    
                });
          
                // close 버튼으로 종료 했을시 case 3으로 변경되는 문제
                // 버튼 클릭시에 selectedMarker를 null 잡아주면 될듯 --> 완료
                $('.close').click(function(){
                    $('.wrap').css('display','none'); 
                    selectedMarker = null;
                });
                    
                    
                    
                clusterer.addMarker(marker);    
                // 마커가 지도 위에 표시되도록 설정합니다
                marker.setMap(map);  
                overlay.setMap(null);  
            } // for end
                 
            
            

            </script>
          <!--   <div>
                    
                </div> -->
            
            </div>
        
        <%-- <jsp:include page="./layout/footer.jsp"></jsp:include>  --%>
    </body>
</html>