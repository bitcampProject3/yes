<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
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
                .answerA{
                    width:20%;
                }
            }
            @media all and (min-width: 768px) {
                .answerA{
                    width:15%;
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

                      </ul>
                    </li>
                  </ul>
                  <ul class="nav navbar-nav navbar-right">
                    <li><a href="#">로그인</a></li>
                    <li><a href="#">회원가입</a></li>
                    <li><a href="../admin/">관리자</a></li>
                  </ul>
                </div><!-- /.navbar-collapse -->
              </div><!-- /.container-fluid -->
            </nav>
            </div>
           
           <div class="container" style=" border-bottom: 1px solid #CCCCCC; padding-left: 0px; padding-right: 0px;">
           
           <div class="container" style=" border-bottom: 1px solid; padding-left:0px; padding-right:0px; 
               border-bottom-color: #e04f5f">
                  <div class="col-md-6">
					<h1 style="padding: 5px; margin-bottom: 20px; display: inline-block;">
                        <a href="./userList" style="color: black;">회원 정보</a>
                    </h1>
                   </div>
   				
   				  <c:if test="${bean.registNum ne null }">
                  <div class="col-md-6">
                  	<h1 style="padding: 5px; margin-bottom: 20px; display: inline-block;">
                      <a href="./branchList" style="color: black;">사업자 정보</a>
                  	</h1>
                  </div>
                  </c:if>
   
   
            </div>
            <div>
                
            <div class="col-md-6" style="padding-left: 40px; padding-right: 40px;">
                <header style="padding-top: 15px">
                    <h4><b>이름 : ${bean.name}</b></h4></header>
                    <br/>
                <div>
                   <section style="width: 100%; padding-bottom: 30px">
                   <article>     
                    <tr>
                        <td>
                            <b>닉네임 : <span>${bean.nickname}</span></b>
                        </td>
                    </tr>
                    <br/>
                    <br/>
                    <tr>
                        <td>
                            <b>아이디 : <span>${bean.id}</span></b>
                        </td>
                    </tr>
                    <br/>
                    <br/>
                    <tr>
                        <td>
                            <b>이메일 : <span>${bean.email}</span></b>
                        </td>
                    </tr>
                    <br/>
                    <br/>
                    <tr>
                        <td>
                            <b>핸드폰 번호 : <span>${bean.phoneNum}</span></b>
                        </td>
                    </tr>
                    <br/>
                    <br/>
                    <tr>
                        <td>
                            <b>비밀번호 질문 : <span>${bean.pwQuestion}</span></b>
                        </td>
                    </tr>
                    <br/>
                    <br/>
                    <tr>
                        <td>
                            <b>생년월일 : <span>${bean.birthDate}</span></b>
                        </td>
                    </tr>        
                   </article>
                   </section>
                </div>
            </div>
            <c:if test="${bean.registNum ne null }">
            <div class="col-md-6" style="padding-left: 40px; padding-right: 40px;">
                <header style="padding-top: 15px">
                    <h4><b>상호명 : ${branchinfo.branchname}</b></h4></header>
                    <br/>
                <div>
                   <section style="width: 100%; padding-bottom: 30px">
                   <article>     
                    <tr>
                        <td>
                            <b>영업일 : <span>${branchinfo.opDate}</span></b>
                        </td>
                    </tr>
                    <br/>
                    <br/>
                    <tr>
                        <td>
                            <b>영업 시간 : <span>${branchinfo.opTime}</span></b>
                        </td>
                    </tr>
                    <br/>
                    <br/>
                    <tr>
                        <td>
                            <b>쉬는 시간 : <span>${branchinfo.breakTime}</span></b>
                        </td>
                    </tr>
                    <br/>
                    <br/>
                    <tr>
                        <td>
                            <b>가게 전화번호 : <span>${branchinfo.phoneNum}</span></b>
                        </td>
                    </tr>
                    <br/>
                    <br/>
                    <tr>
                        <td>
                            <b>카테고리 : <span>${branchinfo.category}</span></b>
                        </td>
                    </tr>
                    <br/>
                    <br/>
                    <tr>
                        <td>
                            <b>최대 테이블 : <span>${branchinfo.maxTable}</span></b>
                        </td>
                    </tr>
                    <br/>
                    <br/>
                    <tr>
                        <td>
                            <b>평점 : <span>${branchinfo.score}</span></b>
                        </td>
                    </tr>
                    <br/>
                    <br/>
                    <tr>
                        <td>
                            <b>현재상태 : <span>${branchinfo.state}</span></b>
                        </td>
                    </tr>
                    <br/>
                    <br/>
                    <tr>
                        <td>
                            <b>주소 : <span>(${branchaddress.zoneCode })${branchaddress.roadAddress}(${branchaddress.jibunAddress}), ${branchaddress.detailAddress}</span></b>
                        </td>
                    </tr>
                    <br/>
                    <br/>
       
                   </article>
                   </section>
                </div>
                
            </div>
            </c:if>
            
            </div> 
            </div>      
                
            <div class="container" style="margin-top: 10px;">
              
                <div class="huge-top">
                    <button class="btn btn-normal pull-right" onclick="location.href='./${choice}'">
                       <span>목록으로</span>
                    </button>
                    
                </div>
                
            </div>

    </body>
</html>