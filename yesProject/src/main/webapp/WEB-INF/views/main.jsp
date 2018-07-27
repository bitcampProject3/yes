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
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/clndrstyle.css?ver=3">
	    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
	    <script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.js"></script>
    </head>
 <body>
       
       <jsp:include page="./layout/header.jsp?ver=2"/>
        
        <div class="page" id="page" style="z-index:0;position:relative;">
            <script type="text/javascript">
            function mapResize() {
                var mapResize = document.getElementById('page');
                mapResize.style.width = window.innerWidth;
                mapResize.style.height = window.innerHeight - 100+'px';
            }
            window.onload = function() {
                mapResize();

                // ������ ũ�Ⱑ ���� �� �������� ����� �����ؾ� �ϴ°��
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
                            alert('�ش��ϴ� ������ �����ϴ�.');
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
						                                '               �ּ� : ' +val.roadAddress+ '<br/>' +
						                                '               ����ó : ' +val.phoneNum+ '<br/>' +
					                                    '               ���� : ' +val.score+ ' / 5.0 <br/>' +
					                                    '           </div>' +
		                                                '       </div>' +
				                                        '    </div>' +
			                                            '</div>';
                                
                                $('#searchResult').append(searchListContent);
                                
                            });
                            var searchCnt = searchLngArr.length;
                            searchResultList(searchLatArr, searchLngArr);
                            alert('�� ['+searchCnt+']�� �˻� �Ϸ�');
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
                            <option value="searchRocate">������</option>
                            <option value="searchName">��ȣ��</option>
                            <option value="searchMenu">�޴�</option>
                        </select>
                    </div>
                    <div style="display: inline-block; width: 50%; height: 100%;">
                        <input type="text" style="width: 100%; height: 100%;" name="searchInput">
                    </div>
                    <div style="display: inline-block; width: 15%; height: 100%;">
                        <button class="searchBtn" onclick="searchStart()" style="width: 100%; height: 100%;">�˻�</button>
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

		        // �Ϲ� ������ ��ī�̺�� ���� Ÿ���� ��ȯ�� �� �ִ� ����Ÿ�� ��Ʈ���� �����մϴ�
		        var mapTypeControl = new daum.maps.MapTypeControl();

		        // ������ ��Ʈ���� �߰��ؾ� �������� ǥ�õ˴ϴ�
		        // daum.maps.ControlPosition�� ��Ʈ���� ǥ�õ� ��ġ�� �����ϴµ� TOPRIGHT�� ������ ���� �ǹ��մϴ�
		        map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

		        // ���� Ȯ�� ��Ҹ� ������ �� �ִ�  �� ��Ʈ���� �����մϴ�
		        var zoomControl = new daum.maps.ZoomControl();
		        map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

		        // ��Ŀ Ŭ�����ͷ��� ����
		        var clusterer = new daum.maps.MarkerClusterer({
			        map: map, // ��Ŀ���� Ŭ�����ͷ� �����ϰ� ǥ���� ���� ��ü
			        averageCenter: true, // Ŭ�����Ϳ� ���Ե� ��Ŀ���� ��� ��ġ�� Ŭ������ ��Ŀ ��ġ�� ����
			        minLevel: 6, // Ŭ������ �� �ּ� ���� ����
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
					
			        // ���������� �˻��� �Ϸ������
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
					        '${articleList.category}', '${articleList.branchExplain}'];
				        
				        coords = new daum.maps.LatLng(result[0].y, result[0].x);


						if (('${articleList.latlngx}' && '${articleList.latlngy}')==null){
				        //���ϵ� �ڷῡ latlng �Է�
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
								console.log(tempId+' ��ǥ ������Ʈ �Ϸ�');
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
			            branchExplain   = branchArr[23];
			            
			        var imageSrc = './imgs/markerIcon/'+markerImage, // ��Ŀ�̹����� �ּ��Դϴ�
				        imageSize = new daum.maps.Size(55, 55), // ��Ŀ�̹����� ũ���Դϴ�
				        imageOption = {offset: new daum.maps.Point(27, 69)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.

			        // ��Ŀ�� �̹��������� ������ �ִ� ��Ŀ�̹����� �����մϴ�
			        var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
			        var marker = new daum.maps.Marker({
				        position: markerPosition,
				        title: id,
				        image: markerImage // ��Ŀ�̹��� ����
			        });
			        var className = '' + id + ' wrap';


			        // ��Ŀ�� �߽����� Ŀ���� �������̸� ǥ���ϱ����� CSS�� �̿��� ��ġ�� ����
			        // Ŀ���� �������̿� ǥ���� ������
			        var content = document.createElement('div');
			        content.className = className;
			        content.innerHTML = '<div class="info">' +
				        '<div class="title">' +
				        '<p>' + branchName + '</p>' +
				        '<div class="close" title="�ݱ�"></div>' +
				        '</div>' +
				        '<div class="popupBody">' +
				        '<div class="img">' +
				        '<img src="/imgs/foodimgs/'+mainImage+'" width="100" height="100">' +
				        '</div>' +
				        '<div class="desc">' +
				        '<div class="address ellipsis">' + roadAddress + ' ' + detailAddress + '</div>' +
				        '<div class="jibun ellipsis">(��) ' + zoneCode + ' (����) ' + jibunAddress + '</div>' +
				        '<div class="phone ellipsis">' + phoneNum + '</div>' +
				        '<div class="ellipsis"><br/></div>' +
				        '<div class="timeDiv">' +
				        '<div class="timeDiv1">' +
				        '�����ð�' +
				        '</div>' +
				        '<div class="timeDiv2">' +
				        opTime +
				        '</div>' +
				        '</div>' +
				        '<div class="dayDiv">' +
				        '<div class="dayDiv1">' +
				        '������' +
				        '</div>' +
				        '<div class="dayDiv2">' +
				        opDate +
				        '</div>' +
				        '</div>' +
				        '<div class="breakDiv">' +
				        '<div class="breakDiv1">' +
				        '�ްԽð�' +
				        '</div>' +
				        '<div class="breakDiv2">' +
				        breakTime +
				        '</div>' +
				        '</div>' +
				        '<div class="restDiv">' +
				        '<div class="restDiv1">' +
				        '��ǥ�޴�' +
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
				        '�̿��� ����' +
				        '</div>' +
				        '<div class="gradeDiv2">' +
				        score + ' / 5.0' +
				        '</div>' +
				        '<div class="gradeDiv3">' +
				        '<img src="./imgs/angryemoji.png"' + 'class="angryEmoji">' +
				        '</div>' +
				        '</div>' +
				        '<div class="btnDiv">' +
				        '<a href="#ex1" onclick="javascript:branchDetail(\''+branchArr+'\');" rel="modal:open" class="btn-gradient gray block">�󼼺���</a>' +
				        '<a href="#reserveModal" onclick="javascript:reserveModal(\''+branchName+'\',\''+id+'\')" rel="modal:open" class="btn-gradient red block">�ٷο���</a>' +
				        '</div>' +
				        '</div>' +
				        '</div>' +
				        '</div>';

			        // ��Ŀ ���� Ŀ���ҿ������̸� ǥ���մϴ�

			        // ��Ŀ�� �߽����� Ŀ���� �������̸� ǥ���ϱ����� CSS�� �̿��� ��ġ�� �����߽��ϴ�
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
					        // close ��ư���� ���� ������ case 3���� ����Ǵ� ����
					        // ��ư Ŭ���ÿ� selectedMarker�� null ����ָ� �ɵ� --> �Ϸ�
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
			        // ��Ŀ�� ���� ���� ǥ�õǵ��� �����մϴ�
			        marker.setMap(map);
			        overlay.setMap(null);
		        } // for end
		        
				function reserveModal(name, id) {
			        $('.modalTopSpan').empty().append(name+' ����');
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
			            branchExplain   = branchDetailArr[23];
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
								$('.modalMenuName'+[i]).empty();
								$('.modalMenuName'+[i]).append(test[i*2]);
								$('.modalMenuPrice'+[i]).empty();
								$('.modalMenuPrice'+[i]).append(test[i*2+1]);
							}
				        }
			        });
					
					$('.detailModalTopTitle').empty();
					$('.modalScore').empty();
					$('.modalStatus').empty();
					$('.modalJibunAddress').empty();
					$('.modalAddress').empty();
					$('.modalPhoneNum').empty();
					$('.modalOpTime').empty();
					$('.modalBreakTime').empty();
					$('.modalOpDay').empty();
					$('.modalExplain').empty();
					
					// ���� detail �������� db���� �߰�
					$('.detailModalTopTitle').append(branchName);
					$('.modalScore').append(score+' / 5.0');
					$('.modalStatus').append(state);
					$('.modalAddress').append(roadAddress);
					$('.modalJibunAddress').append('(��) '+zoneCode+' (����) '+jibunAddress);
					$('.modalPhoneNum').append(phoneNum);
					$('.modalOpTime').append(opTime);
					$('.modalBreakTime').append(breakTime);
					$('.modalOpDay').append(opDate);
					$('.modalExplain').append(branchExplain);
					
					
					var imagePath = "/imgs/foodimgs/";
					
			        $('.gallerymain').attr('src',imagePath+image1);
			        $('.gallerylink').attr('href',imagePath+image1);
					
					for (i = 1; i<9; i++){
						$('.img'+[i]).attr('src',imagePath+(image1.substring(0,10))+i+'.jpg');
						$('.imgLink'+[i]).attr('href',imagePath+(image1.substring(0,10))+i+'.jpg');
					}
		        }
		        
	        </script>
	        <script>
		       
	        </script>
	        <div id="ex1" class="modal">
			        <div class="detailModalTop">
			            <div class="detailModalTopTitle">
			            </div>
				        <div class="detailModalTopCategory">
					        <span class="categorySpan">���� ������ �ѽ�</span>
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
		                <div class="modalStatusDiv">
			                <div class="modalScore"></div>
			                <div class="modalStatus"></div>
		                </div>
		                <div>
			                <div class="modalAddressDiv">�ּ�</div>
			                <div class="modalAddress"></div>
		                </div>
		                <div class="modalJibunAddress">
		                </div>
		                <div>
			                <div class="modalPhoneNumDiv">����ó</div>
			                <div class="modalPhoneNum"></div>
		                </div>
		                <div>
			                <div class="modalOpTimeDiv">�����ð�</div>
			                <div class="modalOpTime"></div>
		                </div>
		                <div>
			                <div class="modalBreakTimeDiv">�ްԽð�</div>
			                <div class="modalBreakTime"></div>
		                </div>
		                <div class="modalOpDayBox">
			                <div class="modalOpDayDiv">������</div>
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
			                <div class="modalBbsMore">������</div>
			                <div class="modalBbsTitle">
				                <div class="modalBbsTitleSub">����</div>
				                <div class="modalBbsTitleDate">��¥</div>
				                <div class="modalBbsTitleWriter">�ۼ���</div>
			                </div>
			                <div class="modalBbsList">
				                <div class="modalBbsListSub">�̷��� ������ ���� ó�� ����....</div>
				                <div class="modalBbsListDate">2018-07-19</div>
				                <div class="modalBbsListName">����</div>
			                </div>
			                <div class="modalBbsList">
				                <div class="modalBbsListSub">�̷��� ���ִ� ���� ó�� ����....</div>
				                <div class="modalBbsListDate">2018-07-17</div>
				                <div class="modalBbsListName">õ��</div>
			                </div>
		                </div>
	                </div>
                </div>
			

                <div>
                
                </div>
            
            </div>
            <div id="reserveModal" class="modal" style="height: 600px; max-height: 600px; max-width: 400px; width: 400px;">
		        <div class="detailModalTop" style="width: 400px; color: white;">
			        <span class="modalTopSpan">����</span>
		        </div>
	            <div id="calendar"></div>
	            <div class="reserveTimeDiv">
		            <div class="reservePersonel">
			            <input type="number" min="1" max="10" class="reservePersonelInput" placeholder="1"/>��
		            </div>
		            <div class="reserveTimeSelect">
			            <select class="timeSelect">
				            <option>����ð�</option>
			            </select>
		            </div>
	            </div>
	            <div class="resultTimeDiv">
		           17�� 7�� 30�� 2��
	            </div>
	            <div class="reserveRequest">
		           <input type="text" class="reserveRequestInput" placeholder="��û����"/>
	            </div>
	            <div class="reserveBtn">
		            <a href="#" class="btn-gradient gray block">���</a>
		            <a href="#" class="btn-gradient red block">����</a>
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
				preload: [0,1] // Will preload 0 - before current, and 1 after the current image
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
	        // $.ajax({
		     //    type: 'POST',
		     //    url: './reservepreview',
		     //    data: id,
		     //    dataType: 'json',
		     //    success: function (data) {
			 //        $.each(data,  function (idx, val) {
				//         test.push(val.menu);
				//         test.push(val.price);
			 //        });
			 //        for (i = 0; i <test.length; i++){
				// 		$('.modalMenuName'+[i]).empty();
				// 		$('.modalMenuName'+[i]).append(test[i*2]);
				// 		$('.modalMenuPrice'+[i]).empty();
				// 		$('.modalMenuPrice'+[i]).append(test[i*2+1]);
				// 	}
		     //    }
	        // });
         
        });
    });
    
    </script>
    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>--%>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.8.3/underscore-min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>
    <script src="/js/clndr.min.js"></script>
    <script src="/js/demo.js?ver=3"></script>
    </body>
</html>