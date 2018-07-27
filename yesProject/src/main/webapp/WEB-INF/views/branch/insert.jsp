<%--
  Created by IntelliJ IDEA.
  User: pro
  Date: 2018. 7. 9.
  Time: PM 4:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Title</title>
</head>
<body>
	<jsp:include page="../layout/header.jsp?ver=1" flush="false"/>
	<form name="fileForm" action="requestupload2" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<td>아이디</td>
			<td><input name="id" id="id" type="text"/></td>
		</tr>
		<tr>
			<td>영업시간</td>
			<td><input name="opTime" id="opTime" type="text"/></td>
		</tr>
		<tr>
			<td>휴게시간</td>
			<td><input name="breakTime" id="breakTime" type="text"/></td>
		</tr>
		<tr>
			<td>영업일</td>
			<td><input name="opDate" id="opDate" type="text"/></td>
		</tr>
		<tr>
			<td>연락처</td>
			<td><input name="phoneNum" id="phoneNum" type="text"/></td>
		</tr>
		<tr>
			<td>상태</td>
			<td><input name="state" id="state" type="text"/></td>
		</tr>
		<tr>
			<td>상호명</td>
			<td><input name="branchName" id="branchName" type="text"/></td>
		</tr>
		<tr>
			<td>카테고리</td>
			<td><input name="category" id="category" type="text"/></td>
		</tr>
		<tr>
			<td>매장 설명</td>
			<td><input name="branchExplain" id="branchExplain" type="text"/></td>
		</tr>
		<tr>
			<td>-------------------------------</td>
		</tr>
		<%--<tr>--%>
			<%--<td>대표메뉴1</td>--%>
			<%--<td><input name="menu1" id="menu1" type="text"/></td>--%>
		<%--</tr>--%>
		<%--<tr>--%>
			<%--<td>대표메뉴2</td>--%>
			<%--<td><input name="menu2" id="menu2" type="text"/></td>--%>
		<%--</tr>--%>
		<%--<tr>--%>
			<%--<td>대표메뉴3</td>--%>
			<%--<td><input name="menu3" id="menu3" type="text"/></td>--%>
		<%--</tr>--%>
		<tr>
			<td>도로명주소</td>
			<td><input type="text" name="address" id="address" placeholder="도로명주소"></td>
		</tr>
		<tr>
			<td>지번주소</td>
			<td><input type="text" name="jibunAddress" id="jibunAddress" placeholder="지번주소"></td>
		</tr>
		<td>
			<td><input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br></td>
			<td><input type="text" name="zoneCode" id="zoneCode" placeholder="우편번호"></td>
		</tr>
		<tr>
			<td>상세주소</td>
			<td><input name="addressDetail" id="addressDetail" type="text"/></td>
		</tr>
		<tr>
			<td>-------------------------------</td>
		</tr>
		
		<%--<tr>--%>
			<%--<td>이미지1</td>--%>
			<%--<td><input name="image1" id="image1" type="text"/></td>--%>
		<%--</tr>--%>
		<%--<tr>--%>
			<%--<td>이미지2</td>--%>
			<%--<td><input name="image2" id="image2" type="text"/></td>--%>
		<%--</tr>--%>
		<%--<tr>--%>
			<%--<td>이미지3</td>--%>
			<%--<td><input name="image3" id="image3" type="text"/></td>--%>
		<%--</tr>--%>
		<%--<tr>--%>
			<%--<td>평점</td>--%>
			<%--<td><input name="score" id="score" type="text"/></td>--%>
		<%--</tr>--%>
		
		<tr>
			<td><button type="submit">입력</button></td>
			<td></td>
		</tr>
	</table>
		<input multiple="multiple" type="file" name="file" />
		<input multiple="multiple" type="file" name="file" />
        <input type="text" name="src" />
        <input type="submit" value="전송" />
		<span id="guide" style="color:#999"></span>
	</form>
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zoneCode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address').value = fullRoadAddr;
                document.getElementById('jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
	</script>
</body>
</html>
