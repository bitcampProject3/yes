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
        </style>

    </head>
    <body>
    
    <div class="page-header" style="text-align: center">
        <img src="./imgs/logo2.png"/>
    </div>
   
   <div>

	<ul class="nav nav-tabs" style="margin:0px auto; width:400px;">
		  	<li role="presentation" class="active"><a href="#">아이디찾기</a></li>
		  	<li role="presentation" ><a id="findPw" href="findPw.yes">비밀번호찾기</a></li>
	</ul>

	<div style="border:1px solid gray; width:70%; margin:0px auto">
	
	<div style="margin:0px auto; width:50%">
	
		<form action="find" method="POST">
		<c:if test="${result ==null }">
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
		  <div class="form-group" >
		  <button type="submit" class="btn btn-default" >아이디 찾기</button>
		  </div>
		</c:if>
		</form>
		
	</div>
	
		<c:if test="${result !=null }">
	<div class="result-form" >
		<div class="form-group">
		<h1>고객님의 아이디는 ${result} 입니다.</h1>
		</div>
		<div class="form-group">
		<a class="btn btn-primary" href="login.yes" role="button">로그인</a>
		</div>
	
	</div>
		</c:if>
	
	
	</div>

		
  
   </div>
   
   
  
   
   
   
    </body>
</html>