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
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
	<!-- jQuery Modal -->
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
		.col-sm-9{
			height: 150px;
		}
		#cube{
			height: 60px;
		}
		#cube p{
			margin-bottom: 0px;
			margin-top: 15px;
		}
	</style>
	<script>
	
	var path = '${pageContext.request.contextPath}';
	
	var imagePath = "${pageContext.request.contextPath}/imgs/foodimgs/";
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
	     $('#close').click(function(){
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
	<a id="close" style="float: right; color: black; font-size: 25px;">X</a>

	<h1>마이 페이지</h1>

	<div id="slide-menu">
		<ul style="width:100%;padding-left:5px;">
			<c:if test="${member.registNum=='0' }">
				<li><a href="reservation.yes">예약 현황</a></li>
				<li><a href="myWrite.yes">작성글 보기</a></li>
				<li><a href="myInfo.yes">내정보</a></li>
			</c:if>
			<c:if test="${member.registNum!='0' }">
				<li><a href="branchReserve.yes">예약 현황</a></li>
				<li><a href="branch_ReviewList.yes">리뷰게시판</a></li>
				<li><a href="myInfo.yes">내정보</a></li>
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
	                        <c:if test="${member != null}">
	                        
	                        <c:choose>
		                        <c:when test="${member.registNum == '0'}">
			                        <c:if test="${member.id != 'admin'}">
			                        <li><a href="${pageContext.request.contextPath}/yesC_cs/">고객 상담</a></li>
		                            </c:if>
		                        </c:when>
		                        <c:when test="${member.registNum != '0'}">
			                        <c:if test="${member.id != 'admin'}">
				                        <li><a href="${pageContext.request.contextPath}/yesS_cs/">사업자 상담</a></li>
			                        </c:if>
			                        
		                        </c:when>
	                        </c:choose>
	                        </c:if>
                        </ul>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                <c:if test="${member==null}">
                    <li><a id="modal" href="#login" rel="modal:open">로그인</a></li>
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
    	<textarea id="joinT" cols="80px" rows="10px" readonly="readonly" ></textarea>

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

    <a href="javascript:close_modal();" class="close_modal">Close</a>
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
                <div class="modalScore" style="width: 330px;  text-align: right;
    margin-right: 100px;"></div>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
</html>