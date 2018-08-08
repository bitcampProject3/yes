function searchStart() {

	var searchArr = {};
	var searchLatArr = [],
		searchLngArr = [];
	searchArr["searchSelect"] = $('#searchSelect').val();
	searchArr["searchInput"] = $("input[name='searchInput']").val();

	$.ajax({
		url: "search",
		type: 'POST',
		contentType: 'application/json; charset=utf-8',
		data: JSON.stringify(searchArr),
		success: function (data) {
			if (data.length === 0) {
				alert('해당하는 매장이 없습니다.');
				$("input[name='searchInput']").val('');
			} else {
				$('#searchResult').empty();
				$.each(data, function (idx, val) {
					searchLatArr.push(val.latlngy);
					searchLngArr.push(val.latlngx);

					var searchListContent = '<div class="results" onmouseover="resultsMouseOver(this, ' + val.latlngy + ', ' + val.latlngx + ')" onmouseout="resultsMouseOut(this)">' +
						'    <div class="searchResultContent">' +
						'       <div class="searchResultContentTitle">' +
						'         ' + val.branchName +
						'       </div>' +
						'       <div class="searchResultContentDiv">' +
						'           <div class="searchMainImage">' +
						'               <img src="./imgs/foodimgs/' + val.image1 + '" width="80" height="80" class="searchImageFile">' +
						'           </div>' +
						'           <div class="searchResultContentDetail"><br/>' +
						'               주소 : ' + val.roadAddress + '<br/>' +
						'               연락처 : ' + val.phoneNum + '<br/>' +
						'               평점 : ' + val.score + ' / 5.0 <br/>' +
						'           </div>' +
						'       </div>' +
						'    </div>' +
						'</div>';

					$('#searchResult').append(searchListContent);

				});
				var searchCnt = searchLngArr.length;
				searchResultList(searchLatArr, searchLngArr);
				alert('총 [' + searchCnt + ']건 검색 완료');
				$('.searchResultDiv').css('height', '400px');
				$('#searchBox').css('height', '470px');
			}
		},
		error: function (request, status, error) {
			alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		}
	});
}

function resultsMouseOver(e, lat, lng) {

	$('.wrap').css('display', 'none');
	$(e).css('background-color', '#e04f5f');
	$(e).css('color', 'white');
	$(e).css('font-weight', 'bold');
	var moveLatLng = new daum.maps.LatLng(lat, lng);
	map.setLevel(3);
	map.panTo(moveLatLng);
}

function resultsMouseOut(e) {
	$(e).css('background-color', 'white');
	$(e).css('color', 'black');
	$(e).css('font-weight', 'none');

}

function searchResultList(searchLatArr, searchLngArr) {
	var points = [];
	for (i = 0; i < searchLatArr.length; i++) {
		var templatlng = new daum.maps.LatLng(searchLatArr[i], searchLngArr[i]);

		points.push(templatlng);
	}

	var bounds = new daum.maps.LatLngBounds();
	for (i = 0; i < points.length; i++) {
		bounds.extend(points[i]);
	}
	map.setBounds(bounds);
}