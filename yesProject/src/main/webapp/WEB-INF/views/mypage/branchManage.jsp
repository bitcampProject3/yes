<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>         
<!Doctype html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
        <link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Jua|Nanum+Gothic" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/selectDesign.css">
        <link rel="stylesheet" href="./css/mapStyle.css">
        <link rel="stylesheet" href="./css/mainStyle.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="./js/jquery.validate.js"></script> 
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

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
	#area div{
		float:left;
		width:100px; 
		height:100px; 
		border:1px solid red; 
		border-radius:5px; 
		margin:10px;
		color:white;
		
	
	}	
	
	</style>
	<script>
	
	</script>

    </head>
    <body style="overflow:auto; z-index:0; positio:relative;">
       <jsp:include page="../layout/header.jsp"></jsp:include>
        <div class="container" style=" border-bottom: 1px solid #CCCCCC;">
           
           <div class="container" style=" border-bottom: 1px solid #CCCCCC; padding-left:0px; padding-right:0px; 
               border-bottom-color: #e04f5f; margin-top:30px;">
                
              <div class="col-sm-9" style="width: 100%; padding-left: 14px; padding-right:14px;  ">
                  <h1 style="padding: 5px; margin-bottom: 20px; ">
                      <a href="" style="color: black;">매장 관리</a>
                  </h1>

              </div>
            </div>
         
			<!-- 여기다가 -->
			<script>
			var max='${bean.maxTable}';
			var entry=${bean.waitingNum}; //처음에 0임
			var count;
			var entryR;
			$(function(){
				
				var result;
				for (var i = 0; i < max; i++) {
				var state='${bean.tableState}';
					$('#area').append('<div id="table'+i+'">false</div>');
					
					if(state>0)
					{
						for(var j=0; j<state; j++)
							$('#table'+j+'').css({'background-color':'#FFA7A7',
							'color':'#FFA7A7'});
					}
					
					$('#table'+i).click(function(e){
						var id=e.target.id;
						result=$('#'+id).text();
						if(result=='false'){							
						$('#'+id+'').css({'background-color':'#FFA7A7',
							'color':'#FFA7A7'});
						$('#'+id+'').empty().append('true');
						if(state<=max)
							{
							state++;
							if(state==8 && entry>0) //현재 입장번호 바뀌고 입장하기..
							{
								entryR="입장";
							}
							}
						}
						else{ //좌석이 빠질 때 
							$('#'+id+'').css({'background-color':'white',
								'color':'white'});
							$('#'+id+'').empty().append('false');
							if(state>0)
							{
								if(state==max && count>0){ //대기가 있을 경우에--
									entry++;
								}
								state--;
							}
							
						}
					
						 $.ajax({
								url:'./manageTable',
								method:'POST',
								data:{'state':state,
									  'entry':entry,
									  'entryR':entryR},
								success:function(data){
									//대기인원을 추가해야함
									if(data>0){ //대기 인원이 있으면...
										count=data;
										$('#slide-menu4 h2').empty().append("대기인원:"+data+"명");
									
									}
								}
							}); 
					
					
					});//click end...
					
					
				}//for end
				
				
				$('#reset').click(function(){
					 $.ajax({
							url:'./manageTable',
							method:'POST',
							data:{'state':0,
								'entry':0,
								'end':'end'},
							success:function(data){
								
								for (var i = 0; i < max; i++) {
									$('#table'+i+'').css({'background-color':'white',
										'color':'white'});
									$('#table'+i+'').empty().append('false');
								}
							}
						}); 
				});
			});
			</script>
			<div id="area" style="width:100%">
			<p>테이블
			<button id="reset">영업종료</button>
			</p>
			
			</div>
			
       	</div>
    </body>
</html>