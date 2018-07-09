<%--
  Created by IntelliJ IDEA.
  User: jinsoo
  Date: 2018-07-08
  Time: 오후 10:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script>
        $(document).ready(function(){
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
                <a class="navbar-brand" style="padding-top: 10px;" href="./"><img src="/imgs/logo_top3.png"/></a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="#" class="menuBtn">예약<span class="sr-only"></span></a></li>
                    <li><a href="#" class="menuBtn">사용자 리뷰</a></li>
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
                    <li><a href="#">로그인</a></li>
                    <li><a href="#">회원가입</a></li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</div>
</body>
</html>
