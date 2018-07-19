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
       
        <!-- jQuery Validation -->
        <script src="./js/jquery.validate.js"></script> 
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


        <!-- jQuery Modal -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />



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
	}
	
	.table a{
	
	color:black;
	display:inline-block;
	text-decoration: none;
	}
	
	</style>
	
	<script>
	
	
	function detail(e,e2)
	{
			$('#branchName').empty();
			$('#branchAddr').empty();
			$('#branchAddr2').empty();
			$('#branchPhone').empty();
			$('#branchDate').empty();
			$('#branchTime').empty();
			$('#request').empty();
			
		 $.ajax({
		url:'./branchInfo',
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
			$('#request').append(e2);
		}
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
            
            
	        <div id="ex1" class="modal">
	          <h1 id="branchName"style="text-align:center"></h1>
	          <p id="branchAddr" style="text-align:center; font-size:20px;"></p>
	          <p id="branchAddr2" style="text-align:center; font-size:20px;"></p>
	          <p id="branchPhoneNum" style="text-align:center; font-size:20px;"></p>
	          <p id="branchDate" style="text-align:center; font-size:20px;"></p>
	          <p id="branchTime" style="text-align:center; font-size:20px;"></p>
	          <p id="request" style="text-align:center; font-size:20px;"></p>
	          <a href="#" rel="modal:close">Close</a>
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
                    	<tr>
                    	<td>${status.count }</td>
                    	<td><a id="modal"href="#ex1" rel="modal:open" onclick="javascript:detail('${bean.branchID}','${bean.request }');">${bean.branchName }</a></td>
                    	<td>${bean.reserveTime }</td>
                    	<td>${bean.personel }</td>
                    	<td>${bean.request }</td>
                    	<td>${bean.useState }
                     	<c:if test="${bean.useState eq 'Y' }">
                    	<a style="margin-left:20px; font-size: 12px;" class="btn btn-default" >리뷰작성</a>
                    	</c:if>
                     	<c:if test="${bean.useState eq 'N' }">
                    	<a href="#" style="margin-left:20px; font-size: 12px; color:red"  >예약취소</a>
                    	</c:if>
                    	</td>
                    	</tr>
						</c:forEach>
                    
                    </tbody>
                   </table>
                   
                   
                   
                   
                   
                   
                   
                   
                   </article>
                   </section>
                </div>

            </div>
            </div>      
                
       
    </body>
</html>