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
		function content_view(id){
		var userID= id;
		var form = document.createElement("form");
		form.setAttribute("method", "post");
		window.name = "/yes/admin/management";
		form.target = "/yes/admin/management";
		form.setAttribute("action", "/yes/admin/managedetail");
		 
		var Field = document.createElement("input");
		Field.setAttribute("type", "hidden");
		Field.setAttribute("name", "userID");
		Field.setAttribute("value", userID);

		form.appendChild(Field);
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
		<jsp:include page="../layout/header.jsp"></jsp:include>
            
            
            <div class="container"> 
            
              <div class="col-sm-9" style="width: 100%; padding-left: 14px; padding-right:14px;border-top:1px solid #cccccc;border-left:1px solid #cccccc;border-right:1px solid #cccccc; ">
	                  <h1 style="padding: 5px; margin-bottom: 20px;">���� ����(������)</h1>
	                <div class="row" >
	                  <div id="cube" class="col-xs-6 col-sm-6" style=" border-top: 1px solid darkgray; background-color: #e04f5f;
	                    color: white; cursor: pointer;" onclick="location.href='./management'">
	                      <h4>
	                          <p class="text-center" style="padding-top: 5px;padding-bottom: 5px;">
	                              ���� ��� �� �̵��
	                          </p>
	                      </h4>
	                  </div>
	                  <div id="cube" class="col-xs-6 col-sm-6" style=" 
	                     border-top:1px solid darkgray; border-right:1px solid darkgray; border-left:1px solid darkgray;
	                        cursor: pointer;" onclick="location.href='./managementdel'">                                          
	                      <h4>
	                          <p class="text-center" style="padding-top: 5px;padding-bottom: 5px;">
	                              ���� ����
	                          </p>
	                      </h4>
	                  </div>
	                </div>
	              </div>

            
           
                <table class="table table-board table table-hover" style="border-top: 1px solid #e04f5f;border-bottom: 2px solid #ddd;">
                    <colgroup>
                        <col width="15%">
                        <col width="*">
                        <col width="15%">
                        <col width="15%">
                    </colgroup>
                    <thead>
                        <tr>
                        	<th style="text-align:center">��ȣ��</th>
                            <th style="text-align: center">�ּ�</th>
                            <th style="text-align: center">�з�</th>
                            <th style="text-align: center">��ϻ���</th>
                        </tr>
                    </thead> 
                    
                        <c:forEach var="bean" items="${page}" varStatus="status">
						<tr>			
							<td class="text-center" style = "cursor:pointer;" onclick="javascript:content_view('${bean.id}')">
							${bean.branchname}
							</td>
							<td class="text-center" style = "cursor:pointer;" onclick="javascript:content_view('${bean.id}')">
							�ּ�:[<b>(${zonecode[status.index] })</b>${road[status.index] }(${jibun[status.index] }), ${detailaddress[status.index]}]
							</td>
							<td class="text-center" style = "cursor:pointer;" onclick="javascript:content_view('${bean.id}')">
							${bean.category }
							</td>
							<c:choose>
							<c:when test="${bean.acceptState eq '0' }">
								<td class="text-center" style = "cursor:pointer;" onclick="javascript:content_view('${bean.id}')">
								�̵��
								</td>
							</c:when>
							</c:choose>
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
	</div> 
	  
               
    </body>
</html>