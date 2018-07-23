<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
            @media (min-width: 1095px) {
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
                    color: black;
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
            }
            @media (max-width: 1110px) {
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
            #cube:hover{
                background-color: #e04f5f;
                color: white;
          
            }
            #paginationUI a{
                margin-right: 0px;
                font-size: 14px;
                color: black;
            }
            @media all and (max-width: 768px) {
                .col-xs-6 {
                    width: 100%;
                }
                #btnform{
                    width: 100%;
                    margin-top: 10px;
                    display: inline-grid;
                }
                
                #writeCancel{
                    margin-top: 10px;
                }
                
                #writeReset{
                    margin-right: 0px;
                    margin-top: 5px;
                }

            }
            .pagination>.active>a, .pagination>.active>a:hover, .pagination>.active>a:visited, .pagination>.active>a:link{
            background-color: #e04f5f;
            border-color: #e04f5f;
            color: white;
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
                  <a class="navbar-brand" style="line-height: 20px; padding-top: 0px;" href="../"><img src="../resources/imgs/logo_top2.png"/></a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                  <ul class="nav navbar-nav">
                    <li><a href="#" class="menuBtn">예약<span class="sr-only"></span></a></li>
                    <li><a href="#" class="menuBtn">사용자 리뷰</a></li>
                    <li class="dropdown">
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">고객센터<span class="caret"></span></a>
                      <ul class="dropdown-menu" id="dropdown">
                        <li><a href="../yesnotice/">공지사항</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="../yesC_cs/">고객 상담</a></li>
                        <li><a href="../yesS_cs/">사업자 상담</a></li>
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
            </div>
           
           <div class="container">
           <div class="container" style=" border: 1px solid #CCCCCC; padding-left:0px; padding-right:0px; 
               border-bottom-color: #e04f5f">
                
              <div class="col-sm-9" style="width: 100%; padding-left: 14px; padding-right:14px; ">
                  <h1 style="padding: 5px; margin-bottom: 20px;">공지사항</h1>
                <div class="row" >
                  <div id="cube" class="col-xs-6 col-sm-4" style=" border-top: 1px solid darkgray; background-color: #e04f5f;
                    color: white; cursor: pointer;" onclick="location.href='../yesnotice/'">
                      <h4>
                          <p class="text-center" style="padding-top: 5px;padding-bottom: 5px;">
                              공지사항
                          </p>
                      </h4>
                  </div>
                  <div id="cube" class="col-xs-6 col-sm-4" style=" 
                     border-top:1px solid darkgray; border-right:1px solid darkgray; border-left:1px solid darkgray;
                        cursor: pointer;" onclick="location.href='../yesC_cs/'">                                          
                      <h4>
                          <p class="text-center" style="padding-top: 5px;padding-bottom: 5px;">
                              고객 상담
                          </p>
                      </h4>
                  </div>
                   <div id="cube" class="col-xs-6 col-sm-4" style=" border-top: 1px solid darkgray;
                     cursor: pointer;" onclick="location.href='../yesS_cs/'">
                      <h4>
                          <p class="text-center" style="padding-top: 5px;padding-bottom: 5px;">
                              사업자 상담
                          </p>
                      </h4>
                  </div>
                </div>
              </div>
        </div>
           
            <div class="panel panel-c">
            <div class="panel-heading"><h4>글 작성</h4></div>  
                <div class="panel-body">

                <div class="container"> 
				<form method="post">
                <div class="form-group"> 
                <label for="title">제목</label> 
                <input type="text" style="width: 80%"class="form-control" name ="title" id="title" placeholder="제목을 입력해주세요"> 
                </div> 
                
                
                <div class="form-group"> 
                <label for="writer">작성자</label> 
                <input type="text" style="width:30%" class="form-control" name ="writer" id="writer" placeholder="작성자"> 
                </div> 


                <div class="form-group"> 
                <label for="content">내용:</label> 
                <textarea class="form-control" rows="10" name="content" id="content"></textarea> 

                </div> 


                <div class="form-group" style="padding-bottom: 20px; border-bottom: 1px solid #ccc;"> 
                <label for="image">파일 첨부</label> 
                <input type="file" id="image" name="image"> 
                </div> 


                <div class="center-block" style='width:200px;text-align: center;'>
                <!-- Standard button -->
                    <button id="writebtn" type="submit" class="btn btn-default">글 쓰기</button>
                </div>
                
                <div id="btnform"> 
                <button id="writeReset" type="reset" class="btn btn-default pull-right" style="margin-right: 5px; ">
                    		다시 쓰기
                </button>
                </div> 
				</form>
                <button class="btn btn-default pull-right" id="writeCancel" onclick="history.back(1)" style="margin-right: 5px;">
                       <span>
                          	 목록으로
                       </span>
                </button> 

                </div> 
                </div> <!--panel end--> 
            </div> 
        </div>
   
    </body>
</html>