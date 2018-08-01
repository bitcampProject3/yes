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

	<script type="text/javascript">
	function visit(select){
	        var url = select.options[select.selectedIndex].getAttribute('value');
	        if(url) location.href = url;
	}
	</script>

	<script type="text/javascript">
		function content_view(id){
		var userID= id;
		var form = document.createElement("form");
		form.setAttribute("method", "post");
		window.name = "/yes/admin/userList";
		form.target = "/yes/admin/userList";
		form.setAttribute("action", "/yes/admin/AllListDetail");
		 
		var Field = document.createElement("input");
		Field.setAttribute("type", "hidden");
		Field.setAttribute("name", "userID");
		Field.setAttribute("value", userID);
		var Listchoice = document.createElement("input");
		Listchoice.setAttribute("type", "hidden");
		Listchoice.setAttribute("name", "choice");
		Listchoice.setAttribute("value", "userList");
		
		form.appendChild(Field);
		form.appendChild(Listchoice); 
		 
		document.body.appendChild(form);
		form.submit();
			
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
            @media (max-width: 1190px) {
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
            
            .ui-datepicker select.ui-datepicker-month {
                width: auto;
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
                        <li><a href="/yes/yesnotice/">공지사항</a></li>

                      </ul>
                    </li>
                  </ul>
                  <ul class="nav navbar-nav navbar-right">
                    <li><a href="#">로그인</a></li>
                    <li><a href="#">회원가입</a></li>
                    <li><a href="/yes/admin/">관리자</a></li>
                  </ul>
                </div><!-- /.navbar-collapse -->
              </div><!-- /.container-fluid -->
            </nav>
            </div>
            
            <div class="container" style="margin-top: 10px;">
             <div><h2>회원 리스트</h2>
             <div style=" height:30px;">
             <select onchange="visit(this)" style="float:left;">
             	<option value="" disabled selected>이동할 리스트를 선택해주세요</option>
			    <option value="/yes/admin/userAllList"><b>&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;모든 회원 리스트</b></option> <!-- 상대경로 -->
			    <option value="/yes/admin/userList"><b>&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;고객 리스트</b></option> <!-- 상대경로 -->
			    <option value="/yes/admin/branchList"><b>&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;사업자 리스트</b></option> <!-- 상대경로 -->
			    <option><b>이동 없음</b></option>
			</select>
            </div> 
             </div>
             
         
                <div class="row" style="margin-right:0px; margin-left:0px; " >
                  <div id="cube" class="col-xs-6 col-sm-4" style=" border-top: 1px solid darkgray; cursor: pointer; border-left:1px solid darkgray;" 
                     onclick="location.href='./userAllList'">                                        
                      <h4>
                          <p class="text-center" style="padding-top: 5px; padding-bottom: 5px;">
                              모든 회원 리스트
                          </p>
                      </h4>
                  </div>
                <div id="cube" class="col-xs-6 col-sm-4" style=" 
                     border-top:1px solid darkgray; border-left:1px solid darkgray;  
                       color:white; background-color: #e04f5f; cursor: pointer;" 
                       onclick="location.href='./userList'">  
                      <h4>
                          <p class="text-center" style="padding-top: 5px;padding-bottom: 5px;">
                              고객 리스트
                          </p>
                      </h4>
                  </div>
                   <div id="cube" class="col-xs-6 col-sm-4" style=" border-top: 1px solid darkgray;
                     cursor: pointer;border-left:1px solid darkgray;border-right:1px solid darkgray;" 
                     onclick="location.href='./branchList'">
                      <h4>
                          <p class="text-center" style="padding-top: 5px;padding-bottom: 5px;">
                              사업자 리스트
                          </p>
                      </h4>
                  </div>
                </div>
					
                <table class="table table-board table table-hover" style="border-top: 1px solid #e04f5f;border-bottom: 2px solid #ddd">
                    <colgroup>
                        <col width="15%">
                        <col width="*">
                        <col width="15%">
                        <col width="15%">
                    </colgroup>
                    <thead>
                        <tr>
                        	<th style="text-align:center">이름</th>
                            <th style="text-align: center">닉네임</th>
                            <th style="text-align: center">이메일</th>
                            <th style="text-align: center">생년월일</th>
                        </tr>
                    </thead> 
                    
                        <c:forEach var="bean" items="${page}">
						<c:set var="nicknames" value="${fn:replace(bean.nickname, crcn,br) }"/>
						<c:set var="nicknames" value="${fn:replace(nicknames,cr,br) }"/>
                		<c:set var="nicknames" value="${fn:replace(nicknames,cn,br) }"/>
               			<c:set var="nicknames" value="${fn:replace(nicknames,' ',sp) }"/>
						<tr>
							
							<td class="text-center" style = "cursor:pointer;" onclick="javascript:content_view('${bean.id}')">
							${bean.name}
							<input type="hidden" id="userID" name="userID" value="${bean.id }">
							</td>
							<td class="text-center" style = "cursor:pointer;" onclick="javascript:content_view('${bean.id}')">
							<c:out value="${nicknames }" escapeXml="false"/>
							</td>
							<td class="text-center" style = "cursor:pointer;" onclick="javascript:content_view('${bean.id}')">
							${bean.email}
							</td>
							<td class="text-center" style = "cursor:pointer;" onclick="javascript:content_view('${bean.id}')">
							${bean.birthDate}
							</td>
						</tr>
						
						</c:forEach>
                </table>

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
				location.href = '?' + "userPages=" + pages;
			}
		</script>
		<div class="text-center" style="display:block;">
			<div
				style="float: none; margin: auto; width: 420px;">
				<form method="post" action="/yes/admin/user_search">
				<div style="padding-left:0px;padding-right:0px;float:left;width:22%">
					<select class="form-control" name="category">
						<option value="total">전체</option>
						<option value="name">이름</option>
						<option value="nickname">닉네임</option>
						<option value="email">이메일</option>
					</select> 
				</div>
				<div style="padding-left:0px;padding-right:0px;float:left;width:58%">
					<input type="text" name="keyword" class="form-control" placeholder="검색어를 입력하세요">
				</div>
				<div>
					<span class="input-group-btn" style="float:left;">
						<button class="btn btn-default" type="submit"
							style="color: #e04f5f;width:auto;padding-bottom:9px; padding-top:9px;">
							<span class="glyphicon glyphicon-search"> </span>
						</button>
					</span>
				</div>	
				</form>
				<!-- /input-group -->
			</div>
			<!-- /.col-lg-6 -->
		</div>

	</div>   
               
    </body>
</html>