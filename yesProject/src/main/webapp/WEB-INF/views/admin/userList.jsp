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
                /*���ȭ�� �޴� ����*/
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
                    <li><a href="#" class="menuBtn">����<span class="sr-only"></span></a></li>
                    <li><a href="#" class="menuBtn">����� ����</a></li>
                    <li class="dropdown">
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">��������<span class="caret"></span></a>
                      <ul class="dropdown-menu" id="dropdown">
                        <li><a href="../yesnotice/">��������</a></li>

                      </ul>
                    </li>
                  </ul>
                  <ul class="nav navbar-nav navbar-right">
                    <li><a href="#">�α���</a></li>
                    <li><a href="#">ȸ������</a></li>
                    <li><a href="../admin/">������</a></li>
                  </ul>
                </div><!-- /.navbar-collapse -->
              </div><!-- /.container-fluid -->
            </nav>
            </div>
            
            <div class="container" style="margin-top: 10px;">
             <div><h2>ȸ�� ����Ʈ</h2>
             <div style=" height:30px;">
             <select onchange="visit(this)" style="float:left;">
             	<option value="" disabled selected>�̵��� ����Ʈ�� �������ּ���</option>
			    <option value="./userAllList"><b>&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;��� ȸ�� ����Ʈ</b></option> <!-- ����� -->
			    <option value="./userList"><b>&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;���� ����Ʈ</b></option> <!-- ����� -->
			    <option value="./branchList"><b>&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;����� ����Ʈ</b></option> <!-- ����� -->
			    <option><b>�̵� ����</b></option>
			</select>
            </div> 
             </div>
             
         
                <div class="row" style="margin-right:0px; margin-left:0px; " >
                  <div id="cube" class="col-xs-6 col-sm-4" style=" border-top: 1px solid darkgray; cursor: pointer; border-left:1px solid darkgray;" 
                     onclick="location.href='./userAllList'">                                        
                      <h4>
                          <p class="text-center" style="padding-top: 5px; padding-bottom: 5px;">
                              ��� ȸ�� ����Ʈ
                          </p>
                      </h4>
                  </div>
                <div id="cube" class="col-xs-6 col-sm-4" style=" 
                     border-top:1px solid darkgray; border-left:1px solid darkgray;  
                       color:white; background-color: #e04f5f; cursor: pointer;" 
                       onclick="location.href='./userList'">  
                      <h4>
                          <p class="text-center" style="padding-top: 5px;padding-bottom: 5px;">
                              ���� ����Ʈ
                          </p>
                      </h4>
                  </div>
                   <div id="cube" class="col-xs-6 col-sm-4" style=" border-top: 1px solid darkgray;
                     cursor: pointer;border-left:1px solid darkgray;border-right:1px solid darkgray;" 
                     onclick="location.href='./branchList'">
                      <h4>
                          <p class="text-center" style="padding-top: 5px;padding-bottom: 5px;">
                              ����� ����Ʈ
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
                        	<th style="text-align:center">�̸�</th>
                            <th style="text-align: center">�г���</th>
                            <th style="text-align: center">�̸���</th>
                            <th style="text-align: center">�������</th>
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
				<c:if test="${paging.currentPageNo gt 5}">  											  <!-- ���� �������� 5���� ũ�ٸ�(��, 6������ �̻��̶��) -->
					<li><a href="javascript:goPage(${paging.prevPageNo}, ${paging.maxPost})">����</a></li> <!-- ���������� ǥ�� -->
				</c:if>
				<!-- �ٸ� �������� Ŭ���Ͽ��� ��, �� �������� ���� �� �ϴ��� ����¡ ��ư�� �����ϴ� ���ǹ�-->
					<c:forEach var="i" begin="${paging.startPageNo}" end="${paging.endPageNo}" step="1"> 
		            <c:choose>
		                <c:when test="${i eq paging.currentPageNo}"> 
		                      <li class="active"><a href="javascript:goPage(${i}, ${paging.maxPost})">${i}</a></li> <!-- 1���������� 10���� �̾Ƴ���, 1,2,3������������ ��Ÿ����-->
		                </c:when>
		                	<c:otherwise>
		                    <li><a href="javascript:goPage(${i}, ${paging.maxPost})">${i}</a></li> 
							</c:otherwise>
					</c:choose>
					</c:forEach>
			
				<!-- �Ҽ��� ���� =>-->
				<fmt:parseNumber var="currentPage" integerOnly="true" value="${(paging.currentPageNo-1)/5}"/>
				<fmt:parseNumber var="finalPage" integerOnly="true" value="${(paging.finalPageNo-1)/5}"/>
					
				<c:if test="${currentPage < finalPage}"> <!-- ���� �������� ������ ���������� ������ '����'�� ǥ���Ѵ�. -->
					<li><a href="javascript:goPage(${paging.nextPageNo}, ${paging.maxPost})">����</a></li>
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
			<div class="col-lg-4"
				style="float: none; margin: auto; width: 373px;">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="�˻�� �Է��ϼ���">
					<span class="input-group-btn">
						<button class="btn btn-default" type="button"
							style="color: #e04f5f">
							<span class="glyphicon glyphicon-search"> </span>
						</button>
					</span>
				</div>
				<!-- /input-group -->
			</div>
			<!-- /.col-lg-6 -->
		</div>


	</div>   
               
    </body>
</html>