<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Jua|Nanum+Gothic" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <link rel="stylesheet" href="./css/clndr.css">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<!-- jQuery Modal -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainStyle.css?ver=7">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/insertstyle.css?ver=3">
  

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
	<script src="./js/clndr.js"></script>
	<script src="./js/clndr2.js"></script>
	

	
	<!-- jQuery validate -->
	<script src="./js/jquery.validate.js"></script>
	<script src="./js/additional-methods.min.js"></script>
	<script src="./js/messages_ko.min.js"></script>
	
	<style>
	
    #slide *{
        font-family: 'Jua', sans-serif;
    }
	#slide{
		float:right;
		border:1px solid #e04f5f;
		width:250px;
		height: 100%;
		background-color:white;
		display: none ;
		z-index: 30;
		position:absolute;
		right:0;
		overflow-y:hidden;
	
	}
	#slide * {
		font-family: 'Jua', sans-serif;
	}
	
	#slide h1 {
		margin: 60px 0px;
		text-align:center;
	}
	
	#slide a {
		color: black;
		margin-bottom: 40px;
		font-size:27px;
		padding-left:18px;
	}
	
	#slide-menu {
		width: 100%;
		overflow:hidden;
	}
	
	#slide-menu li {
		list-style: none;
		margin-left: 0px;
		}
	
	#slide-menu2 , #slide-menu4{
		border-top: 1px solid #e04f5f;
		width: 100%;
		height: 100px;
		margin: 10px auto;
	}
	
	#slide-menu3 {
		border-top: 1px solid #e04f5f;
		width: 100%;
		margin-bottom: 20px;
		height: 200px;
	}
	
	#slide-menu4 h2,#slide-menu2 h2{
		margin-left:20px;
	}
	
	
	
	#joinForm{
	height: 500px; max-height: 500px; max-width: 640px; width: 640px; margin: auto; overflow: visible; border-radius: 10px; padding: 0px;}
	.detailModalTop{width: 640px;
	height: 100px;
	border-top-left-radius: 10px;
	 border-top-right-radius: 10px;
	 background-color: #e04f5f;
	 float:left;
	 color:white;
	 
	 }
	 
	 #joinForm h3{
	 	margin-top:5px;
	 	
	 }
	 #radioGroup{
	 	    width: 25%;
	
	    margin: 30px auto;
	 }
	 .joinTitle{
	 font-family: 'Jua', sans-serif;
	 font-size: 40px; color: white; width: 310px; height: 100%; padding-left: 10px; line-height: 100px; display: inline-block; float: left;}
	
	
	 #joinT{
	 	overflow-y:scroll;
	 	overflow-x: hidden;
	    margin-left: 30px;
	    margin-top: 30px;
	    border: none;
	    background-color: #ebebeb;
	    border-radius: 5px;
	    width: 90%;
	 }
	
	#choice{
		width:300px;
		margin:0px auto;
	}
	
	#step1{
	
		width: 640px;
	    height: 400px;
	    display: inline-block;
	
	}
	
	
	#step2{
		width:640px;
		height:400px;
		display:none;
		overflow-y:auto;
	}
	
	#loginForm{
		width:640px;
		height:400px;
		margin-top:100px;
	}
	.form-horizontal{
	    width: 500px;
	    height: 400px;
	    margin: 30px auto;
	}
	
	.modal a .close-modal {top: 12px;right: 12px;
		background-image: url("./imgs/cancel.png");
	}

	input.error, textarea.error

	{
	        border: 1px solid red
	}

	label.error
	
	{
	        display:block;
	        color:red;
	}

	

</style>

    <script>
   
    //새로고침 (오류나면 지우기)
    var member='${member.registNum}';
    if(member>=0){
           window.setInterval("count()",10000);}
   	
 	function count(){
 	
    	$.ajax({
 			url:'./count',
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
                $('#slide').css({"display":"inline-block"});
                $('#slide').animate(
                 {right:0,},'slow');
                
       		 $.ajax({
 				url:'./loadReserve',
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
        <div id="slide" style="">
            <a id="close" style="float: right; color: black; font-size: 25px;">X</a>
          
            <h1>마이 페이지</h1>

			<div id="slide-menu">
            <ul style="width:100%;padding-left:5px;">
            	<c:if test="${member.registNum==0 }">
                <li><a href="reservation.yes">예약 현황</a></li>
                <li><a href="review.yes">리뷰 작성</a></li>
                <li><a href="myInfo.yes">내정보</a></li>
            	</c:if>
            	<c:if test="${member.registNum!=0 }">
                <li><a href="branchReserve.yes">예약 현황</a></li>
                <li><a href="#">리뷰게시판</a></li>
                <li><a href="myInfo.yes">내정보</a></li>
                <li><a href="branchInfo.yes" style="width:100%;">매장정보</a></li>
                <li><a href="branchManage.yes" style="width:100%;">매장관리</a></li>
            	</c:if>
            </ul>
			</div>
			<c:if test="${member.registNum==0 }">
			<div id="slide-menu2">
			<h2></h2>
			</div>
			</c:if>
			<c:if test="${member.registNum!=0 }">
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
                    <li><a id="modal" href="#login" rel="modal:open">로그인</a></li>
                    <li><a id="modal" href="#joinForm" rel="modal:open" >회원가입</a></li>
                </c:if>
                <c:if test="${member!=null }">

                    <li><a id="mypage" href="#">마이페이지</a></li>
                    <li><a id="logout" href="logout">로그아웃</a></li>
                </c:if>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
    
 <!-- 회원가입 Modal -->   
    <!-- Modal -->
    
    
    
      <script>
      
      
      		
        	$(function(){
        		
        		

        		
        		
        		$('.quiz').click(function(e){
        			
        			var qc=$('#quizChoice').text().trim();
        			$('#quizChoice').text(e.target.text);
        			e.target.text=qc;
        			
        			console.log(e.target.text);
        			
        		});
        		
        		$('#back').click(function(){

        			$('#step2').css('display','none');
        			$('#step1').css('display','inline-block');        			
        			
        		});
        		
				$('#choice a').click(function(e){
        			
        			
            		if($('#okbtn').is(':checked')===false)
        			{
        			alert('동의해주세요');
					e.preventDefault();
        			}
            		else{
                		if(e.target.textContent=='고객')
    					{
                			$('#step1').css('display','none');
                			$('#step2').css('display','inline-block');
                			$('#registNum input').val('0');
							$('#registNum').css('display','none');                			
	
    					}
                		else if(e.target.textContent='가맹점')
                		{
                			$('#step1').css('display','none');
                			$('#step2').css('display','inline-block');
                		}
                		
                		jQuery("#joinForm2").validate({
                			rules:{
                				password:{required:true,minlength:4}
                			},
                  			messages:{
                				password:{
                					required:"필수정보입니다",
                					minlength:"최소 4자 이상 입력하세요"
                				}
                  			},
                			errorPlacement:function(error,element){
                				if(element.is(".form-control"))
                					{
                					error.appendTo(element.next());
                					}
                				else{
                					
                				}
                			},
                			submitHandler:function(){
                				$.css({cursor:"wait"});
                				$('#joinForm2').submit();
                			},
                			success:function(element){
                			}
                		});

            		}

        		});
				
        	});
        
        </script>
    
    <div id="joinForm" class="modal">
    			<div class="detailModalTop">
    				<div class="joinTitle">
	               	회원가입
    				</div>
	            </div> 
    	
    	<div id="step1">
    	<textarea id="joinT" cols="80px" rows="10px" readonly="readonly" ></textarea>

		<div id="radioGroup">
		  <input type="radio" name="assent" id="okbtn" value="ok" /> 동의
		  <input type="radio" name="assent" value="no" /> 동의하지않음
		</div>
		
		<div id="choice">
			<a id="custom" href="#"  class="btn-gradient red block"role="button">고객</a>
   			<a id="branch" href="#" class="btn-gradient gray block" role="button">가맹점</a>
		
		</div>
    	</div>
    	
    	
   <!-- 가맹점 회원가입 --> 	
		<div id="step2">
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
									  <button id="quizChoice" class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" style="width: 100%">
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
			<a id="back" >뒤로가기</a>
		</div>
		</form>
		
		
		</div>

    <a href="#" class="close-modal" rel="modal:close">Close</a>
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
	<form action="check" method="post" style="width: 70%; margin: 0px auto; padding-top:50px;">
	<div class="form-group">
		<label for="id" class="cols-sm-2 control-label">아이디</label>
				<div class="cols-sm-10">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
						<input type="text" class="form-control" name="id" id="id"  placeholder="아이디를 입력해주세요" style="width:411px; height:34px;"/>
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
	 <button type="submit" class="btn btn-primary" style="padding-left:10px; width:100%; font-size: 20px; margin-top: 30px; ">로그인</button>
	</form>
	
	
	
	<div style="width:90%; margin-top:20px; " >
            
            <div style="display: inline-block; position:relative; bottom: 20px; margin-left:100px; ">
                
                <!-- 네이버아이디로로그인 버튼 노출 영역 -->
                <div id="naver_id_login" ></div>

                  <!-- //네이버아이디로로그인 버튼 노출 영역 -->
                  <script type="text/javascript">
                  
                  
                    var naver_id_login = new naver_id_login("urGoHBK2Hl9eBQpjZEMD", "http://localhost:8090/yes/callback");
                    var state = naver_id_login.getUniqState();
                    naver_id_login.setButton("green", 3,47);
                    naver_id_login.setDomain("http://localhost:8090/");
                    naver_id_login.setState(state);
                    naver_id_login.setPopup(false);
                    naver_id_login.init_naver_id_login(); //초기화 
                    
                  </script>

                
            </div>
            <div style="display: inline-block;  ">
                
                
                <a id="kakao-login-btn" ></a>
				<a href="http://developers.kakao.com/logout"></a>
				</div>
				
				
 	<script type="text/javascript">
      // 사용할 앱의 JavaScript 키를 설정해 주세요.
      Kakao.init('630e98d8425188c04dae0728c65822bb');
      // 카카오 로그인 버튼을 생성합니다.
      Kakao.Auth.createLoginButton({
        container: '#kakao-login-btn',
        success: function(authObj) {
          // 로그인 성공시, API를 호출합니다.
          Kakao.API.request({
            url: '/v2/user/me',
            success: function(res) {
              console.log(JSON.stringify(res.properties.profile_image));
              console.log(JSON.stringify(res.properties.nickname));
              var name=JSON.stringify(res.properties.nickname);
              $.ajax({
                 	type:"POST",
                	url:"./kakaologin",
                	data:{
                		"name":name
                	},
                	success:function(data){
                	} 
              });
              $(location).attr("href","http://localhost:8090/yes/");
              
            },
            fail: function(error) {
              alert(JSON.stringify(error));
            }
          });
        },
        fail: function(err) {
          alert(JSON.stringify(err));
        }
      });
		</script>				
				
	</div>
	
	
	
	
	
	
	
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
	<!-- jQuery Calander -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.8.3/underscore-min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>
	<script src="./js/clndr.js"></script>
	<script src="./js/clndr2.js"></script>
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
