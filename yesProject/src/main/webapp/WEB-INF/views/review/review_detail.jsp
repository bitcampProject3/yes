<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<link
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
<link rel="stylesheet" href="./css/selectDesign.css">
<link rel="stylesheet" href="./css/mapStyle.css">
<link rel="stylesheet" href="./css/mainStyle.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
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

@media ( min-width : 1095px) {
	.container-fluid {
		background-color: #e04f5f;
		height: 120px;
	}
	.navbar-collapse {
		padding-top: 40px;
		padding-left: 360px;
		font-size: 2s0px;
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

	/*추가한 코드*/
	#frame {
		width: 800px;
		margin-left: auto;
		margin-right: auto;
	}
	#content {
		height: 300px;
		width: 500px;
	}
	#detail_imgs {
		height: 400px;
		width: 250px;
	}
}

@media ( max-width : 1110px) {
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
	#detail_imgs {
		height: 250px;
		width: 250px;
	}

	/* 추가한 코드 */

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

<script type="text/javascript">
	
	function clickLike(){
		
	    $.ajax({
	        type:'POST',
	        url : "<c:url value='clickLike'/>",
	        data:$("#likeClickForm").serialize(),
	        success : function(data){
	            if(data=="success")
	            {
	            	getLikeCount();
/* 	                $("#comment").val(""); */
	            }
	        },
	        error:function(request,status,error){
	            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       }
	    });
	}
	
	
	/**
	 * 초기 페이지 로딩시 댓글 불러오기
	 */
	$(function(){
	    
	    getLikeCount();
	    
	});
	 
	/**
	 * 댓글 불러오기(Ajax)
	 */
	function getLikeCount(){
	    
	    $.ajax({
	        type:'GET',
	        url : "<c:url value='reviewLike'/>",
	        dataType : "json",
	        data:$("#likeCntForm").serialize(),
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	        success : function(data){
	            
	            var likeCntHtml = "";
	            var likeClickHtml = "";
	            
	            
	            
	            if(data.length > 0){
	            	if(data[0].checked){
		            	likeCntHtml += "<h1>"+data[0].likeCount+"</h1>";
		            	likeClickHtml += "<a href='#' onClick='clickLike()' class='btn pull-right btn-success'>좋아요 취소</a>";		            	
		            	likeClickHtml += "<input type='hidden' id='review_idx' name='review_idx' value='${bean.idx}' />";
		            	likeClickHtml += "<input type='hidden' id='checked' name='checked' value='false' />";
		            	likeClickHtml += "<input type='hidden' id='writer' name='writer' value='jaeseon3' />"; // session으로 value 변경해야됨
	            	}
	            	else {
		            	likeCntHtml += "<h1>"+data[0].likeCount+"</h1>";
		            	likeClickHtml += "<a href='#' onClick='clickLike()' class='btn pull-right btn-success'>좋아요</a>";		            	
		            	likeClickHtml += "<input type='hidden' id='review_idx' name='review_idx' value='${bean.idx}' />";
		            	likeClickHtml += "<input type='hidden' id='checked' name='checked' value='true' />";
		            	likeClickHtml += "<input type='hidden' id='writer' name='writer' value='jaeseon3' />"; // session으로 value 변경해야됨
	            	}
	            } else {
	            	likeCntHtml += "<h1>data없음</h1>";
	            	lickClickHtml += "<a href='#' onClick='clickLike()' class='btn pull-right btn-success'>좋아요</a>";
	            	likeClickHtml += "<input type='hidden' id='review_idx' name='review_idx' value='${bean.idx}' />";
	            	likeClickHtml += "<input type='hidden' id='checked' name='checked' value='true' />";
	            	likeClickHtml += "<input type='hidden' id='writer' name='writer' value='jaeseon3' />"; // session으로 value 변경해야됨
	            }
	            
	            $("#likeCnt").html(likeCntHtml);
	            $("#likeClick").html(likeClickHtml);
	        },
	        error:function(request,status,error){
	        	
	       }
	    });
	}
	</script>
<body style="overflow-y:auto;">
<jsp:include page="../layout/header.jsp"/>
		  <div class="container" style=" border-bottom: 1px solid #CCCCCC; padding-left:0px; padding-right:0px; 
               border-bottom-color: #e04f5f; margin-top:30px;">
                
              <div class="col-sm-9" style="width: 100%; padding-left: 14px; padding-right:14px;  ">
                  <h1 style="padding: 5px; margin-bottom: 20px; ">
                      <a href="#" style="color: black;">리뷰 보기</a>
                  </h1>

              </div>
            </div>
	<form method="POST" style="text-align:right;">
		<a class="btn btn-default" href="javascript:history.back();" role="button">뒤로</a>
		<button type="submit" class="btn btn-default">삭제</button>
		<a class="btn btn-default" href="../review_edit/${bean.idx }"
			role="button">수정</a>
	</form>
	<table class="table" id="frame">
		<tr>
			<th>글번호</th>
			<td>${bean.idx }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${bean.title }</td>
		</tr>
		<tr>
			<th>평점</th>
			<td>${bean.rating}</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${bean.calendar}</td>
		</tr>
		<tr>
			<th>좋아요</th>
			<td>
				<form id="likeCntForm" name="likeCntForm" method="post">
					<div id="likeCnt"></div>
				</form>
				<form id="likeClickForm" name="likeClickForm" method="post">
					<div id="likeClick">
<%--   						<a href="#" onClick="clickLike()" class="btn pull-right btn-success">좋아요 취소333</a>
	            		<input type="text" id="review_idx" name="review_idx" value="${bean.idx}" />
	            		<input type="text" id="checked" name="checked" value="true" />
	            		<input type="text" id="writer" name="writer" value="jaeseon" /> --%>
				</div>
				</form> 
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<div class="panel panel-default" id="content">
					<div class="panel-body" id="content">${bean.content }</div>
				</div>
			</td>
		</tr>
	</table>

	<div id="myCarousel" class="carousel slide" data-ride="carousel"
		id="frame">
		<!--페이지-->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
		<!--페이지-->
		<div class="carousel-inner" id="frame">
			<!--슬라이드1-->
			<div class="item active">
				<img src="../review_imgs/${mainImage.imageName }"
					style="width: 100%" alt="First slide" id="detail_imgs">
				<div class="container">
					<div class="carousel-caption">
						<h1>Slide 1</h1>
						<p>텍스트 1</p>
					</div>
				</div>
			</div>
			<!--슬라이드1-->
			<c:forEach items="${subImages }" var="subImage">
				<!--슬라이드2-->
				<div class="item">
					<img src="../review_imgs/${subImage.imageName }"
						style="width: 100%" data-src="" alt="Second slide"
						id="detail_imgs">
					<div class="container">
						<div class="carousel-caption">
							<h1>Slide 2</h1>
							<p>텍스트 2</p>
						</div>
					</div>
				</div>
			</c:forEach>
			<!--슬라이드2-->

			<!--슬라이드3-->
			<!-- 		<div class="item"> 
			<img src="http://www.blueb.co.kr/SRC2/_image/w03.jpg" style="width:100%" data-src="" alt="Third slide">
			<div class="container">
				<div class="carousel-caption">
					<h1>Slide 3</h1>
					<p>텍스트 3</p>
				</div>
			</div>
		</div> -->
			<!--슬라이드3-->
		</div>
		<!--이전, 다음 버튼-->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev"><span
			class="glyphicon glyphicon-chevron-left"></span></a> <a
			class="right carousel-control" href="#myCarousel" data-slide="next"><span
			class="glyphicon glyphicon-chevron-right"></span></a>
	</div>
	<%@ include file="review_comment.jsp"%>
	
	
</body>
</html>