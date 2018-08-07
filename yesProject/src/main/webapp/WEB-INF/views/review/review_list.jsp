<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!Doctype html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<!-- <link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon|Jua|Nanum+Gothic"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
 <script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>  -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style>
* {
	font-family: 'Nanum Gothic', sans-serif;
}

nav a {
	font-family: 'Jua', sans-serif;
}

.searchMenu {
	font-family: 'Do Hyeon', sans-serif;
	font-size: 30px;
}

@media ( min-width : 1095px) { /*사이즈 클 때*/
	.container-fluid {
		background-color: #e04f5f;
		height: 120px;
	}
	.navbar-collapse {
		padding-top: 40px;
		padding-left: 360px;
		font-size: 20px;
	}
	li>a {
		color: white;
		margin-right: 50px;
		font-size: 30px;
	}
	.menuBtnToggle {
		color: white;
		font-size: 30px;
	}
	.navbar-right>li>a {
		font-size: 20px;
		margin-right: 0px;
		color: white;
	}
	#bs-example-navbar-collapse-1 a {
		text-decoration: none;
		text-decoration-color: white;
		color: white;
	}
	#dropdown a {
		color: black;
		font-size: 16px;
	}
	.dropdown-toggle:hover {
		color: black;
	}
	#menu a {
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

@media ( max-width : 1110px) { /*사이즈 작을 때*/
	li>a {
		font-size: 20px;
	}
	.navbar-header {
		float: none;
	}
	.navbar-left, .navbar-right {
		float: none !important;
	}
	.navbar-toggle {
		display: block;
	}
	.navbar-collapse {
		border-top: 1px solid transparent;
		box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.1);
		margin-top: 70px;
		float: left;
	}
	.navbar-fixed-top {
		top: 0;
		border-width: 0 0 1px;
	}
	.navbar-collapse.collapse {
		display: none !important;
	}
	.navbar-nav {
		float: none !important;
		margin-top: 7.5px;
	}
	.navbar-nav>li {
		float: none;
	}
	.navbar-nav>li>a {
		padding-top: 10px;
		padding-bottom: 10px;
	}
	.collapse.in {
		display: block !important;
	}
	.container-fluid {
		background-color: #e04f5f;
		height: 120px;
	}
	.navbar-collapse a {
		text-decoration: none;
		color: black;
	}
	#dropdown a {
		font-size: 15px;
	}
	#bs-example-navbar-collapse-1 {
		width: 100%;
	}
	#bs-example-navbar-collapse-1 a {
		display: block;
		clear: both;
	}
	#bs-example-navbar-collapse-1>ul>li {
		display: block;
		clear: both;
	}
	#menu a {
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
<body style="overflow-y:auto;">
<jsp:include page="../layout/header.jsp"></jsp:include>
	<br />
	<form class="form-inline" role="form" method="post" action="review_search">
		검색분류
			<select class="form-control" name="category">			
				<option value="total">전체</option>
				<option value="location">지역</option>
				<option value="store">가게명</option>
				<option value="menu">음식</option>
			</select>
		<br/>
		<br/>		
		<br /> 검색
		<div class="form-group">
			<label class="sr-only" for="exampleInputEmail2">키워드검색 </label> <input
				type="text" class="form-control" id="exampleInputEmail2" name="keyword"
				placeholder="키워드검색">
		</div>
		<button type="submit" class="btn btn-default">검색</button>
	</form>
	
	<br />
	<br />
	<br />
	<table class="table table-hover" id="table">
	<%--	<c:forEach items="${alist }" var="bean">
    			<tr>
    				<td>${bean.branchID }</td>
    				<td>${bean.clientID }</td>
    				<td>${bean.index }</td>
    				<td>${bean.title }</td>
    			</tr> 
    		</c:forEach> --%>
		<thead>
			<tr>
				<th class="text-center" style="cursor: pointer;">글번호</th>
				<th class="text-center" style="cursor: pointer;">대표이미지</th>
				<th class="text-center" style="cursor: pointer;">제목</th>
				<th class="text-center" style="cursor: pointer;">작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="bean" items="${page}" varStatus="status">
				<tr>
					<td class="text-center" style="cursor: pointer;"
						onClick=" location.href='review_list/${bean.idx }' ">${bean.idx}</td>
					<td class="text-center" style="cursor: pointer;"
						onClick=" location.href='review_list/${bean.idx }' "><img
						src="${pageContext.request.contextPath}/review_imgs/${imageList[status.index].imageName }" id="image" /></td>
					<td class="text-center" style="cursor: pointer;"
						onClick=" location.href='review_list/${bean.idx }' ">${bean.title}</td>
					<td class="text-center" style="cursor: pointer;"
						onClick=" location.href='review_list/${bean.idx }' ">
						${bean.calendar}</td>
				</tr>
			</c:forEach>

			<%-- <c:forEach items="${alist }" var="bean" varStatus="status">
  <tr>
      <td><a href="../review_detail?index=${bean.index }"><img src="imgs/food1.jpg" id="image"/> ${bean.title}  </a></td>
	  <td>${bean.idx }</td>
       <td><a href="review_list/${bean.idx }"><img src="review_imgs/m_9ec1ba31-7cfa-45cb-b4de-274b3bdc5a34clusterer.png" id="image"/></a></td>

<!-- 프로젝트 경로로 바꿔서 이미지 제대로 나오도록 하기  -->
     <td><a href="review_list/${bean.idx }"><img src="review_imgs/${imageList[status.index].imageName }" id="image"/></td>
      <td><a href="review_list/${bean.idx }"> ${bean.title}  </a></td>
      <td>${bean.calendar }</td>

  </tr>
</c:forEach> --%>
		</tbody>
	</table>

	<br />
	<c:if test="${member != null }">
	<a class="btn btn-default" href="./review_write" role="button" style="display: none;">글쓰기</a>
	</c:if>
	<br />

	<!-- paging  -->
	<c:choose>
		<c:when
			test="${paging.numberOfRecords ne NULL and paging.numberOfRecords ne '' and paging.numberOfRecords ne 0}">
			<div id="paginationUI" class="text-center" style="margin-left: 37px">
				<ul class="pagination pagination-lg">
					<c:if test="${paging.currentPageNo gt 5}">
						<!-- 현재 페이지가 5보다 크다면(즉, 6페이지 이상이라면) -->
						<li><a
							href="javascript:goPage(${paging.prevPageNo}, ${paging.maxPost})">이전</a></li>
						<!-- 이전페이지 표시 -->
					</c:if>
					<!-- 다른 페이지를 클릭하였을 시, 그 페이지의 내용 및 하단의 페이징 버튼을 생성하는 조건문-->
					<c:forEach var="i" begin="${paging.startPageNo}"
						end="${paging.endPageNo}" step="1">
						<c:choose>
							<c:when test="${i eq paging.currentPageNo}">
								<li class="active"><a
									href="javascript:goPage(${i}, ${paging.maxPost})">${i}</a></li>
								<!-- 1페이지부터 10개씩 뽑아내고, 1,2,3페이지순으로 나타내라-->
							</c:when>
							<c:otherwise>
								<li><a href="javascript:goPage(${i}, ${paging.maxPost})">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<!-- 소수점 제거 =>-->
					<fmt:parseNumber var="currentPage" integerOnly="true"
						value="${(paging.currentPageNo-1)/5}" />
					<fmt:parseNumber var="finalPage" integerOnly="true"
						value="${(paging.finalPageNo-1)/5}" />

					<c:if test="${currentPage < finalPage}">
						<!-- 현재 페이지가 마지막 페이지보다 작으면 '다음'을 표시한다. -->
						<li><a
							href="javascript:goPage(${paging.nextPageNo}, ${paging.maxPost})">다음</a></li>
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
</body>
</html>