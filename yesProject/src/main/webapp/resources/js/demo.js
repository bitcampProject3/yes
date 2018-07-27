// Call this from the developer console and you can control both instances

var calendars = {};

$(document).ready( function() {

	
    // Assuming you've got the appropriate language files,
    // clndr will respect whatever moment's language is set to.
    // moment.locale('ru');

    // Here's some magic to make sure the dates are happening this month.
    var thisMonth = moment().format('YYYY-MM');
    // Events to load into calendar

    calendars.clndr2 = $('.cal2').clndr({
        clickEvents: {
            today: function () {
                console.log('Cal-1 today');
            },
            onMonthChange: function () {
                console.log('Cal-1 month changed');
            },
            onYearChange: function () {
                console.log('Cal-1 year changed');
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

});