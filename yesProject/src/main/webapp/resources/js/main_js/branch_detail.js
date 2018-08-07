
		function branchDetail(e) {
			var branchDetailArr = [];
			branchDetailArr = e.split(",");
			var id = branchDetailArr[0],
				branchName = branchDetailArr[1],
				opTime = branchDetailArr[2],
				breakTime = branchDetailArr[3],
				opDate = branchDetailArr[4],
				phoneNum = branchDetailArr[5],
				score = branchDetailArr[6],
				state = branchDetailArr[7],
				zoneCode = branchDetailArr[8],
				roadAddress = branchDetailArr[9],
				jibunAddress = branchDetailArr[10],
				detailAddress = branchDetailArr[11],
				markerImage = branchDetailArr[12],
				mainImage = branchDetailArr[13],
				image1 = branchDetailArr[14],
				image2 = branchDetailArr[15],
				image3 = branchDetailArr[16],
				image4 = branchDetailArr[17],
				image5 = branchDetailArr[18],
				image6 = branchDetailArr[19],
				image7 = branchDetailArr[20],
				image8 = branchDetailArr[21],
				category = branchDetailArr[22],
				branchExplain = branchDetailArr[23],
				sido = branchDetailArr[24],
				sigungu = branchDetailArr[25],
				category = branchDetailArr[26];
			var test = [];
			$.ajax({
				type: 'POST',
				url: './branchdetail',
				data: id,
				dataType: 'json',
				success: function (data) {
					$.each(data, function (idx, val) {
						test.push(val.menu);
						test.push(val.price);
					});
					for (i = 0; i < test.length/2; i++) {
						$('.modalMenuName' + [i]).empty().append(test[i * 2]);
						$('.modalMenuPrice' + [i]).empty().append(test[i * 2 + 1]+"원");
					}
				},
				error: function () {
					alert("일시적 서버 오류입니다.");

				}
			});
			$('.bbsSub1').empty();
			$('.bbsDate1').empty();
			$('.bbsName1').empty();
			$.ajax({
				type: 'POST',
				url: './branchReview',
				data: id,
				dataType: 'json',
				success: function (data) {
					console.log(data);
					$.each(data, function (idx, val) {
						if (idx === 0) {
							$('.bbsSub1').empty().append(val.title);
							$('.bbsDate1').empty().append(val.calendar);
							$('.bbsName1').empty().append(val.nickName);
							$('.bbsSub2').empty();
							$('.bbsDate2').empty();
							$('.bbsName2').empty();
						} else if (idx === 1) {
							$('.bbsSub2').empty().append(val.title);
							$('.bbsDate2').empty().append(val.calendar);
							$('.bbsName2').empty().append(val.nickName);
						}
						console.log(val.clientID);
						console.log(val.title);
						console.log(val.calendar);

					});
				},
				error: function () {
					alert("일시적 서버 오류입니다.");

				}
			});
			$.ajax({
				type: 'POST',
				url: './waitingList',
				data: id,
				success: function (data) {
					if (data === 100) $('.modalStatus').css('display', 'none');
					else {
						$('.modalStatus').css('display', 'inline-block');
						$('.ticketingText').empty().append(data + ' 명');
					}
				},
				error: function () {
					alert("일시적 서버 오류입니다.");
				}
			});
			$.ajax({
				type: 'POST',
				url: './ticketingCheck',
				data: id,
				success: function (data) {

					if (data === 1001)          // 1001 === 비회원
					{
						$('.ticketingBtn').empty().append('대기 시작');
					}
					else if (data !== 0)        // 대기중인 회원
					{
						$('.ticketingBtn').empty().append('대기 중');
						$('.ticketingBtn').off("click");
					}
					else                        // 대기x 회원
					{
						$('.ticketingBtn').empty().append('대기 시작');
						$('.ticketingBtn').attr('href','#').attr('rel','');
					}
				},
				error: function () {
					alert("일시적 서버 오류입니다.");
				}
			});

			$('.ticketingBtn').click(function () {
				$.ajax({
					type: 'POST',
					url: './ticketingStart',
					data: id,
					success: function () {
						var ticketingNum = $('.ticketingText').text();
						console.log(ticketingNum);
						var resultNum = ticketingNum.slice(0, ticketingNum.length - 2);
						console.log(resultNum);
						$.ajax({
							type: 'POST',
							url: './waitingList',
							data: id,
							success: function (data) {
								if (data === 100) $('.modalStatus').css('display', 'none');
								else {
									alert(data);
									$('.modalStatus').css('display', 'inline-block');
									$('.ticketingText').empty().append(data + ' 명');
								}
							},
							error: function () {
								alert("일시적 서버 오류입니다.");
							}
						});
					},
					error: function () {
						alert('로그인 해주시기 바랍니다.');
						location.href = "./";
					}
				});
			});


			// 매장 detail 페이지에 db정보 추가
			$('.detailModalTopTitle').empty().append(branchName);
			$('.modalAddress').empty().append(roadAddress);
			$('.modalJibunAddress').empty().append('(우) ' + zoneCode + ' (지번) ' + jibunAddress);
			$('.modalPhoneNum').empty().append(phoneNum);
			$('.modalOpTime').empty().append(opTime);
			$('.modalBreakTime').empty().append(breakTime);
			$('.modalOpDay').empty().append(opDate);
			$('.modalExplain').empty().append(branchExplain);
			$('.categorySpan').empty().append(sido + ' ' + sigungu);
			$('.modalStatus').css('display', 'none');

			// // 리뷰게시판의 평점 평균을 불러옴
			$.ajax({
				type: 'POST',
				url: './loadReviewScoreAvg',
				data: id,
				dataType: 'text',
				success: function (data) {
					if(data === '6.0') $('.modalScore').empty().append('평점 : ' + '평가없음' + ' / 5.0');
					else $('.modalScore').empty().append('평점 : ' + data + ' / 5.0');
				},
				error: function () {
					alert("일시적 서버 오류입니다.");
				}
			});

			$('.gallerymain').attr('src', imagePath + image1);
			$('.gallerylink').attr('href', imagePath + image1);

			for (i = 1; i < 9; i++) {
				$('.img' + [i]).attr('src', imagePath + (image1.substring(0, 12)) + i + '.jpg');
				$('.imgLink' + [i]).attr('href', imagePath + (image1.substring(0, 12)) + i + '.jpg');
			}
		}
