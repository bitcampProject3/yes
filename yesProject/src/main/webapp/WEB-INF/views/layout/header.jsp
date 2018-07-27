<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
		<!-- jQuery Calander -->
		<link rel="stylesheet" href="./css/clndr.css?ver=1"> 
		<script src="./js/underscore.js"></script>
		<script src="./js/moment.js"></script>
		<script src="./js/clndr.js?ver=4"></script>
		<script src="./js/clndr2.js"></script>
		
		
		<!-- jQuery Modal -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
		
		
		<!-- Website Font style -->
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
		
		<!-- Google Fonts -->
		<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
		
		
	<style>
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
 	width: 150px;

    margin: 30px auto;
 }
 .detailModalTopTitle{
 font-family: 'Jua', sans-serif;
 font-size: 40px; color: white; width: 310px; height: 100%; padding-left: 10px; line-height: 100px; display: inline-block; float: left;}


 textarea{
 	overflow-y:scroll;
 	overflow-x: hidden;
    margin-left: 30px;
    margin-top: 30px;
    border: none;
    background-color: #ebebeb;
    border-radius: 5px;
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


.form-horizontal{
    width: 500px;
    height: 400px;
    margin: 30px auto;
}

.modal a .close-modal {top: 12px;right: 12px;background-image: url("/imgs/cancel.png");}

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
					
 					
 					if(list.length==0)
 						{
 						calendars.clndr2 = $('.cal2').clndr2({
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
					        },
					    });
 						
 						
 						
 						}//if문끝
 					
					
 					for (var i = 0; i < list.length; i++) {
						var day=(list[i].reserveTime).slice(0,10);
						days.push(day); 
						$('.calendar2-day-'+day+'').css({'background-color':'#FFA7A7',
														'border-radius':'50%'});
					   
						calendars.clndr2 = $('.cal2').clndr2({
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


<div >

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
                    <li><a href="#" class="menuBtn">예약<span class="sr-only"></span></a></li>
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
      
      
      		function menu(data){
      			console.log(data);
      		}
      		
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
                		

            		}

        		});
				
        	});
        
        </script>
    
    <div id="joinForm" class="modal">
    			<div class="detailModalTop">
    				<div class="detailModalTopTitle">
	               	회원가입
    				</div>
	            </div> 
    	
    	<div id="step1">
    	<textarea cols="80px" rows="10px" readonly="readonly" ></textarea>

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
		<form class="form-horizontal" method="post" action="add">
						
		<div class="form-group">
		<label for="id" class="cols-sm-2 control-label">아이디</label>
				<div class="cols-sm-10">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
						<input type="text" class="form-control" name="id" id="id"  placeholder="아이디를 입력해주세요"/>
					</div>
				</div>
		</div>
		
		<div class="form-group">
		<label for="password" class="cols-sm-2 control-label">비밀번호</label>
				<div class="cols-sm-10">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
						<input type="password" class="form-control" name="password" id="password"  placeholder="비밀번호를 입력해주세요"/>
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
		<label for="username" class="cols-sm-2 control-label">이름</label>
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
		<label for="birth" class="cols-sm-2 control-label">생년월일</label>
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
						<input type="text" class="form-control" name="registNum" id="registNum"  placeholder="사업자 등록번호를 입력해주세요"/>
					</div>
				</div>
		</div>

		<div class="form-group" >
		<label for=quiz class="cols-sm-2 control-label">비밀번호 찾기 문제</label>
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
</body>
</html>
