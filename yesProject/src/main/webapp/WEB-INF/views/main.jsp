<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!Doctype html>
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/selectDesign.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mapStyle.css?ver=2">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/clndrstyle.css?ver=1">
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.js"></script>
	<script src="${pageContext.request.contextPath}/js/main_js/branch_search.js"></script>
</head>
<style>
	.selectTimeContent {
		width: 50px;
		height: 25px;
		border: 1px solid gray;
		background-color: white;
		display: inline-block;
		margin-right: 3px;
		margin-bottom: 5px;
		text-align: center;
	}
	
	.selectTime5, .selectTime10, .selectTime15, .selectTime15, .selectTime20,
	.selectTime25, .selectTime30, .selectTime35, .selectTime40, .selectTime45,
	.selectTime50, .selectTime55, .selectTime60,
	.selectTime65, .selectTime70, .selectTime75 {
		margin-right: 0px;
	}
</style>
<body>

<jsp:include page="./layout/header.jsp"/>

<div class="page" id="page" style="z-index:0;position:relative;">
	<script type="text/javascript">

		function mapResize() {
			var mapResize = document.getElementById('page');
			mapResize.style.width = window.innerWidth;
			mapResize.style.height = window.innerHeight - 100 + 'px';
		}

		window.onload = function () {
			mapResize();

			// 브라우저 크기가 변할 시 동적으로 사이즈를 조절해야 하는경우
			window.addEventListener('resize', mapResize);
		}
	</script>
	<div><img src="./imgs/icon.png" id="searchIcon1"></div>
	<div id="searchBox" style="height: 70px; width: 300px;">
		<div style="width: 100%; height: 40px; margin-top: 12px; margin-bottom: 12px;">
			<div style="display: inline-block; width: 30%; height: 100%;">
				<select id="searchSelect" style="width: 100%; height: 100%;">
					<option value="searchRocate">지역별</option>
					<option value="searchName">상호명</option>
					<option value="searchMenu">메뉴</option>
				</select>
			</div>
			<div style="display: inline-block; width: 50%; height: 100%;">
				<input type="text" style="width: 100%; height: 100%;" name="searchInput">
			</div>
			<div style="display: inline-block; width: 15%; height: 100%;">
				<button class="searchBtn" onclick="searchStart()" style="width: 100%; height: 100%;">검색</button>
			</div>
		</div>
		<div class="searchResultDiv" style="width: 100%; height: 0px;">
			<div id="searchResult">
			</div>
		</div>
	</div>
	
	<div id="map"></div>
	<script type="text/javascript"
	        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=630e98d8425188c04dae0728c65822bb&libraries=services,clusterer"></script>
	
	<%-- 지도 생성 및 마커 생성 --%>
	<script src="${pageContext.request.contextPath}/js/main_js/set_map.js"></script>
	<%-- 매장 팝업 및 디테일 모달 관리 --%>
	<script src="${pageContext.request.contextPath}/js/main_js/branch_detail.js"></script>
	<%-- 매장 예약 모달 관리 --%>
	<script src="${pageContext.request.contextPath}/js/main_js/branch_reserve.js"></script>

	<script>
		<c:forEach items="${alist}" var="articleList">
		// 주소를 좌표로 변환해줌
		geocoder.addressSearch('${articleList.roadAddress}', function (result, status) {

			// 정상적으로 검색이 완료됐으면
			if (status === daum.maps.services.Status.OK) {

				var branchArr = ['${articleList.id}', '${articleList.branchName}',
								'${articleList.opTime}', '${articleList.breakTime}',
								'${articleList.opDate}', '${articleList.phoneNum}',
								'${articleList.score}', '${articleList.state}',
								'${articleList.zoneCode}', '${articleList.roadAddress}',
								'${articleList.jibunAddress}', '${articleList.detailAddress}',
								'${articleList.markerImage}', '${articleList.mainImage}',
								'${articleList.image1}', '${articleList.image2}',
								'${articleList.image3}', '${articleList.image4}',
								'${articleList.image5}', '${articleList.image6}',
								'${articleList.image7}', '${articleList.image8}',
								'${articleList.category}', '${articleList.branchExplain}',
								'${articleList.sido}', '${articleList.sigungu}',
								'${articleList.category}'];

				coords = new daum.maps.LatLng(result[0].y, result[0].x);


				if (('${articleList.latlngx}' && '${articleList.latlngy}') == null) {
					//기등록된 자료에 latlng 입력
					var latlngY = result[0].y,
						latlngX = result[0].x;
					var tempId = '${articleList.id}';
					$.ajax({
						type: 'POST',
						url: '/updatelatlng',
						data: JSON.stringify({
							latlngY: latlngY,
							latlngX: latlngX,
							id: tempId
						}),
						contentType: 'application/json; charset=utf-8',
						success: function (data) {
							console.log(tempId + ' 좌표 업데이트 완료');
							// $.each(data,  function (idx, val) {
							//     test.push(val.menu);
							//     test.push(val.price);
							//     mapSetMarker(test);
							// });
						},
						error: function () {
							alert('latlng error');
						}
					});
				}


				addMarker(coords, branchArr);
			}
		});
		</c:forEach>

	</script>
	
	<%--매장 상세보기 모달--%>
	<div id="branchDetailModal" class="modal">
		<div class="detailModalTop">
			<div class="detailModalTopTitle">
			</div>
			<div class="detailModalTopCategory">
				<span class="categorySpan"></span>
			</div>
		</div>
		<div class="detailModalLeft">
			<div class="detailModalLeftImg">
				<div class="popup-gallery">
					<a href="" class="gallerylink"><img src="" class="gallerymain"></a>
				
				</div>
			</div>
			<div class="popup-gallery popup-gallery2">
				<a class="imgLink1" href=""><img src="" width="60" height="60" class="galleryimg img1"></a>
				<a class="imgLink2" href=""><img src="" width="60" height="60" class="galleryimg img2"></a>
				<a class="imgLink3" href=""><img src="" width="60" height="60" class="galleryimg img3"></a>
				<a class="imgLink4" href=""><img src="" width="60" height="60" class="galleryimg img4"></a>
				<a class="imgLink5" href=""><img src="" width="60" height="60" class="galleryimg img5"></a>
				<a class="imgLink6" href=""><img src="" width="60" height="60" class="galleryimg img6"></a>
				<a class="imgLink7" href=""><img src="" width="60" height="60" class="galleryimg img7"></a>
				<a class="imgLink8" href=""><img src="" width="60" height="60" class="galleryimg img8"></a>
			
			</div>
		</div>
		<div class="detailModalRight">
			<div class="modalStatusDiv" style="text-align: center;">
				<div class="modalScore" style="width: 330px; "></div>
				<div class="modalStatus"
				     style="width: 200px;height: 40px;display: inline-block;top: 0;right: 10px;position: absolute; text-align: right;">
					<div class="ticketingText" style="display: inline-block; margin-right: 20px;"></div>
					<div class="ticketingBtn" style="display: inline-block;">대기 시작</div>
				</div>
			</div>
			<div>
				<div class="modalAddressDiv">주소</div>
				<div class="modalAddress"></div>
			</div>
			<div class="modalJibunAddress">
			</div>
			<div>
				<div class="modalPhoneNumDiv">연락처</div>
				<div class="modalPhoneNum"></div>
			</div>
			<div>
				<div class="modalOpTimeDiv">영업시간</div>
				<div class="modalOpTime"></div>
			</div>
			<div>
				<div class="modalBreakTimeDiv">휴게시간</div>
				<div class="modalBreakTime"></div>
			</div>
			<div class="modalOpDayBox">
				<div class="modalOpDayDiv">영업일</div>
				<div class="modalOpDay"></div>
			</div>
			
			<div class="modalMenuBox">
				<div class="modalMenuBoxLeft">
					<div class="modalLeftMenu">
						<div class="modalMenuName0"></div>
						<div class="modalMenuPrice0"></div>
					</div>
					<div class="modalLeftMenu">
						<div class="modalMenuName2"></div>
						<div class="modalMenuPrice2"></div>
					</div>
					<div class="modalLeftMenu">
						<div class="modalMenuName4"></div>
						<div class="modalMenuPrice4"></div>
					</div>
					<div class="modalLeftMenu">
						<div class="modalMenuName6"></div>
						<div class="modalMenuPrice6"></div>
					</div>
				</div>
				<div class="modalMenuBoxRight">
					<div class="modalRightMenu">
						<div class="modalMenuName1"></div>
						<div class="modalMenuPrice1"></div>
					</div>
					<div class="modalRightMenu">
						<div class="modalMenuName3"></div>
						<div class="modalMenuPrice3"></div>
					</div>
					<div class="modalRightMenu">
						<div class="modalMenuName5"></div>
						<div class="modalMenuPrice5"></div>
					</div>
					<div class="modalRightMenu">
						<div class="modalMenuName7"></div>
						<div class="modalMenuPrice7"></div>
					</div>
				</div>
			</div>
			<div class="modalExplain">
			</div>
			<div class="modalBbs">
				<div class="modalBbsMore">더보기</div>
				<div class="modalBbsTitle">
					<div class="modalBbsTitleSub">제목</div>
					<div class="modalBbsTitleDate">날짜</div>
					<div class="modalBbsTitleWriter">작성자</div>
				</div>
				<div class="modalBbsList">
					<div class="modalBbsListSub bbsSub1"></div>
					<div class="modalBbsListDate bbsDate1"></div>
					<div class="modalBbsListName bbsName1"></div>
				</div>
				<div class="modalBbsList">
					<div class="modalBbsListSub bbsSub2"></div>
					<div class="modalBbsListDate bbsDate2"></div>
					<div class="modalBbsListName bbsName2"></div>
				</div>
			</div>
		</div>
	</div>
	
	
	<div>
	
	</div>

</div>
<div id="reserveModal" class="modal" style="height: 600px; max-height: 600px; max-width: 400px; width: 400px;">
	<div class="detailModalTop" style="width: 400px; color: white;">
		<span class="modalTopSpan">예약</span>
	</div>
	<div id="calendar"></div>
	<input type="hidden" name="" id="targetDate" value="">
	<div class="reserveTimeDiv">
		<div class="reservePersonel">
			<input type="number" min="1" max="10" class="reservePersonelInput" placeholder="1"/>명
		</div>
		<div class="reserveTimeSelect">
			<div class="resultTimeDiv" style="height: 100%; width: 100%; font-size: 19px; line-height: 40px;">
			</div>
		</div>
	</div>
	<div class="reserveRequest">
		<input type="text" class="reserveRequestInput" placeholder="요청사항"/>
	</div>
	<div class="reserveBtn">
		<a href="#" class="btn-gradient gray block">취소</a>
		<a href="#" onclick="insertReserve()" class="btn-gradient red block">예약</a>
	</div>
	<div class="selectTimeDiv"
	     style="position: absolute; display: none; width: 300px; height: 400px; top: 120px; right: -320px;">
		<div class="selectTimeTopDiv"
		     style="text-align: center; color: white; font-weight: 500; font-size: 16pt; line-height: 70px;border-top-left-radius: 15px; border-top-right-radius: 15px; height: 70px; background-color: #e04f5f;"></div>
		<div class="selectTimeContentDiv"
		     style="overflow-y: scroll;border: 3px dashed #e04f5f; border-top: none; height: 330px; padding: 8px; padding-top: 10px;">
		</div>
	</div>
</div>

<script>
	$.noConflict();
	
	//상세보기의 이미지 플러그인
	$(document).ready(function () {
		$('.popup-gallery').magnificPopup({
			delegate: 'a',
			type: 'image',
			tLoading: 'Loading image #%curr%...',
			mainClass: 'mfp-img-mobile',
			gallery: {
				enabled: true,
				navigateByImgClick: true,
				preload: [0, 1]
			},
			image: {
				tError: '<a href="%url%">The image #%curr%</a> could not be loaded.',
				titleSrc: function (item) {
					return item.el.attr('title') + '<small></small>';
				}
			}
		});
		$('.galleryimg').mouseover(function (e) {
			var imageSrcArr = e.target.src.split('/');
			var imageSrc = "/imgs/foodimgs/" + imageSrcArr[5];
			$('.gallerymain').attr('src', imageSrc);
			$('.gallerylink').attr('href', imageSrc);
		})

		$('.day').click(function (target) {
			$('.day').css('background-color', 'white');
			$(this).css('background-color', 'lightgray');
		});


		$('.ticketingBtn').mouseover(function () {
			$('.ticketingBtn').css('color', '#e04f5f');
		});
		$('.ticketingBtn').mouseout(function () {
			$('.ticketingBtn').css('color', 'black');
		});


	});


</script>
<script src="${pageContext.request.contextPath}/js/calendar/clndr3.js"></script>
<script src="${pageContext.request.contextPath}/js/calendar/demo.js?ver=3"></script>
</body>
</html>