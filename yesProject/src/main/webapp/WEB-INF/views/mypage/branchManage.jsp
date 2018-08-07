<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>         
<!Doctype html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

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
			var tmpCount=0;
			var entryR;
			$(function(){
				
				var result;
				for (var i = 0; i < max; i++) {
				var state='${bean.tableState}';
					$('#area').append('<div id="table'+i+'">false</div>');
					
					if(state>0)
					{
						for(var j=0; j<state; j++){
							
							$('#table'+j+'').css({'background-color':'#FFA7A7',
							'color':'#FFA7A7'});
							$('#table'+j+'').text("true");
						}
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
							console.log("대기인원"+tmpCount);
							console.log("entry"+entry);
							if(state==max && tmpCount>0) //현재 입장번호 바뀌고 입장하기..
							{
								entryR="입장";
								++entry;
							}
							}
						}
						else{ //좌석이 빠질 때 
							$('#'+id+'').css({'background-color':'white',
								'color':'white'});
							$('#'+id+'').empty().append('false');
							if(state>0)
							{
								console.log("현재"+state+"명");
								console.log("대기"+tmpCount+"명");
								if(state==max && tmpCount>0){ //대기가 있을 경우에--
									console.log(entry);
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
										tmpCount=data;
										console.log("?"+tmpCount);
										$('#slide-menu4 h2').empty().append("대기인원:"+tmpCount+"명");
										
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