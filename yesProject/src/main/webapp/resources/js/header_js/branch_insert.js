    function modalStep1() {
        var contentStep1 =  '<div class="modalContentDiv" style="display: none;">'+
                            '    <div class="modalContentAttr">아이디 *예비</div>'+
                            '    <div><input name="id" id="id" type="text"/></div>'+
                            '</div>'+
                            '<div class="modalContentDiv">'+
                            '    <div class="modalContentAttr">최대 수용 테이블</div>'+
                            '    <div><input name="maxTable" id="maxTable" type="text" placeholder="숫자만 입력해주십시오"/></div>'+
                            '    <div class="modalContentAttr" style="width: 105px;">연락처</div>'+
                            '    <div><input name="phoneNum" id="phoneNum" type="text" placeholder="숫자만 입력해주십시오"/></div>'+
                            '</div>'+
                            '<div class="modalContentDiv">'+
                            '    <div class="modalContentAttr">상호명</div>'+
                            '    <div><input name="branchName" id="branchName" type="text"/></div>'+
                            '    <div class="modalSecondAttr">카테고리</div>'+
                            '    <div><input name="category" id="category" type="text" placeholder="한식 / 중식 / 양식 / 일식"/></div>'+
                            '</div>'+
                            '<div class="modalContentDiv">'+
                            '    <div class="modalContentAttr">영업시간</div>'+
                            '    <div><input name="opTime" id="opTime" type="text" placeholder="10:00~24:00"/></div>'+
                            '    <div class="modalSecondAttr">휴게시간</div>'+
                            '    <div><input name="breakTime" id="breakTime" type="text" placeholder="15:00~16:00"/></div>'+
                            '</div>'+
                            '<div class="modalContentDiv">'+
                            '    <div class="modalContentAttr">영업일</div>'+
                            '    <div><input name="opDate" id="opDate" type="text" placeholder="매주 n요일 휴무"/></div>'+
                            '</div>'+
                            '<div class="modalContentDiv">'+
                            '    <div class="modalContentAttr">매장 설명</div>'+
                            '    <div><input name="branchExplain" id="branchExplain" type="text"/></div>'+
                            '</div>'+
                            '<div class="modalContentDiv">'+
                            '    <div class="modalContentAttr">우편번호</div>'+
                            '    <div><input type="text" name="zoneCode" id="zoneCode" onclick="sample4_execDaumPostcode()" placeholder="우편번호" readonly="readonly"></div>'+
                            '    <div class="modalSecondAttr">지번주소</div>'+
                            '    <div><input type="text" name="jibunAddress" id="jibunAddress" onclick="sample4_execDaumPostcode()" placeholder="지번주소" readonly="readonly"></div>'+
                            '</div>'+
                            '<div class="modalContentDiv">'+
                            '    <div class="modalContentAttr">도로명주소</div>'+
                            '    <div><input type="text" name="address" id="address" placeholder="도로명주소" onclick="sample4_execDaumPostcode()" readonly="readonly"></div>'+
                            '</div>'+
                            '<div class="modalContentDiv">'+
                            '    <div class="modalContentAttr">상세주소</div>'+
                            '    <div><input name="addressDetail" id="addressDetail" type="text"/></div>'+
                            '</div>'+
                            '<input type="hidden" id="sido"> '+
                            '<input type="hidden" id="sigungu"> '+
                            '<input type="hidden" id="bname1"> '+
                            '<input type="hidden" id="bname2"> '+
                            '<div>'+
                            '    <a href="javascript:modalStep2();" onclick="modalStep1Event()">다음</a>'+
                            '</div>';
        $('.modalContent').empty().append(contentStep1);
        $('.detailModalTopCategory').empty().append('1 / 3단계 -- 가맹점 정보');
    }

    function modalStep1Event() {
        var data = {};
        data.maxTable = $('#maxTable').val();
        data.branchName = $('#branchName').val();
        data.phoneNum = $('#phoneNum').val();
        data.category = $('#category').val();
        data.opTime = $('#opTime').val();
        data.breakTime = $('#breakTime').val();
        data.opDate = $('#opDate').val();
        data.branchExplain = $('#branchExplain').val();
        data.zoneCode = $('#zoneCode').val();
        data.jibunAddress = $('#jibunAddress').val();
        data.roadAddress = $('#address').val();
        data.detailAddress = $('#addressDetail').val();
        data.sido = $('#sido').val();
        data.sigungu = $('#sigungu').val();
        data.bname1 = $('#bname1').val();
        data.bname2 = $('#bname2').val();


        $.ajax({
            type: "POST",
            url: "./insertstep1",
            data: JSON.stringify(data),
            contentType: "application/json; charset=UTF-8",
            dataType: "json",
            success: function(data) {
                alert('ajax-success');
            }
        })
    }

    function modalStep2() {


        var contentStep2 =   '    <div class="modalStep2tr">'+
                             '        <div class="modalStep2nth1">순번</div>'+
                             '        <div class="modalStep2nth2">메뉴명</div>'+
                             '        <div class="modalStep2nth3">가격</div>'+
                             '        <div class="modalStep2nth4">대표메뉴(최대 세개 선택가능)</div>'+
                             '    </div>'+
                             '    <div class="modalStep2tr">'+
                             '        <div class="modalStep2nth1">1</div>'+
                             '        <div class="modalStep2nth2"><input type="text" name="menu1" id="menu1"/></div>'+
                             '        <div class="modalStep2nth3"><input type="text" name="price1" id="price1" placeholder="1000"/></div>'+
                             '        <div class="modalStep2nth4"><input type="checkbox" name="checkbox" id="checkbox1" class="checkbox1"/></div>'+
                             '    </div>'+
                             '    <div class="modalStep2tr">'+
                             '        <div class="modalStep2nth1">2</div>'+
                             '        <div class="modalStep2nth2"><input type="text" name="menu2" id="menu2"/></div>'+
                             '        <div class="modalStep2nth3"><input type="text" name="price2" id="price2" placeholder="2000"/></div>'+
                             '        <div class="modalStep2nth4"><input type="checkbox" name="checkbox" id="checkbox2" class="checkbox2"/></div>'+
                             '    </div>'+
                             '    <div class="modalStep2tr">'+
                             '        <div class="modalStep2nth1">3</div>'+
                             '        <div class="modalStep2nth2"><input type="text" name="menu3" id="menu3"/></div>'+
                             '        <div class="modalStep2nth3"><input type="text" name="price3" id="price3" placeholder="3000"/></div>'+
                             '        <div class="modalStep2nth4"><input type="checkbox" name="checkbox" id="checkbox3" class="checkbox3"/></div>'+
                             '    </div>'+
                             '    <div class="modalStep2tr">'+
                             '        <div class="modalStep2nth1">4</div>'+
                             '        <div class="modalStep2nth2"><input type="text" name="menu4" id="menu4"/></div>'+
                             '        <div class="modalStep2nth3"><input type="text" name="price4" id="price4" placeholder="4000"/></div>'+
                             '        <div class="modalStep2nth4"><input type="checkbox" name="checkbox" id="checkbox4" class="checkbox4"/></div>'+
                             '    </div>'+
                             '    <div class="modalStep2tr">'+
                             '        <div class="modalStep2nth1">5</div>'+
                             '        <div class="modalStep2nth2"><input type="text" name="menu5" id="menu5"/></div>'+
                             '        <div class="modalStep2nth3"><input type="text" name="price5" id="price5" placeholder="5000"/></div>'+
                             '        <div class="modalStep2nth4"><input type="checkbox" name="checkbox" id="checkbox5" class="checkbox5"/></div>'+
                             '    </div>'+
                             '    <div class="modalStep2tr">'+
                             '        <div class="modalStep2nth1">6</div>'+
                             '        <div class="modalStep2nth2"><input type="text" name="menu6" id="menu6"/></div>'+
                             '        <div class="modalStep2nth3"><input type="text" name="price6" id="price6" placeholder="6000"/></div>'+
                             '        <div class="modalStep2nth4"><input type="checkbox" name="checkbox" id="checkbox6" class="checkbox6"/></div>'+
                             '    </div>'+
                             '    <div class="modalStep2tr">'+
                             '        <div class="modalStep2nth1">7</div>'+
                             '        <div class="modalStep2nth2"><input type="text" name="menu7" id="menu7"/></div>'+
                             '        <div class="modalStep2nth3"><input type="text" name="price7" id="price7" placeholder="7000"/></div>'+
                             '        <div class="modalStep2nth4"><input type="checkbox" name="checkbox" id="checkbox7" class="checkbox7"/></div>'+
                             '    </div>'+
                             '    <div class="modalStep2tr">'+
                             '        <div class="modalStep2nth1">8</div>'+
                             '        <div class="modalStep2nth2"><input type="text" name="menu8" id="menu8"/></div>'+
                             '        <div class="modalStep2nth3"><input type="text" name="price8" id="price8" placeholder="8000"/></div>'+
                             '        <div class="modalStep2nth4"><input type="checkbox" name="checkbox" id="checkbox8" class="checkbox8"/></div>'+
                             '    </div>'+
                             '    <div class="modalStep2tr">'+
                             '        <div class="modalStep2nth1"></div>'+
                             '        <div class="modalStep2nth3"><a href="javascript:modalStep3();" onclick="modalStep2Event()" >다음</a></div>'+
                             '    </div>';
    	$('.modalContent').empty().append(contentStep2);
        $('.detailModalTopCategory').empty().append('2 / 3단계 -- 메뉴 입력');
        jQuery(document).ready(function($) {
            $("input[name=checkbox]:checkbox").change(function() {// 체크박스들이 변경됬을때
                var cnt = 3;
                if( cnt==$("input[name=checkbox]:checkbox:checked").length ) {
                    $(":checkbox:not(:checked)").attr("disabled", "disabled");
                } else {
                    $("input[name=checkbox]:checkbox").removeAttr("disabled");
                }
            });

            $("#selCnt").change(function() {
                $("input[name=checkbox]:checkbox").removeAttr("checked");
                $("input[name=checkbox]:checkbox").removeAttr("disabled");
            });
        });
    }

    function modalStep2Event() {

    	var data = {};

    	var menuArr = [],
            priceArr = [],
            checkboxArr = [];

    	for (i = 1; i < 9; i++){
    		menuArr.push($('#menu'+i).val());
    		priceArr.push($('#price'+i).val());
    		checkboxArr.push($('#checkbox'+i).prop("checked").toString());
        }


        $.ajax({
            type: "POST",
            url: "./insertstep2",
            traditional: true,
            dataType: 'json',
            data: JSON.stringify({
            	menu : menuArr,
            	price : priceArr,
            	checkbox : checkboxArr
            }),
            contentType:"application/json; charset=UTF-8",
            success: function(data) {
                alert('ajax-success');
            }
        })
    }



    function modalStep3() {
    	var contentStep3 =  '<form name="fileForm" action="requestupload2" method="post" enctype="multipart/form-data">'+
                            '    <div class="fileFormTr">'+
                            '        <div><input multiple="multiple" type="file" name="file" onchange="loadFile(event)" id="fileUpload1"/></div>'+
                            '        <div><img src="'+path+'/imgs/blank.png" id="output1" width="50px" height="50px"/></div>'+
                            '    </div>'+
                            '    <div class="fileFormTr">'+
                            '        <div><input multiple="multiple" type="file" name="file" onchange="loadFile(event)" id="fileUpload2"/></div>'+
                            '        <div><img src="'+path+'/imgs/blank.png" id="output2" width="50px" height="50px"/></div>'+
                            '    </div>'+
                            '    <div class="fileFormTr">'+
                            '        <div><input multiple="multiple" type="file" name="file" onchange="loadFile(event)" id="fileUpload3"/></div>'+
                            '        <div><img src="'+path+'/imgs/blank.png" id="output3" width="50px" height="50px"/></div>'+
                            '    </div>'+
                            '    <div class="fileFormTr">'+
                            '        <div><input multiple="multiple" type="file" name="file" onchange="loadFile(event)" id="fileUpload4"/></div>'+
                            '        <div><img src="'+path+'/imgs/blank.png" id="output4" width="50px" height="50px"/></div>'+
                            '    </div>'+
                            '    <div class="fileFormTr">'+
                            '        <div><input multiple="multiple" type="file" name="file" onchange="loadFile(event)" id="fileUpload5"/></div>'+
                            '        <div><img src="'+path+'/imgs/blank.png" id="output5" width="50px" height="50px"/></div>'+
                            '    </div>'+
                            '    <div class="fileFormTr">'+
                            '        <div><input multiple="multiple" type="file" name="file" onchange="loadFile(event)" id="fileUpload6"/></div>'+
                            '        <div><img src="'+path+'/imgs/blank.png" id="output6" width="50px" height="50px"/></div>'+
                            '    </div>'+
                            '    <div class="fileFormTr">'+
                            '        <div><input multiple="multiple" type="file" name="file" onchange="loadFile(event)" id="fileUpload7"/></div>'+
                            '        <div><img src="'+path+'imgs/blank.png" id="output7" width="50px" height="50px"/></div>'+
                            '    </div>'+
                            '    <div class="fileFormTr">'+
                            '        <div><input multiple="multiple" type="file" name="file" onchange="loadFile(event)" id="fileUpload8"/></div>'+
                            '        <div><img src="'+path+'/imgs/blank.png" id="output8" width="50px" height="50px"/></div>'+
                            '    </div>'+
                            '    <div class="markerImageListDiv" style="width: 390px; margin-left: 125px; height: 250px; margin-right: 125px; margin-top: 30px; border: 1px solid black;">'+
                            '        '+
                            '    </div>'+
                            '    <input type="submit" onclick="modelStep3Event()" value="전송" />'+
                            '</form>';
    	$('.modalContent').empty().append(contentStep3);
        $('.detailModalTopCategory').empty().append('3 / 3단계 -- 이미지 업로드');
        markerImageList();

        $('.markerIcon').click(function(e) {
        	var imageTarget = e.target.classList[0];
        	$('.markerIcon').css('background','none');
        	$('.'+imageTarget).css('background-color','#bcbcbc').attr('selected','selected').attr('id',imageTarget);

            console.log('현재 클릭 : '+e.target.classList[0]);
        });
    }
    function modelStep3Event() {
        // 클릭했을때 이미지 불러오기
        var imageTarget = $("img[selected='selected']").attr('id')+'.png';

        $.ajax({
            type: 'POST',
            url: './insertstep3',
            data: imageTarget,
            dataType: 'json',
            success: function() {
                alert('ajax 성공');
            }
        });
    }
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
                document.getElementById('sido').value = data.sido;
                document.getElementById('sigungu').value = data.sigungu;
                document.getElementById('bname1').value = data.bname1;
                document.getElementById('bname2').value = data.bname2;
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