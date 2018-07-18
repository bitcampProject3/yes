<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!Doctype html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
        <link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Jua|Nanum+Gothic" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <style>
            *{
                font-family: 'Nanum Gothic', sans-serif;
                
            }
            nav a{
                font-family: 'Jua', sans-serif;
            }
            .searchMenu{
                font-family: 'Do Hyeon', sans-serif;
                font-size: 30px;
            }
            @media (min-width: 1095px) { /*사이즈 클 때*/
                
                
                
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
                .dropdown-toggle:hover{
                    color: black;
                }
                
                
                #menu a{
                    font-family: 'Nanum Gothic', sans-serif;
                }  
                
                #image {
                    height: 100px;
                    width: 150px;
                }

                /*.drop_back{
                    background-color: #e04f5f; 
                    height: 120px;
                }*/
            }
            @media (max-width: 1110px) { /*사이즈 작을 때*/
                
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
                
                #menu a{
                    font-family: 'Nanum Gothic', sans-serif;
                }  
                
                #image {
                    height: 100px;
                    width: 150px;
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
    </head>
    <body>
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
                  <a class="navbar-brand" style="line-height: 20px; padding-top: 0px;" href="main.html"><img src="imgs/logo_top2.png"/></a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                  <ul class="nav navbar-nav">
                    <li><a href="#" class="menuBtn">예약<span class="sr-only"></span></a></li>
                    <li><a href="review_list.html" class="menuBtn">사용자 리뷰</a></li>
                    <li class="dropdown">
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
                    <li><a href="#">로그인</a></li>
                    <li><a href="#">회원가입</a></li>
                  </ul>
                </div><!-- /.navbar-collapse -->
              </div><!-- /.container-fluid -->
            </nav>
            <div style="">
            </div>
        </div>
        <div class="drop_back"  id="menu">지역별 
<div class="btn-group" id="menu">
  <a class="btn dropdown-toggle" data-toggle="dropdown" >
    광역시 / 도
    <span class="caret"></span>
  </a>
  <ul class="dropdown-menu">
    <li>1</li>
    <li>2</li>
    <li>3</li>
    <li>4</li>
  </ul>
</div>
<div class="btn-group">
  <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
    구 / 시
    <span class="caret"></span>
  </a>
  <ul class="dropdown-menu">
    <li>1</li>
    <li>2</li>
    <li>3</li>
    <li>4</li>
  </ul>
</div>
<div class="btn-group">
  <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
    동 / 구
    <span class="caret"></span>
  </a>
  <ul class="dropdown-menu">
    <li>1</li>
    <li>2</li>
    <li>3</li>
    <li>4</li>
  </ul>
</div>
            <div class="btn-group">
  <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
    동
    <span class="caret"></span>
  </a>
  <ul class="dropdown-menu">
    <li>1</li>
    <li>2</li>
    <li>3</li>
    <li>4</li>
  </ul>
</div>
<br/> 메뉴별
 <div class="btn-group">
  <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
    메뉴
    <span class="caret"></span>
  </a>
  <ul class="dropdown-menu">
    <li>1</li>
    <li>2</li>
    <li>3</li>
    <li>4</li>
  </ul>
</div> <br>검색
<form class="form-inline" role="form">
<div class="form-group"> <label class="sr-only"       for="exampleInputEmail2">키워드검색
</label> <input type="email" class="form-control" id="exampleInputEmail2" placeholder="키워드검색"></div>
<button type="submit" class="btn btn-default">검색</button>  
</form>
</div>
<br/><br/><br/>
<table class="table table-hover" id="table">

<%--     		<c:forEach items="${alist }" var="bean">
    			<tr>
    				<td>${bean.branchID }</td>
    				<td>${bean.clientID }</td>
    				<td>${bean.index }</td>
    				<td>${bean.title }</td>
    			</tr> 
    		</c:forEach> --%>
<thead>
	<tr>
		<th>글번호</th>
		<th>대표이미지</th>
		<th>제목</th>
		<th>작성일</th>
	</tr>
</thead>    		
<tbody>    		
<c:forEach items="${alist }" var="bean">
  <tr>
<%--       <td><a href="../review_detail?index=${bean.index }"><img src="imgs/food1.jpg" id="image"/> ${bean.title}  </a></td> --%>
	  <td>${bean.idx }</td>
      <td><a href="review_list/${bean.idx }"><img src="imgs/food1.jpg" id="image"/></a></td>
      <td><a href="review_list/${bean.idx }"> ${bean.title}  </a></td>
      <td>${bean.calendar }</td>

  </tr>
</c:forEach>
</tbody>
</table>

<br/>
    <a class="btn btn-default" href="./review_write" role="button">글쓰기</a>
<br/>
<div>
  <ul class="pagination">
    <li><a href="#">Prev</a></li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li><a href="#">Next</a></li>
  </ul>
</div>
        
<!--<div class="container-fluid" > <div class="row"> <div class="col-md-3">.col-md-3</div> <div class="col-md-3">.col-md-3</div> <div class="col-md-3">.col-md-3</div> <div class="col-md-3">.col-md-3</div> </div></div>-->
    </body>
</html>