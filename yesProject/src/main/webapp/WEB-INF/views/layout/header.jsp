<%--
  Created by IntelliJ IDEA.
  User: jinsoo
  Date: 2018-07-08
  Time: 오후 10:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Jua|Nanum+Gothic" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainStyle.css?ver=6">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/insertstyle.css?ver=2">
    <style>
    #slide *{
        font-family: 'Jua', sans-serif;
    }

	#slide h1{
		margin:80px 0px;
	}
	#slide a{
	 color:black;
	 margin-bottom:50px;
	}
	
	#slide-menu2{
		border-top:1px solid #e04f5f;
		width:80%;
		margin:20px auto;
		height:150px;
		background-color:red;
	}
	#slide-menu3{
		border-top:1px solid #e04f5f;
		width:100%;
		margin:20px auto;
		
	}
 

	</style>
    <script>
        $.noConflict();
        $(document).ready(function(){
            
            $('#slide').animate(
                {right:-300},'slow'
                );
        	$('#mypage').click(function(){
                $('#slide').css({"display":"inline-block"});
                $('#slide').animate(
                 {right:0,},'slow');
            });
             $('#close').click(function(){
                
                $('#slide').animate(
                {right:-300},'slow'
                ); 
             });
        	
        	
            $("#logout").click(function(){
            	$.ajax({
                    type : "POST",
                    dataType : 'text',
                    url : "http://nid.naver.com/nidlogin.logout",
                    crossDomain : true,
                    xhrFields : {
                       withCredentials : true
                    }
                 }).done(function(data) {
                    $('#logout').submit();
                 }).fail(function(xhr, textStatus, errorThrown) {
                    $('#logout').submit();
                 });
          	  
            });
            
        	
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
            $("#searchBox").slideToggle('slow', function(){});
            // searchBox open / close
            $('#searchIcon1').click(function() {
                $('#searchIcon1').toggleClass('flip');
                $('#searchBox').slideToggle('slow', function() {
                    // 객체가 다 펼치지거나 접히고 나면 여기에 든 내용이 실행된다.
                });
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
</head>
<body>
        <div id="slide" style="float:right; border:1px solid #e04f5f; width:17%; height: 100%; background-color:white; text-align: center;display: none ; z-index: 30; position:absolute; right:0;">
            <a id="close" style="float: right; color: black; font-size: 25px;">X</a>
          
            <h1>마이 페이지</h1>

			<div id="slide-menu">
            <ul>
                <li><a href="reservation.yes">예약 현황</a></li>
                <li><a href="review.yes">리뷰 작성</a></li>
                <li><a href="myInfo.yes">내정보</a></li>
            </ul>
			</div>
			<div id="slide-menu2">
			
			</div>
			<div id="slide-menu3">
  
			</div>
            
        </div> <!-- slide menu end-->


<div>
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" style="padding-top: 10px;" href="./"><img src="./imgs/logo_top3.png"/></a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="#modal2" onclick="javascript:modalStep1();" rel="modal:open" class="menuBtn">예약<span class="sr-only"></span></a></li>
                    <li><a href="review_list" class="menuBtn">사용자 리뷰</a></li>
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
                <c:if test="${member==null}">
                    <li><a href="login.yes">로그인</a></li>
                    <li><a href="join.yes">회원가입</a></li>
                </c:if>
                <c:if test="${member!=null }">
                    <li><a id="mypage" href="#">마이페이지</a></li>
                    <li><a id="logout" href="logout">로그아웃</a></li>
                </c:if>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</div>
<div id="modal2" class="modal">
    <div class="detailModalTop">
        <div class="detailModalTopTitle">
            가맹점 신청
        </div>
        <div class="detailModalTopCategory">
            1 / 3단계
        </div>
    </div>
    <div class="modalContent">
    
    
    <script>
    function markerImageList() {
    	for (i = 0; i<50; i++){
            $('.markerImageListDiv').append('<img class="foodIcon'+i+' markerIcon" src="/imgs/markerIcon/foodIcon'+i+'.png" width="57" height="57" />');
        }
    
    }
    
    
    
      var loadFile = function(event) {
        var tempmsg = event.target.id.slice(10,11);
        var outputs = 'output'+tempmsg;
        var output = document.getElementById(outputs);
        output.src = URL.createObjectURL(event.target.files[0]);
      };
    </script>
    </div>
</div>
    
    
<script>
    function modalStep1() {
        var contentStep1 =  '<div class="modalContentDiv" style="display: none;">'+
                            '    <div class="modalContentAttr">아이디 *예비</div>'+
                            '    <div><input name="id" id="id" type="text"/></div>'+
                            '</div>'+
                            '<div class="modalContentDiv">'+
                            '    <div class="modalContentAttr">최대 수용 테이블</div>'+
                            '    <div><input name="maxTable" id="maxTable" type="text" placeholder="숫자만 입력해주십시오"/></div>'+
                            '    <div class="modalContentAttr" style="width: 105px;">연락처</div>'+
                            '    <div><input name="phoneNum" id="phoneNum" type="text" placeholder="숫자만 입력해주십시오"/></div>'+
                            '</div>'+
                            '<div class="modalContentDiv">'+
                            '    <div class="modalContentAttr">상호명</div>'+
                            '    <div><input name="branchName" id="branchName" type="text"/></div>'+
                            '    <div class="modalSecondAttr">카테고리</div>'+
                            '    <div><input name="category" id="category" type="text" placeholder="한식 / 중식 / 양식 / 일식"/></div>'+
                            '</div>'+
                            '<div class="modalContentDiv">'+
                            '    <div class="modalContentAttr">영업시간</div>'+
                            '    <div><input name="opTime" id="opTime" type="text" placeholder="10:00~24:00"/></div>'+
                            '    <div class="modalSecondAttr">휴게시간</div>'+
                            '    <div><input name="breakTime" id="breakTime" type="text" placeholder="15:00~16:00"/></div>'+
                            '</div>'+
                            '<div class="modalContentDiv">'+
                            '    <div class="modalContentAttr">영업일</div>'+
                            '    <div><input name="opDate" id="opDate" type="text" placeholder="매주 n요일 휴무"/></div>'+
                            '</div>'+
                            '<div class="modalContentDiv">'+
                            '    <div class="modalContentAttr">매장 설명</div>'+
                            '    <div><input name="branchExplain" id="branchExplain" type="text"/></div>'+
                            '</div>'+
                            '<div class="modalContentDiv">'+
                            '    <div class="modalContentAttr">우편번호</div>'+
                            '    <div><input type="text" name="zoneCode" id="zoneCode" onclick="sample4_execDaumPostcode()" placeholder="우편번호" readonly="readonly"></div>'+
                            '    <div class="modalSecondAttr">지번주소</div>'+
                            '    <div><input type="text" name="jibunAddress" id="jibunAddress" onclick="sample4_execDaumPostcode()" placeholder="지번주소" readonly="readonly"></div>'+
                            '</div>'+
                            '<div class="modalContentDiv">'+
                            '    <div class="modalContentAttr">도로명주소</div>'+
                            '    <div><input type="text" name="address" id="address" placeholder="도로명주소" onclick="sample4_execDaumPostcode()" readonly="readonly"></div>'+
                            '</div>'+
                            '<div class="modalContentDiv">'+
                            '    <div class="modalContentAttr">상세주소</div>'+
                            '    <div><input name="addressDetail" id="addressDetail" type="text"/></div>'+
                            '</div>'+
                            '<input type="hidden" id="sido"> '+
                            '<input type="hidden" id="sigungu"> '+
                            '<input type="hidden" id="bname1"> '+
                            '<input type="hidden" id="bname2"> '+
                            '<div>'+
                            '    <a href="javascript:modalStep2();" onclick="modalStep1Event()">다음</a>'+
                            '</div>';
                            '</div>';
        $('.modalContent').empty().append(contentStep1);
        $('.detailModalTopCategory').empty().append('1 / 3단계 -- 가맹점 정보');
    }
    
    function modalStep1Event() {
        var data = {};
        data.maxTable = $('#maxTable').val();
        data.branchName = $('#branchName').val();
        data.phoneNum = $('#phoneNum').val();
        data.category = $('#category').val();
        data.opTime = $('#opTime').val();
        data.breakTime = $('#breakTime').val();
        data.opDate = $('#opDate').val();
        data.branchExplain = $('#branchExplain').val();
        data.zoneCode = $('#zoneCode').val();
        data.jibunAddress = $('#jibunAddress').val();
        data.roadAddress = $('#address').val();
        data.detailAddress = $('#addressDetail').val();
        data.sido = $('#sido').val();
        data.sigungu = $('#sigungu').val();
        data.bname1 = $('#bname1').val();
        data.bname2 = $('#bname2').val();
        
        
        $.ajax({
            type: "POST",
            url: "/insertstep1",
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
    
    function modalStep2() {
    
    	
        var contentStep2 =   '    <div class="modalStep2tr">'+
                             '        <div class="modalStep2nth1">순번</div>'+
                             '        <div class="modalStep2nth2">메뉴명</div>'+
                             '        <div class="modalStep2nth3">가격</div>'+
                             '        <div class="modalStep2nth4">대표메뉴(최대 세개 선택가능)</div>'+
                             '    </div>'+
                             '    <div class="modalStep2tr">'+
                             '        <div class="modalStep2nth1">1</div>'+
                             '        <div class="modalStep2nth2"><input type="text" name="menu1" id="menu1"/></div>'+
                             '        <div class="modalStep2nth3"><input type="text" name="price1" id="price1" placeholder="1,000원"/></div>'+
                             '        <div class="modalStep2nth4"><input type="checkbox" name="checkbox" id="checkbox1" class="checkbox1"/></div>'+
                             '    </div>'+
                             '    <div class="modalStep2tr">'+
                             '        <div class="modalStep2nth1">2</div>'+
                             '        <div class="modalStep2nth2"><input type="text" name="menu2" id="menu2"/></div>'+
                             '        <div class="modalStep2nth3"><input type="text" name="price2" id="price2" placeholder="2,000원"/></div>'+
                             '        <div class="modalStep2nth4"><input type="checkbox" name="checkbox" id="checkbox2" class="checkbox2"/></div>'+
                             '    </div>'+
                             '    <div class="modalStep2tr">'+
                             '        <div class="modalStep2nth1">3</div>'+
                             '        <div class="modalStep2nth2"><input type="text" name="menu3" id="menu3"/></div>'+
                             '        <div class="modalStep2nth3"><input type="text" name="price3" id="price3" placeholder="3,000원"/></div>'+
                             '        <div class="modalStep2nth4"><input type="checkbox" name="checkbox" id="checkbox3" class="checkbox3"/></div>'+
                             '    </div>'+
                             '    <div class="modalStep2tr">'+
                             '        <div class="modalStep2nth1">4</div>'+
                             '        <div class="modalStep2nth2"><input type="text" name="menu4" id="menu4"/></div>'+
                             '        <div class="modalStep2nth3"><input type="text" name="price4" id="price4" placeholder="4,000원"/></div>'+
                             '        <div class="modalStep2nth4"><input type="checkbox" name="checkbox" id="checkbox4" class="checkbox4"/></div>'+
                             '    </div>'+
                             '    <div class="modalStep2tr">'+
                             '        <div class="modalStep2nth1">5</div>'+
                             '        <div class="modalStep2nth2"><input type="text" name="menu5" id="menu5"/></div>'+
                             '        <div class="modalStep2nth3"><input type="text" name="price5" id="price5" placeholder="5,000원"/></div>'+
                             '        <div class="modalStep2nth4"><input type="checkbox" name="checkbox" id="checkbox5" class="checkbox5"/></div>'+
                             '    </div>'+
                             '    <div class="modalStep2tr">'+
                             '        <div class="modalStep2nth1">6</div>'+
                             '        <div class="modalStep2nth2"><input type="text" name="menu6" id="menu6"/></div>'+
                             '        <div class="modalStep2nth3"><input type="text" name="price6" id="price6" placeholder="6,000원"/></div>'+
                             '        <div class="modalStep2nth4"><input type="checkbox" name="checkbox" id="checkbox6" class="checkbox6"/></div>'+
                             '    </div>'+
                             '    <div class="modalStep2tr">'+
                             '        <div class="modalStep2nth1">7</div>'+
                             '        <div class="modalStep2nth2"><input type="text" name="menu7" id="menu7"/></div>'+
                             '        <div class="modalStep2nth3"><input type="text" name="price7" id="price7" placeholder="7,000원"/></div>'+
                             '        <div class="modalStep2nth4"><input type="checkbox" name="checkbox" id="checkbox7" class="checkbox7"/></div>'+
                             '    </div>'+
                             '    <div class="modalStep2tr">'+
                             '        <div class="modalStep2nth1">8</div>'+
                             '        <div class="modalStep2nth2"><input type="text" name="menu8" id="menu8"/></div>'+
                             '        <div class="modalStep2nth3"><input type="text" name="price8" id="price8" placeholder="8,000원"/></div>'+
                             '        <div class="modalStep2nth4"><input type="checkbox" name="checkbox" id="checkbox8" class="checkbox8"/></div>'+
                             '    </div>'+
                             '    <div class="modalStep2tr">'+
                             '        <div class="modalStep2nth1"></div>'+
                             '        <div class="modalStep2nth3"><a href="javascript:modalStep3();" onclick="modalStep2Event()" >다음</a></div>'+
                             '    </div>';
    	$('.modalContent').empty().append(contentStep2);
        $('.detailModalTopCategory').empty().append('2 / 3단계 -- 메뉴 입력');
        jQuery(document).ready(function($) {
            $("input[name=checkbox]:checkbox").change(function() {// 체크박스들이 변경됬을때
                var cnt = 3;
                if( cnt==$("input[name=checkbox]:checkbox:checked").length ) {
                    $(":checkbox:not(:checked)").attr("disabled", "disabled");
                } else {
                    $("input[name=checkbox]:checkbox").removeAttr("disabled");
                }
            });
        
            $("#selCnt").change(function() {
                $("input[name=checkbox]:checkbox").removeAttr("checked");
                $("input[name=checkbox]:checkbox").removeAttr("disabled");
            });
        });
    }
    
    function modalStep2Event() {
    	
    	var data = {};
    	
    	var menuArr = [],
            priceArr = [],
            checkboxArr = [];
    	
    	for (i = 1; i < 9; i++){
    		menuArr.push($('#menu'+i).val());
    		priceArr.push($('#price'+i).val());
    		checkboxArr.push($('#checkbox'+i).prop("checked").toString());
        }
    	
    
        $.ajax({
            type: "POST",
            url: "/insertstep2",
            traditional: true,
            dataType: 'json',
            data: JSON.stringify({
            	menu : menuArr,
            	price : priceArr,
            	checkbox : checkboxArr
            }),
            contentType:"application/json; charset=UTF-8",
            success: function(data) {
                alert('ajax-success');
            },
            error: function(request,status,error) {
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
        })
    }
    
    
    
    function modalStep3() {
    	var contentStep3 =  '<form name="fileForm" action="requestupload2" method="post" enctype="multipart/form-data">'+
                            '    <div class="fileFormTr">'+
                            '        <div><input multiple="multiple" type="file" name="file" onchange="loadFile(event)" id="fileUpload1"/></div>'+
                            '        <div><img src="/imgs/blank.png" id="output1" width="50px" height="50px"/></div>'+
                            '    </div>'+
                            '    <div class="fileFormTr">'+
                            '        <div><input multiple="multiple" type="file" name="file" onchange="loadFile(event)" id="fileUpload2"/></div>'+
                            '        <div><img src="/imgs/blank.png" id="output2" width="50px" height="50px"/></div>'+
                            '    </div>'+
                            '    <div class="fileFormTr">'+
                            '        <div><input multiple="multiple" type="file" name="file" onchange="loadFile(event)" id="fileUpload3"/></div>'+
                            '        <div><img src="/imgs/blank.png" id="output3" width="50px" height="50px"/></div>'+
                            '    </div>'+
                            '    <div class="fileFormTr">'+
                            '        <div><input multiple="multiple" type="file" name="file" onchange="loadFile(event)" id="fileUpload4"/></div>'+
                            '        <div><img src="/imgs/blank.png" id="output4" width="50px" height="50px"/></div>'+
                            '    </div>'+
                            '    <div class="fileFormTr">'+
                            '        <div><input multiple="multiple" type="file" name="file" onchange="loadFile(event)" id="fileUpload5"/></div>'+
                            '        <div><img src="/imgs/blank.png" id="output5" width="50px" height="50px"/></div>'+
                            '    </div>'+
                            '    <div class="fileFormTr">'+
                            '        <div><input multiple="multiple" type="file" name="file" onchange="loadFile(event)" id="fileUpload6"/></div>'+
                            '        <div><img src="/imgs/blank.png" id="output6" width="50px" height="50px"/></div>'+
                            '    </div>'+
                            '    <div class="fileFormTr">'+
                            '        <div><input multiple="multiple" type="file" name="file" onchange="loadFile(event)" id="fileUpload7"/></div>'+
                            '        <div><img src="/imgs/blank.png" id="output7" width="50px" height="50px"/></div>'+
                            '    </div>'+
                            '    <div class="fileFormTr">'+
                            '        <div><input multiple="multiple" type="file" name="file" onchange="loadFile(event)" id="fileUpload8"/></div>'+
                            '        <div><img src="/imgs/blank.png" id="output8" width="50px" height="50px"/></div>'+
                            '    </div>'+
                            '    <div class="markerImageListDiv" style="width: 390px; margin-left: 125px; height: 250px; margin-right: 125px; margin-top: 30px; border: 1px solid black;">'+
                            '        '+
                            '    </div>'+
                            '    <input type="submit" onclick="modelStep3Event()" value="전송" />'+
                            '</form>';
    	$('.modalContent').empty().append(contentStep3);
        $('.detailModalTopCategory').empty().append('3 / 3단계 -- 이미지 업로드');
        markerImageList();
        
        $('.markerIcon').click(function(e) {
        	var imageTarget = e.target.classList[0];
        	$('.markerIcon').css('background','none');
        	$('.'+imageTarget).css('background-color','#bcbcbc').attr('selected','selected').attr('id',imageTarget);
        	
            console.log('현재 클릭 : '+e.target.classList[0]);
        });
    }
    function modelStep3Event() {
        // 클릭했을때 이미지 불러오기
        var imageTarget = $("img[selected='selected']").attr('id')+'.png';
        
        $.ajax({
            type: 'POST',
            url: '/insertstep3',
            data: imageTarget,
            dataType: 'json',
            success: function() {
                alert('ajax 성공');
            },
            error: function(request, status, error) {
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
        });
    }
    
    </script>
    <span id="guide" style="color:#999"></span>
    <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zoneCode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address').value = fullRoadAddr;
                document.getElementById('jibunAddress').value = data.jibunAddress;
                document.getElementById('sido').value = data.sido;
                document.getElementById('sigungu').value = data.sigungu;
                document.getElementById('bname1').value = data.bname1;
                document.getElementById('bname2').value = data.bname2;
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
            
        }).open();
        
    }
	</script>
</body>
</html>
