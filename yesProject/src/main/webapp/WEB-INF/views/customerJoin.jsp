<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="./js/jquery.validate.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

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
                font-size: 15px;
                
            }
            .form-group input{
                width:70%;
                height: 40px;                
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

        
        $(document).ready(function(){
    		$('#joinform').validate({
    			focusout:true,
    			onsubmit:false,
    			onkeyup: true,
    			rules:{
    				id:{required:true,
    					minlength:4,
     	                remote: {
    	                    	url:"./test/remote",
    	                    	type:"POST",
    	                        data: {
    	                            id: function() {
    	                               return $("#id").val();    
    	                            }
    	                       } 
    		
    	                       }

    				},
    				pw:{required:true,minlength:4},
    				pw2:{required:true,equalTo:"#pw"},
    				name:{required:true,
    					minlength:2},
    				nickName:{required:true},
    				phoneNum:{required:true,
    					      number:true,
    					      minlength:11,
    					      maxlength:11},
    				email:{required:true,
    						email:true},
    				
    			},
    			
    			messages:{
    				id:{
    					required:"필수정보입니다",
    					minlength:"최소 4자 이상 입력하세요",
    					remote:"중복된 아이디입니다"
    				},
    				pw:{
    					required:"필수정보입니다",
    					minlength:"최소 4자 이상 입력하세요"
    				},
    				pw2:{
    					required:"필수정보입니다",
    					equalTo:"비밀번호가 일치하지 않습니다"
    				},
    				name:{
    					required:"필수정보입니다",
    					minlength:""
    				},
    				nickName:{
    					required:"필수정보입니다"
    				},
    				phoneNum:{
    					required:"필수정보입니다",
    					number:"올바른 값을 입력해주세요",
    					minlength:"",
    					maxlength:""
    					},
    				email:{
    					required:"필수정보입니다",
    					email:"이메일 주소를 입력해주세요"
    				},
    				answer:{
    					required:"필수정보입니다"
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
    				$('#joinform').submit();
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
   
   
    <form id="joinform" action="add" method="post" style="width: 50%; margin: 0px auto; padding-left:120px;">
      <div class="form-group">
        <label for="id">아이디</label>
        <input type="hidden" class="form-control" id="branchNum" name="branchNum" value="0">
        <input type="text" class="form-control" id="id" name="id" >
       	<p></p>
      </div>
      <div class="form-group">
        <label for="pw">비밀번호</label>
        <input type="password" class="form-control" id="pw" name="password" >
        <p></p>
      </div>
      <div class="form-group">
        <label for="pw">비밀번호 재확인</label>
        <input type="password" class="form-control" id="pw2" name="pw2"  >
        <p></p>
      </div>
      <div class="form-group">
        <label for="name">이름</label>
        <input type="text" class="form-control" id="name" name="name" >
        <p></p>
      </div>
      <div class="form-group" style="display: inline-block">
        <label for="birth">생년월일</label>
        <input type="date" class="form-control" id="birthDate" name="birthDate" style="width: 100%"  >
      </div>
        <div class="form-group" style="display: inline-block; margin-left:15px;">
        <label for="nick">닉네임</label>
        <input type="text" class="form-control" id="nickName" name="nickName" style="width: 100%"  >
      </div>
      <div class="form-group">
        <label for="tel">휴대전화</label>
        <input type="tel" class="form-control" id="phoneNum" name="phoneNum" >
      	<p></p>
      </div>
      <div class="form-group">
        <label for="email">이메일</label>
        <input type="email" class="form-control" id="email" name="email" >
      	<p></p>
      </div>         
      <div class="form-group">
        <label for="quiz">비밀번호찾기 문제</label>
        <div class="dropdown">
  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" style="width: 70%">
    학창시절 기억에 남는 선생님은?
    <span class="caret"></span>
  </button>
  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
    <li><a href="#">당신의 별명은?</a></li>
    <li><a href="#">좋아하는 운동은?</a></li>
    <li><a href="#">가장 친한 친구는?</a></li>
    <li><a href="#">당신의 보물 1호는?</a></li>
  </ul>
</div>      
      </div>
                                    
      <div class="form-group">
        <label for="answer">정답</label>
        <input type="text" class="form-control" id="pwQuestion" name="pwQuestion" >
      </div>                                     

      <button type="submit" class="btn btn-primary" style="width:70%; font-size: 20px; margin-top: 30px;">가입하기</button>
    </form>
    </body>
</html>