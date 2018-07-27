<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        
        <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
       	<script src="./js/jquery.validate.js"></script>
       	
       	
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>     
        <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
       
        <style>
        @media (max-width: 1050px) {
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
              }
              .navbar-nav>li>a {
                  padding-top: 10px;
                  padding-bottom: 10px;
              }
              .collapse.in{
                  display:block !important;
              }
            }
            body{
                background-color:RGB(255,232,232);
            }
			.form-group{
		
			margin-top:20px;
			}
			
			.result-form{
			
			margin:0px auto;
			padding:100px;
			text-align: center;
		
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
	
		if('${err}' == '고객님의 정보를 확인해주세요'){
			alert('${err}');
		}
		
		$(function(){
			
			
    		$('#updateForm').validate({
    			focusout:true,
    			onsubmit:false,
    			onkeyup: true,
    			rules:{
    				password:{required:true,minlength:4},
    				pw2:{required:true,equalTo:"#password"},
    			},
    			messages:{
    				password:{
    					required:"필수정보입니다",
    					minlength:"최소 4자 이상 입력하세요"
    				},
    				pw2:{
    					required:"필수정보입니다",
    					equalTo:"비밀번호가 일치하지 않습니다"
    				},
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
    				$('#updateForm').submit();
    			},
    			success:function(element){
    			}
    			
    		});
				
			});
			
	</script>
    </head>
    <body>
    
    <div class="page-header" style="text-align: center">
        <img src="./imgs/logo2.png"/>
    </div>
   
   <div>

	<ul class="nav nav-tabs" style="margin:0px auto; width:400px;">
		  	<li role="presentation" ><a href="findId.yes">아이디찾기</a></li>
		  	<li role="presentation" class="active"><a href="#">비밀번호찾기</a></li>
	</ul>

	<div style="border:1px solid gray; width:70%; margin:0px auto">
	
	<div style="margin:0px auto; width:50%">
	
		<form action="find2" method="POST">
		<c:if test="${result ==null }">
		  <div class="form-group">
		    <label for="id">아이디</label>
		    <input type="text" class="form-control" id="id" name="id"  >
		  </div>
		  <div class="form-group">
		    <label for="name">이름</label>
		    <input type="text" class="form-control" id="name" name="name"  >
		  </div>
		  <div class="form-group">
		    <label for="birth">생년월일</label>
		    <input type="date" class="form-control" id="birth" name="birth" >
		  </div>		  
		  <div class="form-group">
		    <label for="email">이메일</label>
		    <input type="email" class="form-control" id="email" name="email" >		  
		  </div>


		  <div class="form-group">
		  

			<div class="dropdown">
			  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
			    비밀번호 찾기 문제
			    <span class="caret"></span>
			  </button>
			  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
			    <li><a href="#">Action</a></li>
			    <li><a href="#">Another action</a></li>
			    <li><a href="#">Something else here</a></li>
			    <li role="separator" class="divider"></li>
			    <li><a href="#">Separated link</a></li>
			  </ul>
			</div>

		  </div>

		  <div class="form-group">
		    <label for="answer">정답</label>
		    <input type="text" class="form-control" id="answer" name="answer" >		  
		  </div>

		  <div class="form-group" >
		  <button id="findbtn" type="submit" class="btn btn-default" >비밀번호 찾기</button>
		  </div>
		</c:if>
		</form>
		
	</div>
	
		<c:if test="${result !=null }">
	<div class="result-form" >
	<form id="updateForm"action="pwUpdate" method="POST" class="form-horizontal">
		
		<div class="pw-group">
			<label for="pw">비밀번호</label>
			<input type="hidden" name="id" value="${id }"/>
		    <input type="password" class="form-control" id="password" name="password" />
		    <p></p>
		</div>
		<br/>
		<div class="pw-group">
			<label for="pw2">비밀번호확인</label>
		    <input type="password" class="form-control" id="pw2" name="pw2" />
		    <p></p>
		</div>
		<br/>
		<div class="pw-group">
			<button type="submit" class="btn btn-default" >비밀번호 수정</button>
		</div>
	</form>
	
	</div>
		</c:if>
	
	</div>

   </div>
   
    </body>
</html>