
		function reserveModal(name, id) {
			$('.modalTopSpan').empty().append(name + ' 예약');
			$('.reserveTimeDiv').attr('id', id);
		}




		function insertReserve() {

			var times = $('.resultTimeDiv').text();

			if (times === ''){
				alert('예약할 시간을 선택해 주시기 바랍니다.');
			}else{

				var time = times.slice(times.length - 5, times.length);
				if (time.length === 4) time = '0' + time;


				var data = {};
				data.targetDate = $('#targetDate').val() + '-' + time;
				data.targetPersonel = $('.reservePersonelInput').val();
				data.targetRequest = $('.reserveRequestInput').val();
				data.targetBranch = $('.reserveTimeDiv').attr('id');

				$.ajax({
					type: "POST",
					url: "insertReserve",
					data: JSON.stringify(data),
					contentType: "application/json; charset=UTF-8",
					dataType: "text",
					success: function (data) {
						if (data === "loginError") alert("로그인이 필요한 서비스입니다.");
						else alert("예약 완료");
						location.href = "/yes/";
					},
					error: function (request, status, error) {
						location.href = "/yes/";
					}
				})
			}

		}