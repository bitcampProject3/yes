
		function reserveModal(name, id) {
			$('.modalTopSpan').empty().append(name + ' 예약');
			$('.reserveTimeDiv').attr('id', id);
		}




		function insertReserve() {

			var times = $('.resultTimeDiv').text();
			var time = times.slice(times.length - 5, times.length);
			if (time.length === 4) time = '0' + time;
			console.log(time);

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
				dataType: "json",
				success: function (data) {
					alert('ajax-success');
				},
				error: function (request, status, error) {
					alert("예약 완료");
					console.log(request);
					console.log(status);
					console.log(error);
					// location.href = "/yes/";
				}
			})

		}