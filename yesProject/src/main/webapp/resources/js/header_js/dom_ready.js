
//새로고침 (오류나면 지우기)
var member='${member.registNum}';
var id='${member.id}';
if(member>=0 && id!='admin'){window.setInterval("count()",10000);}

function count(){

    $.ajax({
        url:'./count',
        method:'POST',
        data:{'registNum':member},
        success:function(data){
            //대기인원을 추가해야함
            if(data.slice(0,2)=='사업'){
                var tmp=data.slice(2,4);
                console.log(tmp);
                $('#slide-menu4 h2').empty().append("대기인원:"+tmp);
                }
            else if(data.slice(0,2)=='고객'){
                var tmp2=data.slice(2);
                var tmp3=tmp2.split('/');
                $('#slide-menu2 h2').empty().append("대기번호:"+tmp3[0]+"<br/>"+"현재번호:"+tmp3[1]);

                }
            else{
                $('#slide-menu2 h2').empty().append(data);
            }


        }
    });
}

//-----------------------------//



var state=false;


var calendars = {};
var days=new Array();

jQuery(document).ready(function(){



    $('#slide').animate(
            {right:-300},'slow'
            );
    $('#mypage').click(function(){
        count();
        //클릭할 때 마다 비동기통신
        $('body').css('overflow-y','hidden');
        $('#slide').css({"display":"inline-block"});
        $('#slide').animate(
         {right:0,},'slow');

    $.ajax({
        url:'./loadReserve',
        method:'POST',
        success:function(list){
            if(list.length==0) //예약한 내역이 없을 때 처리..
                {
                calendars.clndr2 = jQuery('.cal2').clndr2({
                    clickEvents: {
			            onMonthChange: function () {
			                console.log('monthChange');
			            },
			            onYearChange: function () {
			                console.log('yearChange');
			            }
			        },
			        multiDayEvents: {
			            singleDay: 'date',
			            endDate: 'endDate',
			            startDate: 'startDate'
			        }
			    });
            }//if문끝


            for (var i = 0; i < list.length; i++) {
				var day=(list[i].reserveTime).slice(0,10);
				days.push(day);
				$('.calendar2-day-'+day+'').css({'background-color':'#FFA7A7',
												'border-radius':'50%'});

				calendars.clndr2 = jQuery('.cal2').clndr2({
					ready: function(){
						for (var i = 0; i < list.length; i++) {
			                var day=(list[i].reserveTime).slice(0,10);
							$('.calendar2-day-'+day+'').css({'background-color':'#FFA7A7',
								'border-radius':'50%'});
		                }
					},
			        clickEvents: {
			            onMonthChange: function () {
			                for (var i = 0; i < list.length; i++) {
			                var day=(list[i].reserveTime).slice(0,10);
							$('.calendar2-day-'+day+'').css({'background-color':'#FFA7A7',
								'border-radius':'50%'});
			                }
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


            }//for end...

        }//success end
        });



    });
     $('#close').click(function(){
        $('#slide').animate(
        {right:-300},'slow'
        );
        $('body').css('overflow-y','auto');
     });

    $("#logout").click(function(){
       $.ajax({
            type : "POST",
            dataType : 'text',
            url : "http://nid.naver.com/nidlogin.logout",
            crossDomain : true,
            xhrFields : {
               withCredentials : true
            }
         }).done(function(data) {
            $('#logout').submit();
         }).fail(function(xhr, textStatus, errorThrown) {
            $('#logout').submit();
         });
    });


    //지도

    $("#searchBox").slideToggle('slow', function(){});
    // searchBox open / close
    $('#searchIcon1').click(function() {
        $('#searchIcon1').toggleClass('flip');
        $('#searchBox').slideToggle('slow', function() {
            // 객체가 다 펼치지거나 접히고 나면 여기에 든 내용이 실행된다.
        });
    });
});