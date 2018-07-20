<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            }
            .pagination>.active>a, .pagination>.active>a:hover, .pagination>.active>a:visited, .pagination>.active>a:link{
            background-color: #e04f5f;
            border-color: #e04f5f;
            color: white;
            }
            
            a:hover,a:link,a:visited{
    	    	text-decoration: none; color:black;

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
           
           
           <div class="container" style=" border: 1px solid #CCCCCC; padding-left:0px; padding-right:0px; 
               border-bottom-color: #e04f5f">
                
              <div class="col-sm-9" style="width: 100%; padding-left: 14px; padding-right:14px; ">
                  <h1 style="padding: 5px; margin-bottom: 20px;">나의 문의내역(고객)</h1>
                <div class="row" >
                  <div id="cube" class="col-xs-6 col-sm-4" style=" border-top: 1px solid darkgray; cursor: pointer;" 
                     onclick="location.href='../yesnotice/'">
                      <h4>
                          <p class="text-center" style="padding-top: 5px;padding-bottom: 5px;">
                              공지사항
                          </p>
                      </h4>
                  </div>
                  <div id="cube" class="col-xs-6 col-sm-4" style=" 
                     border-top:1px solid darkgray; border-right:1px solid darkgray; border-left:1px solid darkgray;  
                       color:white; background-color: #e04f5f; cursor: pointer;" 
                       onclick="location.href='../yesC_cs/'">                                          
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
            
            <div class="container" style="margin-top: 10px;">
               <ul>
                   <li>가맹점 정보, 해당 가맹점 문의, 가맹점 불만 등의 문의는 전화문의를 통해 해당 파트너사에 직접 문의시 빠른 처리가 가능합니다.</li>
                   <li>전화번호, 주소, 이메일, 계좌번호 등의 개인정보는 타인에 의해 도용될 위험이 있으니, 문의 시 입력하지 않도록 주의해 주시기 바랍니다.</li>
               </ul>
                <table class="table table-board table table-hover" style="border-top: 1px solid #e04f5f;border-bottom: 2px solid #ddd">
                    <colgroup>
                        <col width="15%">
                        <col width="*">
                        <col width="15%">
                        <col width="15%">
                    </colgroup>
                    <thead>
                        <tr>
                            <th style="text-align: center">글 번호</th>
                            <th style="text-align: center">제목</th>
                            <th style="text-align: center">글쓴이</th>
                            <th style="text-align: center">날짜</th>
                        </tr>
                    </thead>    
                        <c:forEach var="bean" items="${page}">
						<c:set var="titles" value="${fn:replace(bean.title, crcn,br) }"/>
						<c:set var="titles" value="${fn:replace(titles,cr,br) }"/>
                		<c:set var="titles" value="${fn:replace(titles,cn,br) }"/>
               			<c:set var="titles" value="${fn:replace(titles,' ',sp) }"/>
						<tr>
							<td class="text-center" style = "cursor:pointer;" onClick = " location.href='./${bean.index }' ">
							${bean.index}</td>
							<td class="text-center" style = "cursor:pointer;" onClick = " location.href='./${bean.index }' ">
							<c:out value="${titles }" escapeXml="false"/></td>
							<td class="text-center" style = "cursor:pointer;" onClick = " location.href='./${bean.index }' ">
							${bean.writer}</td>
							<td class="text-center" style = "cursor:pointer;" onClick = " location.href='./${bean.index }' ">
							${bean.calendar}</td>
						</tr>
		
					</c:forEach>
                        


                </table>
                <div class="huge-top" width="100%">
                <a href="./yesC_csInsert">
                    <button class="btn btn-normal pull-right" id="counsel">
                       <span>
                            문의하기
                       </span>
                    </button> 
                </a>
                </div>
                
                <c:choose>
		<c:when test="${paging.numberOfRecords ne NULL and paging.numberOfRecords ne '' and paging.numberOfRecords ne 0}">
		<div id="paginationUI" class="text-center" style="margin-left: 37px">
			<ul class="pagination pagination-lg">
				<c:if test="${paging.currentPageNo gt 5}">  											  <!-- 현재 페이지가 5보다 크다면(즉, 6페이지 이상이라면) -->
					<li><a href="javascript:goPage(${paging.prevPageNo}, ${paging.maxPost})">이전</a></li> <!-- 이전페이지 표시 -->
				</c:if>
				<!-- 다른 페이지를 클릭하였을 시, 그 페이지의 내용 및 하단의 페이징 버튼을 생성하는 조건문-->
					<c:forEach var="i" begin="${paging.startPageNo}" end="${paging.endPageNo}" step="1"> 
		            <c:choose>
		                <c:when test="${i eq paging.currentPageNo}"> 
		                      <li class="active"><a href="javascript:goPage(${i}, ${paging.maxPost})">${i}</a></li> <!-- 1페이지부터 10개씩 뽑아내고, 1,2,3페이지순으로 나타내라-->
		                </c:when>
		                	<c:otherwise>
		                    <li><a href="javascript:goPage(${i}, ${paging.maxPost})">${i}</a></li> 
							</c:otherwise>
					</c:choose>
					</c:forEach>
			
				<!-- 소수점 제거 =>-->
				<fmt:parseNumber var="currentPage" integerOnly="true" value="${(paging.currentPageNo-1)/5}"/>
				<fmt:parseNumber var="finalPage" integerOnly="true" value="${(paging.finalPageNo-1)/5}"/>
					
				<c:if test="${currentPage < finalPage}"> <!-- 현재 페이지가 마지막 페이지보다 작으면 '다음'을 표시한다. -->
					<li><a href="javascript:goPage(${paging.nextPageNo}, ${paging.maxPost})">다음</a></li>
				</c:if> 
			</ul>
		</div>
		</c:when>
		</c:choose>

<script>
function goPage(pages, lines) {
    location.href = '?' + "pages=" + pages;
}
</script> 
                
            <div class="text-center">
                
            <div class="col-lg-4" style="float: none;margin: auto; width: 373px;">
                <div class="input-group">
                  <input type="text" class="form-control" placeholder="검색어를 입력하세요">
                  <span class="input-group-btn">
                    <button class="btn btn-default" type="button" style="color: #e04f5f">
                    <span class="glyphicon glyphicon-search">
                    </span>
                    </button>
                  </span>
                </div><!-- /input-group -->
            </div><!-- /.col-lg-6 -->
            </div>
            </div>      
      
                


   

    </body>
</html>