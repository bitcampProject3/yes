<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        
        <%
        pageContext.setAttribute("cr", "\r");
        pageContext.setAttribute("cn", "\n");
        pageContext.setAttribute("crcn", "\r\n");
        pageContext.setAttribute("sp", "&nbsp;");
        pageContext.setAttribute("br", "<br/>");
        %>
        
    </head>
    <body>
       <jsp:include page="../layout/header.jsp"></jsp:include>
           <div class="container">
           <div class="container" style=" border: 1px solid #CCCCCC; padding-left:0px; padding-right:0px; 
               border-bottom-color: #e04f5f">
                
              <div class="col-sm-9" style="width: 100%; padding-left: 14px; padding-right:14px; ">
	                  <h1 style="padding: 5px; margin-bottom: 20px;">공지사항</h1>
	                <div class="row" >
	                  <div id="cube" class="col-xs-9 col-sm-9" style=" width:100%;border-top: 1px solid darkgray; background-color: #e04f5f;
	                    color: white; cursor: pointer;" onclick="location.href='../yesnotice/'">
	                      <h4>
	                          <p class="text-center" style="padding-top: 5px;padding-bottom: 5px;">
	                              공지사항
	                          </p>
	                      </h4>
	                  </div>
	                </div>
	              </div>
        </div>
           
            <div class="panel panel-c">
            <div class="panel-heading"><h4>수정하기</h4></div>  
                <div class="panel-body">

                <div class="container"> 
                
				<form method="post" enctype="multipart/form-data">
                <div class="form-group"> 
                <label for="title">제목</label> 
                <input type="text" style="width: 80%"class="form-control" name ="title" id="title" placeholder="제목을 입력해주세요"
                value="${bean.title }"> 
                </div> 
                
                
                <div class="form-group"> 
                <label for="writer">작성자</label> 
                <input type="text" style="width:30%" class="form-control" name ="writer" id="writer" placeholder="작성자"
                value="${bean.writer }" disabled="disabled"> 
                </div> 


                <div class="form-group"> 
                <c:set var="cmt" value="${fn:replace(bean.content, crcn,br) }"/>
                <c:set var="cmt" value="${fn:replace(cmt,cr,br) }"/>
                <c:set var="cmt" value="${fn:replace(cmt,cn,br) }"/>
                <c:set var="cmt" value="${fn:replace(cmt,' ',sp) }"/>
                <c:set var="cmt" value="${fn:replace(cmt,br,crcn) }"/>
                <label for="content">내용:</label> 
                <textarea class="form-control" rows="10" name="content" id="content"><c:out value="${cmt }" escapeXml="false"/></textarea> 
                
                </div> 


                <div class="form-group" style="padding-bottom: 20px; border-bottom: 1px solid #ccc;"> 
                 <label for="file">파일 첨부</label> 
                <input multiple="multiple" type="file" name="subImages">  
                </div> 


                <div class="center-block" style='width:200px;text-align: center;'>
                <!-- Standard button -->
                    <button id="update" name="update" type="submit" class="btn btn-default">수정하기</button>
                </div>

                <div id="btnform"> 
                <button class="btn btn-default pull-right" id="writeCancel" onclick="history.go(-2)" style="margin-right: 5px;">
                       <span>
                          	 목록 으로
                       </span>
                </button> 
                <button id="writeReset" type="reset" class="btn btn-default pull-right" style="margin-right: 5px; ">
                    		다시 쓰기
                </button>
                </div> 
				</form>
                

                </div> 
                </div> <!--panel end--> 
            </div> 
        </div>
    </body>
</html>