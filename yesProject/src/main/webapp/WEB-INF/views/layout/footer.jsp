<%--
  Created by IntelliJ IDEA.
  User: jinsoo
  Date: 2018-07-08
  Time: 오후 10:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script>
        $(function () {
            // Footer Slide open/close
            $('#footerDivOpen').animate({height:'60px'},'slow');
            var state = false;
            $('#footerImg').click(function() {
                $('#footerImg').toggleClass('flip');
                if(state){
                    $('#footerDivOpen').animate({height:'60px'},'slow');
                    state = false;
                }else{
                    $('#footerDivOpen').animate({height:'120px'},'slow');
                    state = true;
                }
            });
        })

    </script>
</head>
<body>
<div id="footerDivOpen">
    <div class="footerDivBlank">
        <img id="footerImg" src="./imgs/arrow.png">
    </div>
    <div class="footerDivCopy">

    </div>
</div>
</body>
</html>
