<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
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
	$(document).ready(
			function() {
				var branchID='${branchID}';
				console.log(branchID);
				$("#fileInput").on(
						'change',
						function() { // 값이 변경되면

							if (window.FileReader) { // modern browser

								var filename = $(this)[0].files[0].name;

							} else { // old IE

								var filename = $(this).val().split('/').pop()
										.split('\\').pop(); // 파일명만 추출

							}
							// 추출한 파일명 삽입

							$("#userfile").val(filename);

						});

			});
</script>
<body style="overflow-y:auto;">
<jsp:include page="../layout/header.jsp"></jsp:include>

           <div class="container" style=" border-bottom: 1px solid #CCCCCC; padding-left:0px; padding-right:0px; 
               border-bottom-color: #e04f5f; margin-top:30px;">
                
              <div class="col-sm-9" style="width: 100%; padding-left: 14px; padding-right:14px;  ">
                  <h1 style="padding: 5px; margin-bottom: 20px; ">
                      <a href="" style="color: black;">리뷰 작성</a>
                  </h1>

              </div>
            </div>
            
        <div style="padding-left: 40px; padding-right: 40px; margin:20px;">     
	<form method="POST" enctype="multipart/form-data">
		<table class="table">
			<tr>
				<th>제목</th>
				<td><input type="text" id="title" name="title" /></td>
			</tr>
			<tr>
				<th>평점</th>
				<td><input name="star1" type="radio" class="star" />
				<input name="star1" type="radio" class="star" />
				<input name="star1" type="radio" class="star" />
				<input name="star1" type="radio" class="star" />
				<input name="star1" type="radio" class="star" /></td>
				<!-- <td><input type="text" id="rating" name="rating"/> / 5.0</td> -->
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea class="form-control col-sm-5" rows="15"
						id="content" name="content"></textarea></td>
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
		<div class="form-group">

			<!-- 파일 첨부(css)  -->
			<!-- 	<label for="InputSubject1">파일첨부</label>
	
	<input id="fileInput" filestyle="" type="file" data-class-button="btn btn-default" data-class-input="form-control" data-button-text="" data-icon-name="fa fa-upload" class="form-control" tabindex="-1" style="position: absolute; clip: rect(0px 0px 0px 0px);">
	<div class="bootstrap-filestyle input-group">
	<input type="text" id="userfile" class="form-control" name="userfile" disabled="">
	<span class="group-span-filestyle input-group-btn" tabindex="0">
	<label for="fileInput" class="btn btn-default ">
	<span class="glyphicon fa fa-upload"></span>
	</label>
	</span>
	</div> -->


			<!-- branchID, clientID는 나중에 session에서 받아와야 된다.  -->
		</div>
		<input type="hidden" id="branchID" name="branchID" value="${branchID }" />
		<input type="hidden" id="clientID" name="clientID" value="${member.id }" />
		<div style="float:right;">
		<button type="submit" class="btn btn-default">완료</button>
		<a class="btn btn-default" href="javascript:history.back();" role="button">취소</a>
		</div>
	</form>
	</div>
	<!-- 다중 이미지 업로드 form  -->
	<!--     <form method="post" name="multiUpload" action="multiRequest" enctype="multipart/form-data">
    	<input type="file" name="multiFile" multiple="multiple"/>
    	<input type="submit" value="전송"/>
    </form> -->
</body>
</html>