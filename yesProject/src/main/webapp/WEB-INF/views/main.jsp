<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
        <link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Jua|Nanum+Gothic" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <link rel="stylesheet" href="css/selectDesign.css">
        <link rel="stylesheet" href="css/mapStyle.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        
        <style>
            *{
                font-family: 'Nanum Gothic', sans-serif;
                
            }
            nav a{
                font-family: 'Jua', sans-serif;
            }
            .searchText{
                font-family: 'Do Hyeon', sans-serif;
                font-size: 30px;
            }
            
            .navbar-default{
                height: 80px;
            }
            #searchIcon1 {
              -moz-transition: transform 1s;
              -webkit-transition: transform 1s;
              transition: transform 1s;
            }
            #footerImg {
                          -moz-transition: transform 1s;
                          -webkit-transition: transform 1s;
                          transition: transform 1s;
            }

            .flip {
              transform: rotate(-180deg);
            }
            html,body {height:100%; margin:0; padding:0;
            overflow-y: hidden; overflow-x: hidden;}
            
            .searchRe{
                font-size: 16px;
                font-weight: bold;
            }
            
            @media (min-width: 1111px) {
                .container-fluid{
                    background-color: #e04f5f; 
                    height: 120px;
                }
                .navbar-collapse{
                    padding-top: 40px; 
                    padding-left: 360px; 
                    font-size: 20px;
                }
                li > a{
                    color: white;
                    margin-right: 50px; 
                    font-size: 30px;
                }
                .menuBtnToggle{
                    color: white;
                    font-size: 30px;
                }
                .navbar-right>li>a{
                    font-size: 20px;
                    margin-right: 0px;
                    color: white;
                }
                #bs-example-navbar-collapse-1 a{
                    text-decoration: none;
                    text-decoration-color: white;
                    color: white;
                }
                #dropdown a{
                    color: black;
                    font-size: 16px;
                }
                .dropdown-toggle{
                    color: black;
                    background-color: #e04f5f;
                }
                .navbar-default .navbar-nav>.open>a {
                    background-image: linear-gradient(to bottom,#e04f5f 0,#e04f5f 100%);
                }
            }
            @media (max-width: 1110px) {
                li > a{
                    font-size: 20px;
                }
              .navbar-header {
                  float: none;
              }
              .navbar-left,.navbar-right {
                  float: none !important;
              }
              .navbar-toggle {
                  display: block;
              }
              .navbar-collapse {
                  border-top: 1px solid transparent;
                  box-shadow: inset 0 1px 0 rgba(255,255,255,0.1);
                  margin-top: 70px;
                  float: left;
              }
              .navbar-fixed-top {
                  top: 0;
                  border-width: 0 0 1px;
              }
              .navbar-collapse.collapse {
                  display: none!important;
              }
              .navbar-nav {
                  float: none!important;
                  margin-top: 7.5px;
              }
              .navbar-nav>li {
                  float: none;
                  background-color: white;
              }
              .navbar-nav>li>a {
                  padding-top: 10px;
                  padding-bottom: 10px;
              }
              .collapse.in{
                  display:block !important;
              }
                .container-fluid{
                    background-color: #e04f5f; 
                    height: 120px;
                }
                .navbar-collapse a{
                    text-decoration: none;
                    color: black;
                }
                #dropdown a{
                    font-size: 15px;
                }
                #bs-example-navbar-collapse-1{
                    width: 100%;
                }
                #bs-example-navbar-collapse-1 a{
                    display: block;
                    clear: both;
                }
                #bs-example-navbar-collapse-1>ul>li{
                    display: block;
                    clear: both;
                }
                .navbar-default .navbar-nav>.open>a{
                    background-image: none;
                }
                
                /*축소화시 메뉴 수정*/
/*
                .navbar-collapse{
                    width: 200px;
                    padding-right: 0px;
                }
                .navbar-nav{
                    background-color: black;    
                }
*/
            }
        </style>
        <script>
            
        $(document).ready(function(){
            $(".dropdownSelect img.flag").addClass("flagvisibility");

            $(".dropdownSelect dt a").click(function() {
              $(".dropdownSelect dd ul").toggle();
            });

            $(".dropdownSelect dd ul li a").click(function() {
              var text = $(this).html();
              $(".dropdownSelect dt a span").html(text);
              $(".dropdownSelect dd ul").hide();
              /* $("#result").html("Selected value is: " + getSelectedValue("sample"));*/
            });  
            $(".dropdownSelect2 img.flag").addClass("flagvisibility");

            $(".dropdownSelect2 dt a").click(function() {
              $(".dropdownSelect2 dd ul").toggle();
            });

            $(".dropdownSelect2 dd ul li a").click(function() {
              var text = $(this).html();
              $(".dropdownSelect2 dt a span").html(text);
              $(".dropdownSelect2 dd ul").hide();
              /* $("#result").html("Selected value is: " + getSelectedValue("sample"));*/
            });  
            $(".dropdownSelect3 img.flag").addClass("flagvisibility");

            $(".dropdownSelect3 dt a").click(function() {
              $(".dropdownSelect3 dd ul").toggle();
            });

            $(".dropdownSelect3 dd ul li a").click(function() {
              var text = $(this).html();
              $(".dropdownSelect3 dt a span").html(text);
              $(".dropdownSelect3 dd ul").hide();
              /* $("#result").html("Selected value is: " + getSelectedValue("sample"));*/
            });   
            $(".dropdownSelect4 img.flag").addClass("flagvisibility");

            $(".dropdownSelect4 dt a").click(function() {
              $(".dropdownSelect4 dd ul").toggle();
            });

            $(".dropdownSelect4 dd ul li a").click(function() {
              var text = $(this).html();
              $(".dropdownSelect4 dt a span").html(text);
              $(".dropdownSelect4 dd ul").hide();
              /* $("#result").html("Selected value is: " + getSelectedValue("sample"));*/
            }); 
            $(".dropdownSelect5 img.flag").addClass("flagvisibility");

            $(".dropdownSelect5 dt a").click(function() {
              $(".dropdownSelect5 dd ul").toggle();
            });

            $(".dropdownSelect5 dd ul li a").click(function() {
              var text = $(this).html();
              $(".dropdownSelect5 dt a span").html(text);
              $(".dropdownSelect5 dd ul").hide();
              /* $("#result").html("Selected value is: " + getSelectedValue("sample"));*/
            });          
        });


        function getSelectedValue(id) {
          return $("#" + id).find("dt a span.value").html();
        }

        $(document).bind('click', function(e) {
          var $clicked = $(e.target);
          if (!$clicked.parents().hasClass("dropdownSelect"))
            $(".dropdownSelect dd ul").hide();
        });

        $(".dropdownSelect img.flag").toggleClass("flagvisibility");
        </script>

        <script type="text/javascript">
        $(document).ready(function(){
            $('#searchIcon1').click(function() {
                console.log('실행됨');
                $('#searchIcon1').toggleClass('flip');
                $('#searchBox').slideToggle('slow', function() {
                  // 객체가 다 펼치지거나 접히고 나면 여기에 든 내용이 실행된다.
                });
            }); 
            
            var state = true;
            $('#footerImg').click(function() {
                console.log('실행됨');
                $('#footerImg').toggleClass('flip');
                if(state){              $('#footerDivOpen').animate({height:'60px'},'slow');
                state = false;    
                }else{
                    $('#footerDivOpen').animate({height:'120px'},'slow');
                    state = true;
                }
            });
            
//            $('li.dropdown').css("background-color","#e04f5f");
        });
          
        </script>
    </head>
    <body>
        <div>
            <nav class="navbar navbar-default">
              <div class="container-fluid" style="border: 1px #ebebeb solid;">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                  </button>
                  <a class="navbar-brand" style="padding-top: 10px;" href="#"><img src="./imgs/logo_top3.png"/></a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                  <ul class="nav navbar-nav">
                    <li><a href="#" class="menuBtn">예약<span class="sr-only"></span></a></li>
                    <li><a href="#" class="menuBtn">사용자 리뷰</a></li>
                    <li class="dropdown" id="openCsBtn">
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">고객센터<span class="caret"></span></a>
                      <ul class="dropdown-menu" id="dropdown">
                        <li><a href="#">공지사항</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">고객 상담</a></li>
                        <li><a href="#">사업자 상담</a></li>
                      </ul>
                    </li>
                  </ul>
                  <ul class="nav navbar-nav navbar-right">
                    <li><a href="login.bit">로그인</a></li>
                    <li><a href="join.bit">회원가입</a></li>
                  </ul>
                </div><!-- /.navbar-collapse -->
              </div><!-- /.container-fluid -->
            </nav>
        </div>
        
        <div class="page" id="page" style="width:100%; height: 100%;">
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
            <div><img src="./imgs/icon.png"  id="searchIcon1" style="position: absolute; z-index: 3; width: 40px; height: 40px; margin-left: 85px; margin-top: 35px;"></div>
            <div id="searchBox" style="position: absolute; z-index: 2; width: 85%; height: 20%; background-color: white; margin:60px 7.5%; border: 3px #e04f5f dashed; opacity: 0.85;">
            <table style="width: 100%; height: 100%; text-align: center;">
                <tr>
                    <td style="width: 10%; line-height: 50px; padding: 0px;"><span class="searchText">지역별</span></td>
                    <td style="width: 18%;">
                    <div class="selectbox">
                      <dl class="dropdownSelect">
                        <dt><a href="#" style="padding-top:4px;"><span>서울시</span></a></dt>
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
                    <td style="width: 18%;">
                    <div class="selectbox">
                      <dl class="dropdownSelect2">
                        <dt><a href="#" style="padding-top:4px;"><span>마포구</span></a></dt>
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
                    <td style="width: 18%;">
                    <div class="selectbox">
                      <dl class="dropdownSelect3">
                        <dt><a href="#" style="padding-top:4px;"><span>신수동</span></a></dt>
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
                    <td style="width: 18%;">
                    <div class="selectbox">
                      <dl class="dropdownSelect4">
                        <dt><a href="#" style="padding-top:4px;"><span>선택</span></a></dt>
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
                    <td style="width: 18%;"></td>
                </tr>    
                <tr>
                    <td style="width: 10%;"><span class="searchText">메뉴별</span></td>
                    <td style="width: 18%;">
                    <div class="selectbox">
                      <dl class="dropdownSelect5">
                        <dt><a href="#" style="padding-top:4px;"><span>한식</span></a></dt>
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
                    <td style="width: 18%; line-height: 10px;">
                        <span class="searchRe">[서울시 마포구 신수동]</span>의 
                    </td>
                    <td style="width: 18%; line-height: 10px; text-align: left;">
                        <span class="searchRe">[한식]</span><span class="searchText" style="float: right;">검  색</span>
                    </td>
                    <td style="width: 18%; text-align: center; padding: 10px;"><input type="text" style="width: 90%" class="form-control" id="searchName"></td>
                    <td style="width: 18%; text-align: left;"><button type="button" class="btn btn-default">Search</button></td>
                </tr>    
            </table>
            
            </div>
            
            <div id="map" style="width:100%;height:100%;margin-top: 0px; z-index: 1; position: relative;"></div>
            
            <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=630e98d8425188c04dae0728c65822bb"></script>
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
                
                var imageSrc = 'foodIcon2.png', // 마커이미지의 주소입니다    
                    imageSize = new daum.maps.Size(55, 55), // 마커이미지의 크기입니다
                    imageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

                // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
                var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption),
                    markerPosition = new daum.maps.LatLng(37.552651, 126.937765); // 마커가 표시될 위치입니다
                

                // 마커를 생성합니다
                var marker = new daum.maps.Marker({
                    position: markerPosition, 
                    image: markerImage // 마커이미지 설정 
                });

                // 커스텀 오버레이에 표시할 컨텐츠 입니다
                // 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
                // 별도의 이벤트 메소드를 제공하지 않습니다 
                var content = '<div class="wrap">' + 
                            '    <div class="info">' + 
                            '        <div class="title">' + 
                            '            카카오 스페이스닷원' + 
                            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
                            '        </div>' + 
                            '        <div class="body">' + 
                            '            <div class="img">' +
                            '                <img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
                            '           </div>' + 
                            '            <div class="desc">' + 
                            '                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>' + 
                            '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
                            '                <div><a href="http://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
                            '            </div>' + 
                            '        </div>' + 
                            '    </div>' +    
                            '</div>';

                // 마커 위에 커스텀오버레이를 표시합니다
                
                // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
                var overlay = new daum.maps.CustomOverlay({
                    content: content,
                    map: map,
                    position: marker.getPosition()       
                });

                // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
                var state = true;
                daum.maps.event.addListener(marker, 'click', function() {
                    if(state){
                        overlay.setMap(map);
                        map.panBy(100, 200);
                        state = false;
                    }else{
                        overlay.setMap(null);  
                        state = true;
                    }
                    
                });

                // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
                function closeOverlay() {
                    overlay.setMap(null);     
                }                

                // 마커가 지도 위에 표시되도록 설정합니다
                marker.setMap(map);  
                overlay.setMap(null);  
            </script>
                <div>
                    
                </div>
            
            </div>
        
        <div id="footerDivOpen" style="position: absolute; z-index: 2; bottom: 0; width: 100%; height: 120px; text-align: center; ">
            <div style="width: 100%; background-color: rgba( 255, 255, 255, 0.0 ); height: 20px; ">
                <img id="footerImg" style="display: inline-block; z-index: 3; line-height: 30px; margin: 0px auto; position: absolute; width: 35px; height: 35px; margin-top: 20px;" src="arrow.png">
            </div>
            <div style="vertical-align: bottom; background-color: white; bottom: 0px; margin-top: 20px; height: 80px; border-top: 2px solid #e04f5f;">
                
            </div>
        </div>
    </body>
</html>