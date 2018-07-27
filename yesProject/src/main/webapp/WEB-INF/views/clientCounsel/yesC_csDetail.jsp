<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
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
        <script>
		function doImgPop(img){ 
			 img1= new Image(); 
			 img1.src=(img); 
			 imgControll(img); 
			} 
			  
			function imgControll(img){ 
			 if((img1.width!=0)&&(img1.height!=0)){ 
			    viewImage(img); 
			  } 
			  else{ 
			     controller="imgControll('"+img+"')"; 
			     intervalID=setTimeout(controller,20); 
			  } 
			}

			function viewImage(img){ 
			 W=img1.width; 
			 H=img1.height;
			 var popupX = (window.screen.width / 2)-(200 / 2);
			 var popupY= (window.screen.height /2)-(300 / 2);
			 O="width="+W+",height="+H+",left="+popupX+", top="+popupY+",scrollbars=yes"; 
			 imgWin=window.open("","",O); 
			 imgWin.document.write("<html><head><title>    이미지상세보기    </title></head>");
			 imgWin.document.write("<body topmargin=0 leftmargin=0>");
			 imgWin.document.write("<img src="+img+" onclick='self.close()' style='cursor:pointer;' title ='클릭하시면 창이 닫힙니다.'>");
			 imgWin.document.close();
			}
		</script>
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
        
        <%
        pageContext.setAttribute("cr", "\r");
        pageContext.setAttribute("cn", "\n");
        pageContext.setAttribute("crcn", "\r\n");
        pageContext.setAttribute("sp", "&nbsp;");
        pageContext.setAttribute("br", "<br/>");
        %>
        
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
           
            <div class="container" style=" border-bottom: 1px solid #CCCCCC; padding-left: 0px; padding-right: 0px;">
           
           <div class="container" style=" border-bottom: 1px solid; padding-left:0px; padding-right:0px; 
               border-bottom-color: #e04f5f">
                
              <div class="col-sm-9" style="width: 100%; padding-left: 14px; padding-right:14px; ">
                  <h1 style="padding: 5px; margin-bottom: 20px;">
                      <a href="" style="color: black;">1:1문의-고객</a>
                  </h1>

              </div>
            </div>
            <div style="padding-left: 40px; padding-right: 40px;">
            	<c:set var="titles" value="${fn:replace(bean.title, crcn,br) }"/>
				<c:set var="titles" value="${fn:replace(titles,cr,br) }"/>
                <c:set var="titles" value="${fn:replace(titles,cn,br) }"/>
                <c:set var="titles" value="${fn:replace(titles,' ',sp) }"/>
                <header style="padding-top: 15px"><h4><b><c:out value="${titles }" escapeXml="false"/></b></h4></header>
                <div>
                   <section style="width: 100%; padding-bottom: 30px">
                   <article>     
                    <tr>
                        <td>
                        	<c:choose>
                        	<c:when test="${id eq '해당 없음'}">
								    <b>예약내역 : <span>[해당 없음:(기타)]  </span></b>
                        	</c:when>
                        	<c:otherwise>
                        		<c:forEach var="beans" items="${beans }">
								    <b>예약내역 : <span>주소:[${road }-${jibun }] - 상호명: ${beans.branchname } </span></b>
    		                    </c:forEach>
                        	</c:otherwise>
                        	</c:choose>
                        </td>
                    </tr>
                    <br>
                    <tr>
                        <td>${bean.calendar }</td>
                        <td>&nbsp;|&nbsp;</td>
                        <td>작성자 : ${bean.writer }</td>
                    </tr>  
                   </article>
                   </section>
                    <div style="padding-bottom: 30px">
                    	<c:set var="cmt" value="${fn:replace(bean.content, crcn,br) }"/>
                    	<c:set var="cmt" value="${fn:replace(cmt,cr,br) }"/>
                    	<c:set var="cmt" value="${fn:replace(cmt,cn,br) }"/>
                    	<c:set var="cmt" value="${fn:replace(cmt,' ',sp) }"/>
                    	
                    	<c:out value="${cmt }" escapeXml="false"/>
                    
                    </div>
                    
                    <c:forEach items="${subImages }" var="subImage" begin="0" end="0">
                    <c:choose>
					<c:when test="${subImage.imageName eq '0'}">
					<div><h4><b>첨부 파일이 없습니다. </b></h4></div>
					</c:when>
					
                    <c:when test="${subImage.imageName ne '0' }">
                    <div><h4><b>첨부 파일 : 크게 보시려면 확대하세요 </b></h4></div>
                    <div>
                    <c:forEach items="${subImages }" var="subImage">
						<div>
							<img src="../resources/c_counsel_imgs/${subImage.imageName }"
								style="width: 10%; cursor:pointer;" data-src="" id="image" 
								onclick="doImgPop('../resources/c_counsel_imgs/${subImage.imageName }')">
						</div>
					</c:forEach>
                    
                    </div>
                    </c:when>
                    </c:choose>
                    </c:forEach>
                </div>
            </div>
            <div style="border-top: 1px solid #ccc; padding-bottom: 5px"></div>
            <!-- 답변 영역 -->
            <c:choose>
			  <c:when test = "${bean.comment ne null}">
            	<div style="padding-bottom: 50px;">
                <table style="width: 100%"> 
                    <td class="answerA" style="text-align: center;">
                        <h2 style="color: #e04f5f">A</h2>
                    </td>
                    <td style="width:auto">
                        <div>
                            <section>
                                <header style="padding-bottom: 30px;">
                                    <span style="color:#e04f5f"><h3 style="margin-top: 45px;"><b>답변</b></h3></span>
                                    <b>[고객센터에서 답변드립니다.]</b>
                                </header>
                                <article style="width: auto; height: auto; padding-bottom: 40px;">
                                    <c:set var="comments" value="${fn:replace(bean.comment, crcn,br) }"/>
			                    	<c:set var="comments" value="${fn:replace(comments,cr,br) }"/>
			                    	<c:set var="comments" value="${fn:replace(comments,cn,br) }"/>
			                    	<c:set var="comments" value="${fn:replace(comments,' ',sp) }"/>
			                    	
			                    	<b><c:out value="${comments }" escapeXml="false"/></b>
                                    
                                    
                                </article>
                                <footer>
                                    <ul>
                                        <li style="margin-bottom: 15px">추가로 필요한 내용이 있으시면 언제든지 
                                        고객센터로(1588-4763)<br>
                                        또는, 1:1문의를 통해 요청해 주시면
                                        감사하겠습니다.
                                        </li>
                                        <li>문의를 통해 제공된 내용은 모두 저장이 됨을 알려드립니다.</li>
                                        
                                    </ul>
                                    
                                </footer>
                            </section>
                        </div>
                    </td>
                </table>   
            </div>
            <div style="padding-bottom: 5px"></div> 
			</c:when>
			<c:when test = "${bean.comment eq null }">
				<div style="text-align: center"><h4><b>답변이 등록되어 있지 않습니다....</b></h4></div>
            <div style="padding-bottom: 5px"></div> 
			</c:when>
			</c:choose>
            
            </div>      
            <div class="container" style="margin-top: 10px;">
              
                <div class="huge-top">
                    <button class="btn btn-normal pull-right" style="margin-bottom: 10px;" onclick="history.back(1)"  >
                       <span>목록으로</span>
                    </button>
                    
                </div>
                
            </div>

    </body>
</html>
