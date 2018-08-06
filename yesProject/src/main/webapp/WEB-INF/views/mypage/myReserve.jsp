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
	
	 input.error

			{
			        border: 1px solid red
			}

	 p.error
			
			{
			        display:block;
			        color:red;
			} 
	#ex1{
	
	width:500px;
	height:500px;
	overflow:visible;
	display:none;
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
	
	</style>
	
	<script>
	var array=[];
	function del(e,e2){
		 
		 $('#del').click(function(){
			 var int2=e2-1;
			console.log(array[int2]);		
 			 $.ajax({
					url:'./delreserve',
					method:'POST',
					data:{'time':array[int2]},
					success:function(data){
						location.href='.'+data;
					}
					});  
		 });
	 } 
	 
	 
	function detail(e,e2)
	{
			$('#branchName').empty();
			$('#branchAddr').empty();
			$('#branchAddr2').empty();
			$('#branchPhone').empty();
			$('#branchDate').empty();
			$('#branchTime').empty();
			
		$.ajax({
		url:'./member_branchInfo',
		method:'POST',
		data:{'id':e},
		dataType:'JSON',
		success:function(data){
		
			$('#branchName').append(data.branchName);
			$('#branchAddr').append(data.roadAddress);
			$('#branchAddr2').append(data.jibunAddress);
			$('#branchPhone').append(data.phoneNum);
			$('#branchDate').append(data.opDate);
			$('#branchTime').append(data.opTime);
		},
		error:function(request,status,error){
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
        
		}); 
	}
	
	</script>
	

    </head>
    <body style="overflow:auto; z-index:0; positio:relative;">
       <jsp:include page="../layout/header.jsp"></jsp:include>
        <div class="container" style=" border-bottom: 1px solid #CCCCCC;">
           
           <div class="container" style=" border-bottom: 1px solid #CCCCCC; padding-left:0px; padding-right:0px; 
               border-bottom-color: #e04f5f; margin-top:30px;">
                
              <div class="col-sm-9" style="width: 100%; padding-left: 14px; padding-right:14px;  ">
                  <h1 style="padding: 5px; margin-bottom: 20px; ">
                      <a href="" style="color: black;">예약 현황</a>
                  </h1>

              </div>
            </div>
            
            <!-- modal -->
            
            
	        <div id="ex1" class="modal modal3">
	            <div class="detailModalTop" style="width:500px;">
    				<div id="branchName" class="joinTitle">
    				매장이름
    				</div>
	            </div> 
	            <div style="height:400px; text-align:center;margin-top:100px;">
				<table style="width: 60%;margin: 0px auto;height: 100%; margin-top:20px;">
				<tr style="height:10%;">
				<td><img src="./imgs/detailImgs/placeholder.png"/></td>
				<td id="branchAddr"></td>
				</tr>
				<tr style="height:10%;">
				<td><img src="./imgs/detailImgs/signal.png"/></td>
				<td id="branchAddr2"></td>
				</tr>
				<tr style="height:10%;">
				<td><img src="./imgs/detailImgs/classic-phone.png"/></td>
				<td id="branchPhone"></td>
				</tr>
				<tr style="height:10%;">
				<td><img src="./imgs/detailImgs/calendar.png"/></td>
				<td id="branchDate"></td>
				</tr >
				<tr style="height:10%;">
				<td><img src="./imgs/detailImgs/time.png"/></td>
				<td id="branchTime"></td>
				</tr>																
				</table>
	            </div>
	        </div>
            
            
            <div style="padding-left: 40px; padding-right: 40px;">
      
                <header style="padding-top: 15px"></header>
                <div>
                   <section style="width: 100%; padding-bottom: 30px">
                   <article>
                   <table class="table">
                   <thead>
                    <tr>
                    	<th></th>
                        <th >가맹점 이름</th>
                        <th>예약 시간</th>
                        <th>인원</th>
                        <th style="width:30%;">요청 사항</th>
                        <th style="width:15%;">이용 현황</th>
                    </tr>
                    </thead>
                    <tbody>
						<c:forEach items="${rlist}" var="bean" varStatus="status">
						<script>
                     	array.push('${bean.reserveTime}');
                     	</script>
                    	<tr>
                    	<td>${status.count }</td>
                    	<td><a id="modal"href="#ex1" rel="modal:open" onclick="javascript:detail('${bean.branchID}','${bean.request }');">${bean.branchName }</a></td>
                    	<td class="myReserveTime '${status.index}'">${bean.reserveTime }</td>
                    	<td>${bean.personel }</td>
                    	<td>${bean.request }</td>
                    	<td>${bean.useState }
                     	<c:if test="${bean.useState eq 'Y' }">
                    	<a style="margin-left:20px; font-size: 12px;" class="btn btn-default" href="./review_write?branchID=${bean.branchID }" >리뷰작성</a>
                    	</c:if>
                     	<c:if test="${bean.useState eq 'N' }">

                    	<a id="modal" href="#deletebtn" rel="modal:open" style="margin-left:20px; font-size: 12px; color:red" onclick="javascript:del('${bean.reserveTime}','${status.count }');"  >예약취소</a>

                    	</c:if>
                    	</td>
                    	</tr>
						</c:forEach>
                    </tbody>

                   </table>
 <nav aria-label="Page navigation"style="text-align:center;">
  <ul class="pagination pagination-sm" >
    <li>
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>                  
                   
                   	 <div id="deletebtn" class="modal2" style="display:none; height:130px;">
                   	 <p>예약을 취소하시겠습니까?</p>
			          <a href="#" class="btn btn-default" rel="modal:close">아니오</a>
                   	  <a href="#" class="btn btn-default" id="del" >예</a>
                   	 </div>
                   
                   
                   </article>
                   </section>
                </div>

            </div>
            </div>      
                
       
    </body>
</html>