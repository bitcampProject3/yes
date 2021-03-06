<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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
}
</style>
</head>
<script type="text/javascript">
	function checkedRating() {

		var rating = ${bean.rating};

		if (rating == 1) {
			$("#inlineRadio1").attr("checked", true);
		} else if (rating == 2) {
			$("#inlineRadio2").attr("checked", true);
		} else if (rating == 3) {
			$("#inlineRadio3").attr("checked", true);
		} else if (rating == 4) {
			$("#inlineRadio4").attr("checked", true);
		} else if (rating == 5) {
			$("#inlineRadio5").attr("checked", true);
		}
	}

	$(function() {
		checkedRating();
	});
</script>
<body style="overflow-y:auto;">

	<jsp:include page="../layout/header.jsp"/>
	<!-- <div>
		<nav class="navbar navbar-default">
		<div class="container-fluid">
			Brand and toggle get grouped for better mobile display
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" style="line-height: 20px; padding-top: 0px;"
					href="main.html"><img src="imgs/logo_top2.png" /></a>
			</div>

			Collect the nav links, forms, and other content for toggling
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="#" class="menuBtn">예약<span class="sr-only"></span></a></li>
					<li><a href="review_list.html" class="menuBtn">사용자 리뷰</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">고객센터<span class="caret"></span></a>
						<ul class="dropdown-menu" id="dropdown">
							<li><a href="#">공지사항</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">고객 상담</a></li>
							<li><a href="#">사업자 상담</a></li>
						</ul></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">로그인</a></li>
					<li><a href="#">회원가입</a></li>
				</ul>
			</div>
			/.navbar-collapse
		</div>
		/.container-fluid </nav>
		<div style=""></div>
	</div> -->
	<form method="POST">
		<table class="table">
			<h1>수정 페이지</h1>
			<tr>
				<th>제목</th>
				<td><input type="text" id="title" name="title"
					value="${bean.title }" /></td>
			</tr>
			<tr>
				<th>평점</th>
				<%-- <td><input type="text" id="rating" name="rating" value="${bean.rating }"/> / 5</td> --%>
				<td><label class="radio-inline"> <input type="radio"
						name="rating" id="inlineRadio1" value="1"> 1
				</label> <label class="radio-inline"> <input type="radio"
						name="rating" id="inlineRadio2" value="2"> 2
				</label> <label class="radio-inline"> <input type="radio"
						name="rating" id="inlineRadio3" value="3"> 3
				</label> <label class="radio-inline"> <input type="radio"
						name="rating" id="inlineRadio4" value="4"> 4
				</label> <label class="radio-inline"> <input type="radio"
						name="rating" id="inlineRadio5" value="5"> 5
				</label></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea class="form-control col-sm-5" rows="15"
						id="content" name="content">${bean.content}</textarea></td>
			</tr>
			<tr>
				<th>메인 이미지</th>
				<td><input type="file" name="mainImage" /></td>
			</tr>
			<tr>
				<th>남은 이미지들</th>
				<td><input type="file" name="subImages" multiple="multiple" />
				</td>
			</tr>
		</table>
		<input type="hidden" name="idx" id="idx" value="${bean.idx }" />
<!-- 		<div class="form-group">

			<label for="InputSubject1">파일첨부</label> <input id="fileInput"
				filestyle="" type="file" data-class-button="btn btn-default"
				data-class-input="form-control" data-button-text=""
				data-icon-name="fa fa-upload" class="form-control" tabindex="-1"
				style="position: absolute; clip: rect(0px, 0px, 0px, 0px);">
			<div class="bootstrap-filestyle input-group">
				<input type="text" id="userfile" class="form-control"
					name="userfile" disabled=""> <span
					class="group-span-filestyle input-group-btn" tabindex="0"> <label
					for="fileInput" class="btn btn-default "> <span
						class="glyphicon fa fa-upload"></span>
				</label>
				</span>
			</div>
		</div> -->
		<input type="hidden" id="branchID" name="branchID" value="branch1" />
		<!-- 나중에 session 객체 값으로 변경해야 됨 -->
		<input type="hidden" id="clientID" name="clientID" value="client3" />
		<!-- 나중에 session 객체 값으로 변경해야 됨 -->
		<button type="submit" class="btn btn-default">완료</button>
		<a class="btn btn-default" href="../review_list" role="button">취소</a>
	</form>
</body>
</html>