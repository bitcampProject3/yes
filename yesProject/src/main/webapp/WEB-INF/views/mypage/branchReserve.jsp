<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>         
<!Doctype html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
	    
	<style>
	
	.table-label{
		font-size:20px;
		text-align:center;
		background-color:RGB(255,212,212);
		height:100px;
		padding-top:20px;
		
	}
	
	.table input{
	
		width:100%;
		height:50px;
	}
	
	 input.error

			{
			        border: 1px solid red
			}

	 p.error
			
			{
			        display:block;
			        color:red;
			} 
	#deletebtn{
	
		width:400px;
		height:100px;
		overflow:visible;
	}
	#deletebtn a{
	 	float:right;
	}
	
	.table a{
	
		color:black;
		display:inline-block;
		text-decoration: none;
	}
	#ex1{
		max-width:800px;
		max-height:500px;
		height: 500px;
		overflow: visible;
	}
	#ex1 table {
	font-size:13px;
	margin-top:10px;
	width:100%;
	overflow:scroll;
	}
	
	</style>

    
	
    </head>
    <body style="overflow:auto; z-index:0; positio:relative;">
    
    
       <jsp:include page="../layout/header.jsp"></jsp:include>
        <div class="container" style=" border-bottom: 1px solid #CCCCCC;">
           
           <div class="container" style=" border-bottom: 1px solid #CCCCCC; padding-left:0px; padding-right:0px; 
               border-bottom-color: #e04f5f; margin-top:30px;">
                
              <div class="col-sm-9" style="width: 100%; padding-left: 14px; padding-right:14px;  ">
                  <h1 style="padding: 5px; margin-bottom: 20px; ">
                      <a href="#" style="color: black;">예약 현황</a>
                  </h1>

              </div>
            </div>
            
            <div class="cal1"></div>

		</div>
		<div id="ex1" class="modal" style="width:1000px; height:300px; ">
			<h1 style="border-bottom:1px solid red; ">예약현황 리스트</h1>
			<table class="table">
				<thead>
				<tr id="table-header" >
					<th>고객이름</th>
					<th>예약 시간</th>
					<th>인원</th>
					<th>요청사항</th>
					<th>이용완료</th>
				</tr>
				
				</thead>
				<tbody>
				</tbody>
			</table>
						
		</div>
    
    <script type="text/javascript">
    	
    	
          	var target;
            var thisMonth = moment().format('YYYY-MM');
            var changeMonth=parseInt(thisMonth.slice(5,7));
            var changeYear=parseInt(thisMonth.slice(0,4));
            var compare;
            
  			function dataload(){
  				var array=new Array();
  				
  				
  				<c:forEach items="${alist }" var="bean" varStatus="status" >
				var nalja='${bean.reserveTime}';
				var day='calendar-day-'+nalja.slice(0,10);
				
				var time=nalja.slice(11,16);
				$('.'+time+'').remove();
  		
				
				var client=new Object();
  				client.day=nalja.slice(0,10);
  				client.clientID='${bean.clientID}';
				client.name='${bean.name}';
				client.personel='${bean.personel}';
				client.request='${bean.request}';
				client.time=time;
				client.useState='${bean.useState}';
				
				array.push(client);
				
				</c:forEach>
				
				
				for (var i = 0; i < array.length; i++) {
					
					$('.tr'+i).remove();
				}
				
				
  				return array;
  			}
  			
  			
  			function modal(array){
  				
	            if(changeMonth>9){
	            	
	            	compare=changeYear+'-'+changeMonth;
	            }
	            else{
	            compare=changeYear+'-0'+changeMonth;
	            }
	            
				for (var i = 0; i < array.length; i++) {
					var day=array[i].day.slice(0,7);
					
					if(day==compare){
						target='calendar-day-'+array[i].day.slice(0,10);
						console.log(i);
						$('.calendar-day-'+array[i].day+'').children().append('<div class="time">'+array[i].time+'</div>');
 					
						
						$('.table tbody').append('<tr class="tr'+i+'">');
						$('.table tbody .tr'+i).append('<td style="width:15%">'+array[i].name+'</td>');
						$('.table tbody .tr'+i).append('<td>'+array[i].time+'</td>');
						$('.table tbody .tr'+i).append('<td>'+array[i].personel+'</td>');
						$('.table tbody .tr'+i).append('<td style="width:60%; text-overflow:ellipsis; font-size:10pt;">'+array[i].request+'</td>');
						$('.table tbody .tr'+i).append('<td>'+array[i].useState+'</td>');
						$('.table tbody').append('</tr>');
					}
  				
  				
  				}
				
				$('.'+target+'').click(function(){
					$('#ex1').modal('show');
				});
				
				
				
  			}
    	
	        var calendars = {};
	        
	        
	        jQuery(document).ready(function() {
	        	

	            if(changeMonth>9){
	            	
	            	compare=changeYear+'-'+changeMonth;
	            }else{
	            compare=changeYear+'-0'+changeMonth;
	            }
	            
	            // Events to load into calendar
	            var eventArray = [];
	            
	        	var array=dataload();
				if(array.length!=0){
					for (var i = 0; i < array.length; i++) {
						var day=array[i].day.slice(0,7);
						if(day==compare){
							target='calendar-day-'+array[i].day.slice(0,10);
							$('.calendar-day-'+array[i].day+'').children().append('<div class="time">'+array[i].time+'</div>');
	 						$('.table tbody').append('<tr class="tr'+i+'">');
							$('.table tbody .tr'+i).append('<td style="width:15%">'+array[i].name+'</td>');
							$('.table tbody .tr'+i).append('<td>'+array[i].time+'</td>');
							$('.table tbody .tr'+i).append('<td>'+array[i].personel+'</td>');
							$('.table tbody .tr'+i).append('<td style="width:60%; text-overflow:ellipsis;  font-size:10pt;">'+array[i].request+'</td>');
							$('.table tbody .tr'+i).append('<td>'+array[i].useState+'</td>');
							$('.table tbody').append('</tr>')
						}

		            calendars.clndr1 = jQuery('.cal1').clndr({
		                events: eventArray,
		                clickEvents: {
		                    click: function (target) {
		                        console.log('Cal-1 clicked: ', target);
		                    },
		                    nextMonth:function(){
								changeMonth=changeMonth+1;
		                    },
		                    previousMonth:function(){
		                    	changeMonth=changeMonth-1;
		                    },
		                    onMonthChange: function () {
		                    	array=dataload();
		                    	modal(array);
		                    },
		                    nextYear: function () {
		                    	changeYear=changeYear+1;
		                    },
		                    previousYear: function () {
		                    	changeYear=changeYear-1;
		                    },
		                    onYearChange: function () {
		                    	array=dataload();
		                    	modal(array);
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

					
					}
					
					$('.'+target+'').click(function(){
						$('#ex1').modal('show');
					});
					
				}
				else{
					 calendars.clndr1 = jQuery('.cal1').clndr({});
					 
					
				}

	        
	        });//end
	        
          </script>
    </body>
</html>