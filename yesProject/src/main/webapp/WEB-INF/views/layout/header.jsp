<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
	
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Jua|Nanum+Gothic" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/clndr.css?version=1">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	
	<!-- jQuery Modal -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainStyle.css?ver=8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/insertstyle.css?ver=4">
	
	<!-- Website Font style -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
	<!-- Google Fonts -->
	<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
	
	<!-- naverLogin -->
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	
	<!-- jQuery Calander -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.8.3/underscore-min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script> 
	<script src="${pageContext.request.contextPath}/js/calendar/clndr.js"></script>
	<script src="${pageContext.request.contextPath}/js/calendar/clndr2.js"></script>
	
	<!-- jQuery validate -->
	<script src="${pageContext.request.contextPath}/js/validate/jquery.validate.js"></script>
	<script src="${pageContext.request.contextPath}/js/validate/additional-methods.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/validate/messages_ko.min.js"></script>
	
	<style>
        .quiz{font-size:15pt;}
	</style>
	<script>
	
	var imagePath = ".${pageContext.request.contextPath}/imgs/foodimgs/";
	//새로고침 (오류나면 지우기)
	var member='${member.registNum}';
	var id='${member.id}';
	if(member>=0 && id!='admin'){window.setInterval("count()",10000);}

	function count(){
			
	    $.ajax({
	        url:'${pageContext.request.contextPath}/count',
	        method:'POST',
	        data:{'registNum':member},
	        success:function(data){
	            //대기인원을 추가해야함
	            if(data.slice(0,2)=='사업'){
	                var tmp=data.slice(2,4);
	                console.log(tmp);
	                $('#slide-menu4 h2').empty().append("대기인원:"+tmp);
	                }
	            else if(data.slice(0,2)=='고객'){
	                var tmp2=data.slice(2);
	                var tmp3=tmp2.split('/');
	                $('#slide-menu2 h2').empty().append("대기번호:"+tmp3[0]+"<br/>"+"현재번호:"+tmp3[1]);

	                }
	            else{
	                $('#slide-menu2 h2').empty().append(data);
	            }


	        }
	    });
	}

	//-----------------------------//



	var state=false;


	var calendars = {};
	var days=new Array();

	jQuery(document).ready(function(){
  
	
		
		$('#slide').animate(
	            {right:-300},'slow'
	            );
	    $('#mypage').click(function(){
	        count();
	        //클릭할 때 마다 비동기통신
	        $('body').css('overflow-y','hidden');
	        $('#slide').css({"display":"inline-block"});
	        $('#slide').animate(
	         {right:0,},'slow');

	    $.ajax({
	        url:'${pageContext.request.contextPath}/loadReserve',
	        method:'POST',
	        success:function(list){
	            if(list.length==0) //예약한 내역이 없을 때 처리..
	                {
	                calendars.clndr2 = jQuery('.cal2').clndr2({
	                    clickEvents: {
				            onMonthChange: function () {
				                console.log('monthChange');
				            },
				            onYearChange: function () {
				                console.log('yearChange');
				            }
				        },
				        multiDayEvents: {
				            singleDay: 'date',
				            endDate: 'endDate',
				            startDate: 'startDate'
				        }
				    });
	            }//if문끝


	            for (var i = 0; i < list.length; i++) {
					var day=(list[i].reserveTime).slice(0,10);
					days.push(day);
					$('.calendar2-day-'+day+'').css({'background-color':'#FFA7A7',
													'border-radius':'50%'});

					calendars.clndr2 = jQuery('.cal2').clndr2({
						ready: function(){
							for (var i = 0; i < list.length; i++) {
				                var day=(list[i].reserveTime).slice(0,10);
								$('.calendar2-day-'+day+'').css({'background-color':'#FFA7A7',
									'border-radius':'50%'});
			                }
						},
				        clickEvents: {
				            onMonthChange: function () {
				                for (var i = 0; i < list.length; i++) {
				                var day=(list[i].reserveTime).slice(0,10);
								$('.calendar2-day-'+day+'').css({'background-color':'#FFA7A7',
									'border-radius':'50%'});
				                }
				            },
				            onYearChange: function () {
				                console.log('Cal-1 year changed');
				            }
				        },
				        multiDayEvents: {
				            singleDay: 'date',
				            endDate: 'endDate',
				            startDate: 'startDate'
				        },
				        showAdjacentMonths: true,
				        adjacentDaysChangeMonth: false
				    });


	            }//for end...

	        }//success end
	        });



	    });
	     $('#closeMypage').click(function(){
	        $('#slide').animate(
	        {right:-300},'slow'
	        );
	        $('body').css('overflow-y','auto');
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


	    //지도

	    $("#searchBox").slideToggle('slow', function(){});
	    // searchBox open / close
	    $('#searchIcon1').click(function() {
	        $('#searchIcon1').toggleClass('flip');
	        $('#searchBox').slideToggle('slow', function() {
	            // 객체가 다 펼치지거나 접히고 나면 여기에 든 내용이 실행된다.
	        });
	    });
	});
	
	</script>
</head>
<body>
<div id="slide" >
	<a id="closeMypage" style="float: right; color: black; font-size: 25px;">X</a>

	<h1>마이 페이지</h1>

	<div id="slide-menu">
		<ul style="width:100%;padding-left:5px;">
			<c:if test="${member.registNum=='0' }">
				<li><a href="${pageContext.request.contextPath}/reservation.yes">예약 현황</a></li>
				<li><a href="${pageContext.request.contextPath}/myWrite.yes">작성글 보기</a></li>
				<li><a href="${pageContext.request.contextPath}/myInfo.yes">내정보</a></li>
			</c:if>
			<c:if test="${member.registNum!='0' }">
				<li><a href="${pageContext.request.contextPath}/branchReserve.yes">예약 현황</a></li>
				<li><a href="${pageContext.request.contextPath}/branch_ReviewList.yes">리뷰게시판</a></li>
				<li><a href="${pageContext.request.contextPath}/myInfo.yes">내정보</a></li>
				<c:choose>
					<c:when test="${member.acceptState=='true'}">
						<li><a href="#modal3" rel="modal:open" onclick="javascript:myBranch();" style="width:100%;">매장정보</a></li>
					</c:when>
					<c:when test="${member.acceptState=='false'}">
						<li><a href="#modal3" rel="modal:open" onclick="javascript:myBranch();" style="width:100%;">등록 요청 정보</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="#modal2" rel="modal:open" onclick="javascript:modalStep1();" style="width:100%;">매장 등록</a></li>
					</c:otherwise>
				</c:choose>
				<li><a href="branchManage.yes" style="width:100%;">매장관리</a></li>
			</c:if>
		</ul>
	</div>
	<c:if test="${member.registNum=='0' }">
	<div id="slide-menu2">
		<h2></h2>
	</div>
	</c:if>
	<c:if test="${member.registNum!='0' }">
	<div id="slide-menu4">
		<h2>대기인원:</h2>
	</div>
	</c:if>
	<div id="slide-menu3">
		<div class="cal2"></div>
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
                <a class="navbar-brand" style="padding-top: 10px;" href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/imgs/logo_top3.png"/></a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="${pageContext.request.contextPath}/" class="menuBtn">예약<span class="sr-only"></span></a></li>
                    <li><a href="${pageContext.request.contextPath}/review_list" class="menuBtn">사용자 리뷰</a></li>
                    <li class="dropdown" id="openCsBtn">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">고객센터<span class="caret"></span></a>
                        <ul class="dropdown-menu" id="dropdown">
                            <li><a href="${pageContext.request.contextPath}/yesnotice/">공지사항</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="${pageContext.request.contextPath}/yesC_cs/">고객 상담</a></li>
                            <li><a href="${pageContext.request.contextPath}/yesS_cs/">사업자 상담</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                <c:if test="${member==null}">
                    <li><a id="modal2" href="#login" rel="modal:open" >로그인</a></li>
                    <li><a id="modal" href="#joinForm" rel="modal:open" >회원가입</a></li>
                </c:if>
                <c:if test="${member!=null }">
					<c:choose>
						<c:when test="${member.id !='admin' }">
	                    <li><a id="mypage" href="#">마이페이지</a></li>
	                    <li><a id="logout" href="${pageContext.request.contextPath}/logout" onclick="logoutKakao();">로그아웃</a></li>
	                    </c:when>
	                    <c:when test="${member.id == 'admin' }">    
                		<li><a href="${pageContext.request.contextPath}/admin/">관리자</a></li>
                		<li><a id="logout" href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
                		</c:when>
					</c:choose>
                </c:if>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
    <div id="joinForm" class="modal">
        <div class="detailModalTop">
            <div class="joinTitle">
            회원가입
            </div>
        </div>
    	
    	<div class="step1">
    	<textarea id="joinT" cols="80px" rows="10px" readonly="readonly" >
여러분을 환영합니다.
음식점 예약 서비스 및 제품(이하 ‘예스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 예약서비스시스템을 제공하는 비트캠프 4조(이하 ‘칼퇴근’)와 이를 이용하는 예스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 예스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.

예스를 이용하시거나 예스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.

다양한 예스를 즐겨보세요.
예스는 기본적으로 여러분 모두에게 동일한 내용의 서비스를 제공합니다. 다만, '청소년보호법' 등 관련 법령이나 기타 개별 서비스 제공에서의 특별한 필요에 의해서 연령 또는 일정한 등급을 기준으로 이용자를 구분하여 제공하는 서비스의 내용, 이용 시간, 이용 횟수 등을 다르게 하는 등 일부 이용을 제한하는 경우가 있습니다. 자세한 내용은 역시 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등에서 확인하실 수 있습니다.

예스에는 기본적으로 본 약관이 적용됩니다만 예스가 다양한 서비스를 제공하는 과정에서 부득이 본 약관 외 별도의 약관이 있습니다. 그리고 예스 계열사가 제공하는 특정 서비스의 경우에도 해당 운영 회사가 정한 고유의 약관, 운영정책 등이 적용될 수 있습니다. 이러한 내용은 각각의 해당 서비스 초기 화면에서 확인해 주시기 바랍니다.

회원으로 가입하시면 예스를 보다 편리하게 이용할 수 있습니다.
여러분은 본 약관을 읽고 동의하신 후 회원 가입을 신청하실 수 있으며, 예스는 이에 대한 승낙을 통해 회원 가입 절차를 완료하고 여러분께 예스 이용 계정(이하 ‘계정’)을 부여합니다. 계정이란 회원이 예스에 로그인한 이후 이용하는 각종 서비스 이용 이력을 회원 별로 관리하기 위해 설정한 회원 식별 단위를 말합니다. 회원은 자신의 계정을 통해 좀더 다양한 예스를 보다 편리하게 이용할 수 있습니다. 이와 관련한 상세한 내용은 계정 운영정책 및 고객센터 내 예스 회원가입 방법 등에서 확인해 주세요.

단체회원 계정 사용에서의 관리자, 멤버 등의 권한 및 (공동)책임에 관한 사항 등은 계정 운영정책 및 고객센터 내 네이버 단체회원(단체 아이디) 소개 등에서 확인해 주시기 바랍니다.

여러분이 제공한 콘텐츠를 소중히 다룰 것입니다.
예스는 여러분의 본의 아닌 불편이나 부담이 최소화될 수 있는 방법에 대해 항상 고민하고 개선해 나가겠습니다.

서비스 중단 또는 변경 시 꼭 알려드리겠습니다.
예스는 연중 무휴, 1일 24시간 안정적으로 서비스를 제공하기 위해 최선을 다하고 있습니다만, 컴퓨터, 서버 등 정보통신설비의 보수점검, 교체 또는 고장, 통신두절 등 운영상 상당한 이유가 있는 경우 부득이 서비스의 전부 또는 일부를 중단할 수 있습니다.

한편, 예스는 서비스 운영 또는 개선을 위해 상당한 필요성이 있는 경우 서비스의 전부 또는 일부를 수정, 변경 또는 종료할 수 있습니다. 무료로 제공되는 서비스의 전부 또는 일부를 수정, 변경 또는 종료하게 된 경우 관련 법령에 특별한 규정이 없는 한 별도의 보상을 하지 않습니다.

주요 사항을 잘 안내하고 여러분의 소중한 의견에 귀 기울이겠습니다.
예스는 서비스 이용에 필요한 주요사항을 적시에 잘 안내해 드릴 수 있도록 힘쓰겠습니다.

예스는 여러분의 소중한 의견에 귀 기울이겠습니다. 여러분은 언제든지 고객센터를 통해 서비스 이용과 관련된 의견이나 개선사항을 전달할 수 있으며, 예스는 합리적 범위 내에서 가능한 그 처리과정 및 결과를 여러분께 전달할 수 있도록 하겠습니다.

여러분이 쉽게 알 수 있도록 약관 및 운영정책을 게시하며 사전 공지 후 개정합니다.
예스는 본 약관의 내용을 여러분이 쉽게 확인할 수 있도록 서비스 초기 화면에 게시하고 있습니다.

예스는 수시로 본 약관, 계정 및 게시물 운영정책을 개정할 수 있습니다만, 관련 법령을 위배하지 않는 범위 내에서 개정할 것이며, 사전에 그 개정 이유와 적용 일자를 서비스 내에 알리도록 하겠습니다. 또한 여러분에게 불리할 수 있는 중대한 내용의 약관 변경의 경우에는 최소 30일 이전에 해당 서비스 내 공지하고 별도의 전자적 수단(전자메일, 서비스 내 알림 등)을 통해 개별적으로 알릴 것입니다.

예스는 변경된 약관을 게시한 날로부터 효력이 발생되는 날까지 약관 변경에 대한 여러분의 의견을 기다립니다. 위 기간이 지나도록 여러분의 의견이 예스에 접수되지 않으면, 여러분이 변경된 약관에 따라 서비스를 이용하는 데에 동의하는 것으로 간주됩니다. 예스로서는 매우 안타까운 일이지만, 여러분이 변경된 약관에 동의하지 않는 경우 변경된 약관의 적용을 받는 해당 서비스의 제공이 더 이상 불가능하게 될 수 있습니다.

예스에는 기본적으로 본 약관이 적용됩니다만, 부득이 각 개별 서비스의 고유한 특성을 반영하기 위해 본 약관 외 별도의 약관, 운영정책이 추가로 적용될 때가 있습니다. 따라서 별도의 약관, 운영정책에서 그 개별 서비스 제공에 관하여 본 약관, 계정 및 게시물 운영정책과 다르게 정한 경우에는 별도의 약관, 운영정책이 우선하여 적용됩니다. 이러한 내용은 각각의 개별 서비스 초기 화면에서 확인해 주시기 바랍니다.

본 약관은 한국어를 정본으로 합니다. 본 약관 또는 예스와 관련된 여러분과 예스와의 관계에는 대한민국의 법령이 적용됩니다. 그리고 본 약관 또는 예스와 관련하여 여러분과 예스 사이에 분쟁이 발생할 경우, 그 분쟁의 처리는 대한민국 '민사소송법'에서 정한 절차를 따릅니다.

공지 일자: 2018년 08월 07일
적용 일자: 2018년 08월 08일
예스와 관련하여 궁금하신 사항이 있으시면 고객센터(대표번호: 1588 – 3820/ 평일 09:00~18:00)로 문의 주시기 바랍니다.
    	
    	
    	</textarea>

		<div id="radioGroup">
		  <input type="radio" name="assent" class="okbtn" value="ok" /> 동의
		  <input type="radio" name="assent" value="no" /> 동의하지않음
		</div>
		
		<div class="choice">
			<a id="custom" href="#"  class="btn-gradient red block"role="button">고객</a>
   			<a id="branch" href="#" class="btn-gradient gray block" role="button">가맹점</a>
		
		</div>
    	</div>
    	
    	
   <!-- 가맹점 회원가입 --> 	
		<div class="step2">
		<form id="joinForm2" class="form-horizontal" method="post" action="add">
						
		<div class="form-group">
		<label for="id" class="cols-sm-2 control-label">아이디</label>
				<div class="cols-sm-10">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
						<input type="text" class="form-control" name="id" id="id"  placeholder="아이디를 입력해주세요" style="width:493px; height:34px;"/>
					</div>
				</div>
		</div>
		
		<div class="form-group">
		<label for="password" class="cols-sm-2 control-label">비밀번호</label>
				<div class="cols-sm-10">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
						<input type="password" class="form-control" name="password" id="password"  placeholder="비밀번호를 입력해주세요"  />
					</div>
				</div>
		</div>

		<div class="form-group">
		<label for="confirm" class="cols-sm-2 control-label">비밀번호 확인</label>
				<div class="cols-sm-10">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
						<input type="password" class="form-control" name="confirm" id="confirm"  placeholder="비밀번호를 한번 더 입력해주세요"/>
					</div>
				</div>
		</div>		
		
		<div class="form-group">
		<%--@declare id="username"--%><label for="username" class="cols-sm-2 control-label">이름</label>
				<div class="cols-sm-10">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
						<input type="text" class="form-control" name="name" id="name"  placeholder="이름을 입력해주세요"/>
					</div>
				</div>
		</div>

		<div class="form-group">
		<label for="nickName" class="cols-sm-2 control-label">닉네임</label>
				<div class="cols-sm-10">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
						<input type="text" class="form-control" name="nickName" id="nickName"  placeholder="닉네임을 입력해주세요"/>
					</div>
				</div>
		</div>

		<div class="form-group">
		<%--@declare id="birth"--%><label for="birth" class="cols-sm-2 control-label">생년월일</label>
				<div class="cols-sm-10">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
						<input type="date" class="form-control" name="birthDate" id="birthDate"  placeholder="생년월일을 입력해주세요"/>
					</div>
				</div>
		</div>


								
		<div class="form-group">
		<label for="email" class="cols-sm-2 control-label">이메일</label>
				<div class="cols-sm-10">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
						<input type="text" class="form-control" name="email" id="email"  placeholder="이메일 주소를 입력해주세요"/>
					</div>
				</div>
		</div>



		<div class="form-group">
		<label for="phoneNum" class="cols-sm-2 control-label">연락처</label>
				<div class="cols-sm-10">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
						<input type="text" class="form-control" name="phoneNum" id="phoneNum"  placeholder="연락처를 입력해주세요"/>
					</div>
				</div>
		</div>


		<div class="form-group" id="registNum">
		<label for=registNum class="cols-sm-2 control-label">사업자 등록번호</label>
				<div class="cols-sm-10">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
						<input type="text" class="form-control" name="registNum" id="registNum2"  placeholder="사업자 등록번호를 입력해주세요"/>
					</div>
				</div>
		</div>

		<div class="form-group" >
		<%--@declare id="quiz"--%><label for=quiz class="cols-sm-2 control-label">비밀번호 찾기 문제</label>
				<div class="cols-sm-10">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
						        <div class="dropdown">
									  <button id="quizChoice" class="btn btn-default dropdown-toggle quizChoice" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" style="width: 100%">
									    학창시절 기억에 남는 선생님은?
									    <span class="caret"></span>
									  </button>
									  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
									    <li><a class="quiz" href="#" >당신의 별명은?</a></li>
									    <li><a class="quiz" href="#" >좋아하는 운동은?</a></li>
									    <li><a class="quiz" href="#">가장 친한 친구는?</a></li>
									    <li><a class="quiz" href="#">당신의 보물 1호는?</a></li>
									  </ul>
								</div>
					</div>
				</div>
		</div>

		<div class="form-group" >
		<label for=pwQuestion class="cols-sm-2 control-label">정답</label>
				<div class="cols-sm-10">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-lock fa" aria-hidden="true"></i></span>
						<input type="text" class="form-control" name="pwQuestion" id="pwQuestion"  placeholder="정답을 입력해주세요"/>
					</div>
				</div>
		</div>


		<div class="form-group ">
			<input type="submit" class="btn btn-primary btn-lg btn-block login-button" value="Register"/>
		</div>
		<div class="login-register" >
			<a id="backJoin" >뒤로가기</a>
		</div>
		</form>
		
		
		</div>

    <a  href="#" class="close-modal" rel="modal:close">Close</a>
    </div>
    
</div>

<!-- 로그인 modal -->

<div id="login" class="modal">
    			<div class="detailModalTop">
    				<div class="joinTitle">
					로그인
    				</div>
	            </div>
	<div id="loginForm">
	<form  style="width: 70%; margin: 0px auto; padding-top:50px;">
	<div class="form-group">
		<label for="id" class="cols-sm-2 control-label">아이디</label>
		<div class="cols-sm-10">
			<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
				<input type="text" class="form-control id" name="id"  placeholder="아이디를 입력해주세요" style="width:411px; height:34px;"/>
			</div>
		</div>
	</div>	

		<div class="form-group">
		<label for="password" class="cols-sm-2 control-label">비밀번호</label>
				<div class="cols-sm-10">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
						<input type="password" class="form-control password" name="password"   placeholder="비밀번호를 입력해주세요"  />
					</div>
				</div>
		</div>	
	 <a onclick="loginCheck()"><input type="button"id="loginCheck" class="btn btn-primary" style="padding-left:10px; width:100%; font-size: 20px; margin-top: 10px; "value="로그인"/></a>
	</form>
	
	
	
	<div style="width:90%; margin-top:30px; " >
            
            <div style="display: inline-block; position:relative; bottom: 20px; margin-left:100px; ">
                
                <!-- 네이버아이디로로그인 버튼 노출 영역 -->
                <div id="naver_id_login" >
	                <script>
		                var naver_id_login = new naver_id_login("urGoHBK2Hl9eBQpjZEMD", "http://localhost:8090/yes/callback");
						var state = naver_id_login.getUniqState();
						naver_id_login.setButton("green", 3,47);
						naver_id_login.setDomain("http://localhost:8090/");
						naver_id_login.setState(state);
						naver_id_login.setPopup(false);
						naver_id_login.init_naver_id_login(); //초기화
	                </script>
                </div>
            </div>
          <div style="display: inline-block; position:relative; bottom: 20px;  ">
                <a id="custom-login-btn" href="javascript:loginWithKakao()">
					<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="225.375px" height="47px"   style="margin-top: 5px;"/>
				</a>
          </div>
          
		<div id="footerLogin">
			<a id="findID">아이디 찾기</a>
			<a id="findPW">비밀번호찾기</a>
			<a id="login-join" onclick="loginJoin()">회원가입</a>
		</div>
	</div>
	
	
	
	</div>
	
	<!-- 아이디찾기 -->
	<div id="login-findID">
	
	
		<form class="form-horizontal" >
						
		<div class="form-group">
		<label for="name" class="cols-sm-2 control-label">이름</label>
				<div class="cols-sm-10">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
						<input type="text" class="form-control name" name="name"  placeholder="이름을 입력해주세요"/>
					</div>
				</div>
		</div>
		  
		<div class="form-group">
		<%--@declare id="birth"--%><label for="birth" class="cols-sm-2 control-label">생년월일</label>
				<div class="cols-sm-10">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
						<input type="date" class="form-control birth" name="birthDate"  placeholder="생년월일을 입력해주세요"/>
					</div>
				</div>
		</div>


								
		<div class="form-group">
		<label for="email" class="cols-sm-2 control-label">이메일</label>
				<div class="cols-sm-10">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
						<input type="text" class="form-control email" name="email"   placeholder="이메일 주소를 입력해주세요"/>
					</div>
				</div>
		</div>
		  <div class="form-group" >
		  <input type="button" id="findID_btn" class="btn btn-default" value="아이디찾기"/>
		  </div>
		  <a onclick="loginBack();">뒤로가기</a>
		</form>
			

	</div>
	
	<!-- 비밀번호 찾기 -->


	<div id="login-findPW" style="display:none;width:640px;height:400px;overflow-y:scroll;">
	
	
		<form class="form-horizontal" >
		<div class="form-group">
		<label for="id" class="cols-sm-2 control-label">아이디</label>
				<div class="cols-sm-10">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
						<input type="text" class="form-control id2" name="id"  placeholder="아이디를 입력해주세요"/>
					</div>
				</div>
		</div>						
		<div class="form-group">
		<label for="name" class="cols-sm-2 control-label">이름</label>
				<div class="cols-sm-10">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
						<input type="text" class="form-control name2" name="name"  placeholder="이름을 입력해주세요"/>
					</div>
				</div>
		</div>
		  
		<div class="form-group">
		<%--@declare id="birth"--%><label for="birth" class="cols-sm-2 control-label">생년월일</label>
				<div class="cols-sm-10">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
						<input type="date" class="form-control birth2" name="birthDate"   placeholder="생년월일을 입력해주세요"/>
					</div>
				</div>
		</div>


								
		<div class="form-group">
		<label for="email" class="cols-sm-2 control-label">이메일</label>
				<div class="cols-sm-10">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
						<input type="text" class="form-control email2" name="email"  placeholder="이메일 주소를 입력해주세요"/>
					</div>
				</div>
		</div>
		
		<div class="form-group" >
		<%--@declare id="quiz"--%><label for=quiz class="cols-sm-2 control-label">비밀번호 찾기 문제</label>
				<div class="cols-sm-10">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
					        <div class="dropdown">
								  <button class="btn btn-default dropdown-toggle quizChoice" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" style="width: 100%">
								    학창시절 기억에 남는 선생님은?
								    <span class="caret"></span>
								  </button>
								  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
								    <li><a class="quiz" href="#" >당신의 별명은?</a></li>
								    <li><a class="quiz" href="#" >좋아하는 운동은?</a></li>
								    <li><a class="quiz" href="#">가장 친한 친구는?</a></li>
								    <li><a class="quiz" href="#">당신의 보물 1호는?</a></li>
								  </ul>
							</div>
					</div>
				</div>
		</div>
		<div class="form-group" >
		<label for=pwQuestion class="cols-sm-2 control-label">정답</label>
				<div class="cols-sm-10">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-lock fa" aria-hidden="true"></i></span>
						<input type="text" class="form-control pwQuestion" name="pwQuestion"   placeholder="정답을 입력해주세요"/>
					</div>
				</div>
		</div>
		
		  <div class="form-group" >
		  <input type="button" id="findPW_btn" class="btn btn-default" value="비밀번호찾기"/>
		  </div>
		  <a onclick="loginBack();">뒤로가기</a>
		</form>
			

	</div>

<!-- 비밀번호 수정하기 -->
	<div id="login-findPW2" style="display:none;width:640px;overflow-y:hidden;">
		<form class="form-horizontal" >
		
		
		<div class="form-group">
		<label for="password" class="cols-sm-2 control-label">비밀번호</label>
				<div class="cols-sm-10">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
						<input type="password" class="form-control pw" name="password"   placeholder="비밀번호를 입력해주세요"  />
					</div>
				</div>
		</div>

		<div class="form-group">
		<label for="confirm" class="cols-sm-2 control-label">비밀번호 확인</label>
				<div class="cols-sm-10">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
						<input type="password" class="form-control confirm" name="confirm"   placeholder="비밀번호를 한번 더 입력해주세요"/>
					</div>
				</div>
		</div>
		
		
		<input id="updatePW" type="button" class="btn btn-default" value="비밀번호 수정"/>
		
		</form>

	</div>
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

    </div>
</div>
    <span id="guide" style="color:#999"></span>
    <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>

	<%--<c:if test="${member.registNum==0 }">--%>
                        <%--<li><a href="reservation.yes">예약 현황</a></li>--%>
                        <%--<li><a href="review.yes">리뷰 작성</a></li>--%>
                        <%--<li><a href="myInfo.yes">내정보</a></li>--%>
                	<%--</c:if>--%>
	<div id="modal3" class="modal">
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
	                <div class="ticketingBtn" style="display: inline-block;"></div>
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
            <%--<div class="modalBbs">--%>
                <%--<div class="modalBbsMore">더보기</div>--%>
                <%--<div class="modalBbsTitle">--%>
	                <%--<div class="modalBbsTitleSub">제목</div>--%>
	                <%--<div class="modalBbsTitleDate">날짜</div>--%>
	                <%--<div class="modalBbsTitleWriter">작성자</div>--%>
                <%--</div>--%>
                <%--<div class="modalBbsList">--%>
	                <%--<div class="modalBbsListSub bbsSub1"></div>--%>
	                <%--<div class="modalBbsListDate bbsDate1"></div>--%>
	                <%--<div class="modalBbsListName bbsName1"></div>--%>
                <%--</div>--%>
                <%--<div class="modalBbsList">--%>
	                <%--<div class="modalBbsListSub bbsSub2"></div>--%>
	                <%--<div class="modalBbsListDate bbsDate2"></div>--%>
	                <%--<div class="modalBbsListName bbsName2"></div>--%>
                <%--</div>--%>
            <%--</div>--%>
        </div>
    </div>


	<iframe name="kakao_iframe" src="" width="6px" height="4px" style="visibility:hidden; display: none;"></iframe>
</body>


<%--member join--%>
<script src="${pageContext.request.contextPath}/js/header_js/member_join.js"></script>
<%--member login--%>
<script src="${pageContext.request.contextPath}/js/header_js/member_login.js"></script>
<%--branch Insert modal--%>
<script src="${pageContext.request.contextPath}/js/header_js/branch_insert.js"></script>
<%--mybranch modal--%>
<script src="${pageContext.request.contextPath}/js/header_js/mybranch.js"></script>
<%--etc : markerImageList() && loadFile--%>
<script src="${pageContext.request.contextPath}/js/header_js/etc.js"></script>
</html>