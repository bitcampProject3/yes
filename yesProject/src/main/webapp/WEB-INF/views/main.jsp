<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR"%>
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
        
        <div class="page" id="page">
            <script type="text/javascript">
            function mapResize() {
                var mapResize = document.getElementById('page');
                mapResize.style.width = window.innerWidth;
                mapResize.style.height = window.innerHeight - 120+'px';
            }
            window.onload = function() {
                mapResize();

                // ������ ũ�Ⱑ ���� �� �������� ����� �����ؾ� �ϴ°��
                window.addEventListener('resize', mapResize);
            }                
            </script>
            <div><img src="./imgs/icon.png" id="searchIcon1"></div>
            <div id="searchBox">
            <table class="searchTable">
                <tr>
                    <td class="searchLocal"><span class="searchText">������</span></td>
                    <td class="searchSel">
                    <div class="selectbox">
                      <dl class="dropdownSelect">
                        <dt><a class="searchSelLink" href="#"><span>�����</span></a></dt>
                        <dd>
                          <ul class="dropdown2">
                            <li><a href="#">�Ż�ǰ��</a></li>
                            <li><a href="#">�α��ǰ��</a></li>
                            <li><a href="#">�������ݼ�</a></li>
                            <li><a href="#">�������ݼ�</a></li>
                          </ul>
                        </dd>
                      </dl>
                    </div>
                    </td>
                    <td class="searchSel">
                    <div class="selectbox">
                      <dl class="dropdownSelect2">
                        <dt><a class="searchSelLink" href="#"><span>������</span></a></dt>
                        <dd>
                          <ul class="dropdown2">
                            <li><a href="#">�Ż�ǰ��</a></li>
                            <li><a href="#">�α��ǰ��</a></li>
                            <li><a href="#">�������ݼ�</a></li>
                            <li><a href="#">�������ݼ�</a></li>
                          </ul>
                        </dd>
                      </dl>
                    </div>
                    </td>
                    <td class="searchSel">
                    <div class="selectbox">
                      <dl class="dropdownSelect3">
                        <dt><a class="searchSelLink" href="#"><span>�ż���</span></a></dt>
                        <dd>
                          <ul class="dropdown2">
                            <li><a href="#">�Ż�ǰ��</a></li>
                            <li><a href="#">�α��ǰ��</a></li>
                            <li><a href="#">�������ݼ�</a></li>
                            <li><a href="#">�������ݼ�</a></li>
                          </ul>
                        </dd>
                      </dl>
                    </div>
                    </td>
                    <td class="searchSel">
                    <div class="selectbox">
                      <dl class="dropdownSelect4">
                        <dt><a class="searchSelLink" href="#"><span>����</span></a></dt>
                        <dd>
                          <ul class="dropdown2">
                            <li><a href="#">�Ż�ǰ��</a></li>
                            <li><a href="#">�α��ǰ��</a></li>
                            <li><a href="#">�������ݼ�</a></li>
                            <li><a href="#">�������ݼ�</a></li>
                          </ul>
                        </dd>
                      </dl>
                    </div>
                    </td>
                    <td class="searchSel"></td>
                </tr>    
                <tr>
                    <td class="searchMenu"><span class="searchText">�޴���</span></td>
                    <td class="searchSel">
                    <div class="selectbox">
                      <dl class="dropdownSelect5">
                        <dt><a class="searchSelLink" href="#"><span>�ѽ�</span></a></dt>
                        <dd>
                          <ul class="dropdown2">
                            <li><a href="#">�Ż�ǰ��</a></li>
                            <li><a href="#">�α��ǰ��</a></li>
                            <li><a href="#">�������ݼ�</a></li>
                            <li><a href="#">�������ݼ�</a></li>
                          </ul>
                        </dd>
                      </dl>
                    </div>
                    </td>
                    <td class="localText">
                        <span class="searchRe">[����� ������ �ż���]</span>�� 
                    </td>
                    <td class="menuText">
                        <span class="searchRe">[�ѽ�]</span><span class="searchText">��  ��</span>
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
                
                // �Ϲ� ������ ��ī�̺�� ���� Ÿ���� ��ȯ�� �� �ִ� ����Ÿ�� ��Ʈ���� �����մϴ�
                var mapTypeControl = new daum.maps.MapTypeControl();

                // ������ ��Ʈ���� �߰��ؾ� �������� ǥ�õ˴ϴ�
                // daum.maps.ControlPosition�� ��Ʈ���� ǥ�õ� ��ġ�� �����ϴµ� TOPRIGHT�� ������ ���� �ǹ��մϴ�
                map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

                // ���� Ȯ�� ��Ҹ� ������ �� �ִ�  �� ��Ʈ���� �����մϴ�
                var zoomControl = new daum.maps.ZoomControl();
                map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
                
                var positionTest = [37.552651,126.937765,37.553660,126.937316];
                var selectedMarker = null;
                var array = ['store0','store1'];
               // ��Ŀ Ŭ�����ͷ��� ���� 
                var clusterer = new daum.maps.MarkerClusterer({
                    map: map, // ��Ŀ���� Ŭ�����ͷ� �����ϰ� ǥ���� ���� ��ü 
                    averageCenter: true, // Ŭ�����Ϳ� ���Ե� ��Ŀ���� ��� ��ġ�� Ŭ������ ��Ŀ ��ġ�� ���� 
                    minLevel: 5, // Ŭ������ �� �ּ� ���� ���� 
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
                    var imageSrc = './imgs/markerIcon/foodIcon'+i+'.png', // ��Ŀ�̹����� �ּ��Դϴ�
                    imageSize = new daum.maps.Size(55, 55), // ��Ŀ�̹����� ũ���Դϴ�
                    imageOption = {offset: new daum.maps.Point(27, 69)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
                    
                    // ��Ŀ�� �̹��������� ������ �ִ� ��Ŀ�̹����� �����մϴ�
                    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption),
                        markerPosition = new daum.maps.LatLng(positionTest[i+i],positionTest[i+i+1]); // ��Ŀ�� ǥ�õ� ��ġ�Դϴ�
                    addMarker(markerPosition, markerImage, i);

                }
                function addMarker(markerPosition, markerImage, i){
                    
//                    $('.btn-gradient').click(function(event){
//                        event.preventDefault();
//                    });
                    // ��Ŀ�� ���� ���� ǥ�õǵ��� �����մϴ�
                    var marker = new daum.maps.Marker({
                        position: markerPosition, 
                        title: array[i],
                        image: markerImage // ��Ŀ�̹��� ���� 
                    });
                    var className = ''+array[i]+' wrap';
                        // ��Ŀ�� �߽����� Ŀ���� �������̸� ǥ���ϱ����� CSS�� �̿��� ��ġ�� ����
                        // Ŀ���� �������̿� ǥ���� ������
                    var content = document.createElement('div');
                    content.className = className;
                    content.innerHTML = '<div class="info">'+  
                                            '<div class="title">'+  
                                                '<p>'+array[i]+'</p>'+  
                                                '<div class="close" title="�ݱ�"></div>'+  
                                            '</div>'+  
                                            '<div class="popupBody">'+
                                                '<div class="img">'+
                                                    '<img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="100" height="100">'+ 
                                               '</div>'+  
                                                '<div class="desc">'+  
                                                    '<div class="address ellipsis">����Ư����ġ�� ���ֽ� ÷����Ư����ġ�� ���ֽ� ÷����Ư����ġ�� ���ֽ� ÷</div>'+  
                                                    '<div class="jibun ellipsis">(��) 63309 (����) ���� 2181</div>'+
                                                    '<div class="phone ellipsis">010 - 2222 - 3333</div>'+  
                                                    '<div class="ellipsis"><br/></div>'+
                                                    '<div class="timeDiv">'+
                                                        '<div class="timeDiv1">'+
                                                            '�����ð�'+ 
                                                        '</div>'+
                                                        '<div class="timeDiv2">'+
                                                            '10:00 ~ 22:00'+
                                                        '</div>'+
                                                    '</div>'+
                                                    '<div class="dayDiv">'+
                                                        '<div class="dayDiv1">'+
                                                            '������'+
                                                        '</div>'+
                                                        '<div class="dayDiv2">'+
                                                            '���� 2,4��° �Ͽ��� �޹�'+
                                                        '</div>'+
                                                    '</div>'+
                                                    '<div class="breakDiv">'+
                                                        '<div class="breakDiv1">'+
                                                            '�ްԽð�'+
                                                        '</div>'+
                                                        '<div class="breakDiv2">'+
                                                            '15:00 ~ 17:00'+
                                                        '</div>'+
                                                    '</div>'+
                                                    '<div class="restDiv">'+
                                                        '<div class="restDiv1">'+
                                                            '��ǥ�޴�'+
                                                        '</div>'+
                                                        '<div class="restDiv2">'+
                                                            '<div class="restDiv2_1">'+
                                                                '��ġ���'+
                                                            '</div>'+
                                                            '<div class="restDiv2_2">'+
                                                            '</div>'+
                                                            '<div class="restDiv2_3">'+
                                                                '13,000��'+
                                                            '</div>'+
                                                            '<div class="restDiv2_1">'+
                                                                'ġ����'+
                                                            '</div>'+
                                                            '<div class="restDiv2_2">'+
                                                            '</div>'+
                                                            '<div class="restDiv2_3">'+
                                                                '20,000��'+
                                                            '</div>'+
                                                            '<div class="restDiv2_1">'+
                                                                '�Ŷ��'+
                                                            '</div>'+
                                                            '<div class="restDiv2_2">'+
                                                            '</div>'+
                                                            '<div class="restDiv2_3">'+
                                                                '50,000��'+
                                                            '</div>'+
                                                        '</div>'+
                                                    '</div>'+
                                                    '<div class="gradeDiv">'+
                                                        '<div class="gradeDiv1">'+
                                                            '�̿��� ����'+
                                                        '</div>'+
                                                        '<div class="gradeDiv2">'+
                                                            '4.3 / 5.0'+
                                                        '</div>'+
                                                        '<div class="gradeDiv3">'+
                                                            '<img src="./imgs/angryemoji.png"'+ 'class="angryEmoji">'+
                                                        '</div>'+
                                                    '</div>'+
                                                    '<div class="btnDiv">'+
                                                        '<a href="#" class="btn-gradient gray block">�󼼺���</a>'+
                                                        '<a href="#" class="btn-gradient red block">�ٷο���</a>'+
                                                    '</div>'+
                                                '</div>'+  
                                            '</div>'+  
                                        '</div>';

                // ��Ŀ ���� Ŀ���ҿ������̸� ǥ���մϴ�
                
                // ��Ŀ�� �߽����� Ŀ���� �������̸� ǥ���ϱ����� CSS�� �̿��� ��ġ�� �����߽��ϴ�
                var overlay = new daum.maps.CustomOverlay({
                    content: content,
                    map: map,
                    position: marker.getPosition()       
                });

                // ��Ŀ�� Ŭ������ �� Ŀ���� �������̸� ǥ���մϴ�
                
                
                $('.wrap').css('display','none');
                
                    
                daum.maps.event.addListener(marker, 'click', function() {
                    var mapProjection = map.getProjection(),
                        // �ش� ���� �浵���� X,Y������ ��ȯ����
                        latlng = markerPosition,
                        // ���� ��ǥ�� �ش��ϴ� ��ġ ��ǥ
                        mapPixel = mapProjection.containerPointFromCoords(latlng); 
                    
                    var center = map.getCenter();
                    var mapCenter = mapProjection.containerPointFromCoords(center);
                    var deltaX = mapPixel.x - mapCenter.x,
                        deltaY = mapPixel.y - mapCenter.y;
                    
                    // case 1 : ��Ŀ ���� Ŭ��
                    // case 2 : �ٸ� ��Ŀ�� Ȱ��ȭ �Ǿ��ִ� ��Ȳ���� �ٸ� ��Ŀ Ŭ��
                    // case 3 : �ٸ� ��Ŀ�� none �� �Ŀ� �� �ٸ� ��Ŀ Ŭ��
                    // state �ʱⰪ�� null
                    
                    // ��Ŀ�� Ŭ�� �ÿ� ��� �������̸� none �� �� ��Ŀ�� �������̸� inherit
                    // -> ��Ŀ���� ������� �̸��� ������ ��� �����غ��� ��
                    // -> ��Ŀ�� Title�� set,get �ϴ� ������� �ذ�
                    
                    // �ذ�
                    // case 1 : state�� null�� ���¿��� �������̸� �����ϰ� display inherit���� ����
                    // case 2 : state�� ó���� Ŭ���ߴ� marker�� �ƴϸ� ��� �������� display none �Ŀ�
                    //          markerTitle���� ���õ� marker�� ��󳻾� �ش� ���������� display inherit��
                    // case 3 : state�� ������ �����ߴ� marker�� ���ٸ� ��� ���������� display none
                    
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
          
                // close ��ư���� ���� ������ case 3���� ����Ǵ� ����
                // ��ư Ŭ���ÿ� selectedMarker�� null ����ָ� �ɵ� --> �Ϸ�
                $('.close').click(function(){
                    $('.wrap').css('display','none'); 
                    selectedMarker = null;
                });
                    
                    
                    
                clusterer.addMarker(marker);    
                // ��Ŀ�� ���� ���� ǥ�õǵ��� �����մϴ�
                marker.setMap(map);  
                overlay.setMap(null);  
            } // for end
                 
            
            

            </script>
                <div>
                    
                </div>
            
            </div>
        
        <jsp:include page="./layout/footer.jsp"></jsp:include>
    </body>
</html>