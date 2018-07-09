function addJavascript(jsname) {

	var th = document.getElementsByTagName('head')[0];

	var s = document.createElement('script');

	s.setAttribute('type','text/javascript');

	s.setAttribute('src',jsname);

	th.appendChild(s);

}

addJavascript('https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js');



/* 자바스크립트 함수 기술 */

$(function() {
$(".dropdown img.flag").addClass("flagvisibility");

$(".dropdown dt a").click(function() {
  $(".dropdown dd ul").toggle();
});

$(".dropdown dd ul li a").click(function() {
  var text = $(this).html();
  $(".dropdown dt a span").html(text);
  $(".dropdown dd ul").hide();
  /* $("#result").html("Selected value is: " + getSelectedValue("sample"));*/
});

function getSelectedValue(id) {
  return $("#" + id).find("dt a span.value").html();
}

$(document).bind('click', function(e) {
  var $clicked = $(e.target);
  if (!$clicked.parents().hasClass("dropdown"))
    $(".dropdown dd ul").hide();
});

$(".dropdown img.flag").toggleClass("flagvisibility");
});

