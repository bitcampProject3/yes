<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        
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
            
            
            body form{
            
            	width: 50%; 
            	margin: 0px auto; 
            	padding-left:120px;
            }
            
            
            .form-group{
                font-size: 15px;
                
            }
            .form-group input{
                width:70%;
                
            }
        
        </style>
    </head>
    <body>
    
    <div class="page-header" style="text-align: center">
        <img src="./imgs/logo2.png"/>
    </div>
   
   
    <form method="post">
      <div class="form-group">
        <label for="id">아이디</label>
        <input type="text" class="form-control" id="id" name="id" >
      </div>
      <div class="form-group">
        <label for="pw">비밀번호</label>
        <input type="password" class="form-control" id="pw" name="pw" >
      </div>
      <div class="form-group">
        <label for="pw">비밀번호 재확인</label>
        <input type="password" class="form-control" id="pw" name="pw" >
      </div>
      <div class="form-group">
        <label for="number">사업자 번호</label>
        <input type="text" class="form-control" id="number" name="number" >
      </div>      
      <div class="form-group">
        <label for="name">이름</label>
        <input type="text" class="form-control" id="name" name="name" >
      </div>
      <div class="form-group" style="display: inline-block">
        <label for="birth">생년월일</label>
        <input type="date" class="form-control" id="birth" name="birth" style="width: 100%"  >
      </div>
        <div class="form-group" style="display: inline-block; margin-left:15px;">
        <label for="nick">닉네임</label>
        <input type="text" class="form-control" id="nick" name="nick" style="width: 100%"  >
      </div>
      <div class="form-group">
        <label for="tel">휴대전화</label>
        <input type="tel" class="form-control" id="tel" name="tel" >
      </div>
      <div class="form-group">
        <label for="tel">비밀번호찾기 문제</label>
        <div class="dropdown">
  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" style="width: 70%">
    학창시절 기억에 남는 선생님은?
    <span class="caret"></span>
  </button>
  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
    <li><a href="#">당신의 별명은?</a></li>
    <li><a href="#">좋아하는 운동은?</a></li>
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
                                
                                                          
                                                                                    
                                                                                                                                        
      <button type="submit" class="btn btn-primary" style="width:70%; font-size: 20px; margin-top: 30px;">가입하기</button>
    </form>
   
   
   
   
   
   
    </body>
</html>