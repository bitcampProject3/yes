// Call this from the developer console and you can control both instances
var calendars = {};
// var newjQuery = $.noConflict();
jQuery(document).ready( function() {
    // Assuming you've got the appropriate language files,
    // clndr will respect whatever moment's language is set to.
    // moment.locale('ru');

    // Here's some magic to make sure the dates are happening this month.
    var thisMonth = moment().format('YYYY-MM');
    // Events to load into calendar
    var eventArray = [
        {
            title: 'Multi-Day Event',
            endDate: thisMonth + '-14',
            startDate: thisMonth + '-10'
        }, {
            endDate: thisMonth + '-23',
            startDate: thisMonth + '-21',
            title: 'Another Multi-Day Event'
        }, {
            date: thisMonth + '-27',
            title: 'Single Day Event'
        }
    ];
    // The order of the click handlers is predictable. Direct click action
    // callbacks come first: click, nextMonth, previousMonth, nextYear,
    // previousYear, nextInterval, previousInterval, or today. Then
    // onMonthChange (if the month changed), inIntervalChange if the interval
    // has changed, and finally onYearChange (if the year changed).



    calendars.clndr3 = jQuery('#calendar').clndr3({
        clickEvents: {
            click: function (target) {
				$('.selectTimeContentDiv').empty();
				$('.resultTimeDiv').empty();
            	var personel = $('.reservePersonelInput').val();
				console.log(personel);
            	if (personel === '') { // noinspection JSAnnotator
		            alert('인원을 입력하여 주십시오');
	            }else {

		            console.log('Cal-1 clicked: ', target);
		            var branchid = jQuery('.reserveTimeDiv').attr('id'),
			            targetDate = target.date._i;

		            var yyyymmdd = targetDate.split('-');
		            var yyyy = yyyymmdd[0],
			            mm = yyyymmdd[1],
			            dd = yyyymmdd[2];


		            $('.selectTimeTopDiv').empty().append(yyyy + '년 ' + mm + '월 ' + dd + '일' + ' 예약 가능 시간');

		            jQuery.ajax({
			            type: 'POST',
			            url: 'reservepreview',
			            data: {'id': branchid, 'date': targetDate},
			            success: function (data) {
				            // $('.timeSelect').empty();
							$('#targetDate').val(targetDate);
				            $('.selectTimeDiv').css('display', 'inherit');


				            for (i = 0; i < data.length; i++) {
					            $('.selectTimeContentDiv').append('<div class="selectTimeContent selectTime' + i + '">' + data[i] + '</div>');
					            $('.selectTime' + i).css('margin-right', '7px');
					            if ((i % 5) === 4) $('.selectTime' + i).css('margin-right', '0px');


					            $('.selectTime' + i).click(function () {

						            $('.selectTimeContent').css('background-color', 'white');
						            $(this).css('background-color', '#ebebeb');
									var thisTime = $(this).text();
									console.log(thisTime);
						            $('.resultTimeDiv').empty().append(yyyy + '년 ' + mm + '월 ' + dd + '일 ' + personel + '명 ' + thisTime);
					            });


				            }

				            $('.selectTimeContent').css({
					            'width': '50px',
					            'height': '25px',
					            'display': 'inline-block',
					            'border': ' 1px solid gray',
					            'margin-bottom': ' 5px',
					            'text-align': ' center'
				            });
			            },
			            error: function (request, status, error) {
				            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				            console.log(error);
			            }
		            });
	            }

            },
            today: function () {
                console.log('Cal-1 today');
            },
            nextMonth: function () {
                console.log('Cal-1 next month');
            },
            previousMonth: function () {
                console.log('Cal-1 previous month');
            },
            onMonthChange: function () {
                console.log('Cal-1 month changed');
            },
            nextYear: function () {
                console.log('Cal-1 next year');
            },
            previousYear: function () {
                console.log('Cal-1 previous year');
            },
            onYearChange: function () {
                console.log('Cal-1 year changed');
            },
            nextInterval: function () {
                console.log('Cal-1 next interval');
            },
            previousInterval: function () {
                console.log('Cal-1 previous interval');
            },
            onIntervalChange: function () {
                console.log('Cal-1 interval changed');
            }
        },
        multiDayEvents: {
            singleDay: 'date',
            endDate: 'endDate',
            startDate: 'startDate'
        },
        showAdjacentMonths: true,
        adjacentDaysChangeMonth: false
    });
    // Bind all clndrs to the left and right arrow keys
    jQuery(document).keydown( function(e) {
        // Left arrow
        if (e.keyCode == 37) {
            calendars.clndr1.back();
        }

        // Right arrow
        if (e.keyCode == 39) {
            calendars.clndr1.forward();
        }
    });
});