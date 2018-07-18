<%--
  Created by IntelliJ IDEA.
  User: jinsoo
  Date: 2018-07-08
  Time: 오후 10:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<style>
	#slide *{
		font-family:'Jua',sans-serif;
	}
	#slide h1{
		margin:80px 0px;
	}
	#slide a{
	 color:black;
	 margin-bottom:50px;
	}
	
	#slide-menu2{
		border-top:1px solid #e04f5f;
		width:80%;
		margin:20px auto;
		height:150px;
		background-color:red;
	}
	#slide-menu3{
		border-top:1px solid #e04f5f;
		width:100%;
		margin:20px auto;
		
	}


	</style>
    <script>
        $(document).ready(function(){
        	
            $('#slide').animate(
                    {right:-300},'slow'
                    ); 
        	$('#mypage').click(function(){
                $('#slide').css({"display":"inline-block"});
                $('#slide').animate(
                 {right:0,},'slow');
            });
             $('#close').click(function(){
                
                $('#slide').animate(
                {right:-300},'slow'
                ); 
             });
        	
        	
            $("#logout").click(function(){
            	$.ajax({
                    type : "POST",
                    dataType : 'text',
                    url : "http://nid.naver.com/nidlogin.logout",
                    crossDomain : true,
                    xhrFields : {
                       withCredentials : true
                    }
                 }).done(function(data) {
                    $('#logout').submit();
                 }).fail(function(xhr, textStatus, errorThrown) {
                    $('#logout').submit();
                 });
          	  
            });
            
        	
            $(".dropdownSelect img.flag").addClass("flagvisibility");
            $(".dropdownSelect dt a").click(function() {
                $(".dropdownSelect dd ul").toggle();
            });
            $(".dropdownSelect dd ul li a").click(function() {
                var text = $(this).html();
                $(".dropdownSelect dt a span").html(text);
                $(".dropdownSelect dd ul").hide();
                /* $("#result").html("Selected value is: " + getSelectedValue("sample"));*/
            });
            $(".dropdownSelect2 img.flag").addClass("flagvisibility");
            $(".dropdownSelect2 dt a").click(function() {
                $(".dropdownSelect2 dd ul").toggle();
            });
            $(".dropdownSelect2 dd ul li a").click(function() {
                var text = $(this).html();
                $(".dropdownSelect2 dt a span").html(text);
                $(".dropdownSelect2 dd ul").hide();
                /* $("#result").html("Selected value is: " + getSelectedValue("sample"));*/
            });
            $(".dropdownSelect3 img.flag").addClass("flagvisibility");
            $(".dropdownSelect3 dt a").click(function() {
                $(".dropdownSelect3 dd ul").toggle();
            });
            $(".dropdownSelect3 dd ul li a").click(function() {
                var text = $(this).html();
                $(".dropdownSelect3 dt a span").html(text);
                $(".dropdownSelect3 dd ul").hide();
                /* $("#result").html("Selected value is: " + getSelectedValue("sample"));*/
            });
            $(".dropdownSelect4 img.flag").addClass("flagvisibility");
            $(".dropdownSelect4 dt a").click(function() {
                $(".dropdownSelect4 dd ul").toggle();
            });
            $(".dropdownSelect4 dd ul li a").click(function() {
                var text = $(this).html();
                $(".dropdownSelect4 dt a span").html(text);
                $(".dropdownSelect4 dd ul").hide();
                /* $("#result").html("Selected value is: " + getSelectedValue("sample"));*/
            });
            $(".dropdownSelect5 img.flag").addClass("flagvisibility");
            $(".dropdownSelect5 dt a").click(function() {
                $(".dropdownSelect5 dd ul").toggle();
            });
            $(".dropdownSelect5 dd ul li a").click(function() {
                var text = $(this).html();
                $(".dropdownSelect5 dt a span").html(text);
                $(".dropdownSelect5 dd ul").hide();
                /* $("#result").html("Selected value is: " + getSelectedValue("sample"));*/
            });
            $("#searchBox").slideToggle('slow', function(){});
            // searchBox open / close
            $('#searchIcon1').click(function() {
                $('#searchIcon1').toggleClass('flip');
                $('#searchBox').slideToggle('slow', function() {
                    // 객체가 다 펼치지거나 접히고 나면 여기에 든 내용이 실행된다.
                });
            });


        });
        function getSelectedValue(id) {
            return $("#" + id).find("dt a span.value").html();
        }
        $(document).bind('click', function(e) {
            var $clicked = $(e.target);
            if (!$clicked.parents().hasClass("dropdownSelect"))
                $(".dropdownSelect dd ul").hide();
        });
        $(".dropdownSelect img.flag").toggleClass("flagvisibility");
        
        
    </script>
</head>
<body>
        <div id="slide" style="float:right; border:1px solid #e04f5f; width:17%; height: 100%; background-color:white; text-align: center;display: none ; z-index: 30; position:absolute; right:0;">
            <a id="close" style="float: right; color: black; font-size: 25px;">X</a>
          
            <h1>마이 페이지</h1>

			<div id="slide-menu">
            <ul>
                <li><a href="reservation.yes">예약 현황</a></li>
                <li><a href="review.yes">리뷰 작성</a></li>
                <li><a href="myInfo.yes">내정보</a></li>
            </ul>
			</div>
			<div id="slide-menu2">
			
			</div>
			<div id="slide-menu3">
  
			</div>
            
        </div> <!-- slide menu end-->


<div >
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
                <a class="navbar-brand" style="padding-top: 10px;" href="./"><img src="./imgs/logo_top3.png"/></a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="#" class="menuBtn">예약<span class="sr-only"></span></a></li>
                    <li><a href="review_list" class="menuBtn">사용자 리뷰</a></li>
                    <li class="dropdown" id="openCsBtn">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">고객센터<span class="caret"></span></a>
                        <ul class="dropdown-menu" id="dropdown">
                            <li><a href="#">공지사항</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#">고객 상담</a></li>
                            <li><a href="#">사업자 상담</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                <c:if test="${member==null}">
                    <li><a href="login.yes">로그인</a></li>
                    <li><a href="join.yes">회원가입</a></li>
                </c:if>
                <c:if test="${member!=null }">
                    <li><a id="mypage" href="#">마이페이지</a></li>
                    <li><a id="logout" href="logout">로그아웃</a></li>
                </c:if>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</div>
</body>
</html>
