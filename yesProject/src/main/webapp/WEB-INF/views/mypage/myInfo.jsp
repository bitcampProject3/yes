<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>         
<!Doctype html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
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
	
	
	</style>
	<script>


	$(document).ready(function(){
		$('.update').click(function(){
			 
			 $('#myInfo_pw').attr('readonly', false); 
			 $('#myInfo_nickName').attr('readonly', false); 
			 $('#myInfo_email').attr('readonly', false); 
			 $('#myInfo_phoneNum').attr('readonly', false); 
			 $('#myInfo_registNum').attr('readonly', false); 
			 
		});	
		
		$('.del').click(function(){
			var id=$('#myInfo_id').val();
			
			$.ajax({
		     type:"POST",
		     url:"./deleteUser",
		     data:{"id":id},
		  	 success:function(data){
		  		 if(data=='성공')
		  		 	location.href='/yes/';
		  		 else
		  			 alert(data);
		  	 } 
				
			});
		});
		
		
			$('#updateform').validate({
    			rules:{
    				password:{required:true,minlength:4},
    				registNum:{required:true},
    				nickName:{required:true,
    						  minlength:2},
    				phoneNum:{required:true,
    					      minlength:13,
    					      maxlength:13},
    				email:{required:true,
    						email:true}
    				
    			},
    			
    			messages:{
    				password:{
    					required:"필수정보입니다",
    					minlength:"최소 4자 이상 입력하세요"
    				},
    				myInfo_registNum:{
    					required:"필수정보입니다",
    					number:"올바른 값을 입력해주세요"
    				},
    				myInfo_nickName:{
    					required:"필수정보입니다",
    					minlength:"최소 2자 이상 입력하세요"
    				},
    				myInfo_phoneNum:{
    					required:"필수정보입니다",
    					number:"올바른 값을 입력해주세요",
    					minlength:"",
    					maxlength:""
    					},
    				myInfo_email:{
    					required:"필수정보입니다",
    					email:"이메일 주소를 입력해주세요"
    				}
    			},
    			
    			errorPlacement:function(error,element){
    				if(element.is(".form-control"))
    					{
    					error.appendTo(element.next());
    					}
    				else{
    					
    				}
    			},
    			submitHandler:function(){
    				$.css({cursor:"wait"});
    				$('#updateform').submit();
    			},
    			success:function(element){
    				$('.update').attr('type','submit');
    			}
    			
    		});
		});
	 
	
	</script>

    </head>
    <body id="body" style="overflow-y:scroll; z-index:0; position:relative;">
       <jsp:include page="../layout/header.jsp"></jsp:include>
        <div class="container">
           
           <div class="container" style=" border-bottom: 1px solid #CCCCCC; padding-left:0px; padding-right:0px; 
               border-bottom-color: #e04f5f; margin-top:30px;">
                
              <div class="col-sm-9" style="width: 100%; padding-left: 14px; padding-right:14px;  ">
                  <h1 style="padding: 5px; margin-bottom: 20px; ">
                      <a href="" style="color: black;">내정보</a>
                  </h1>

              </div>
            </div>
         
        <form id="updateform"action="mypageUpdate" method="POST" class="form-horizontal" style="width:100%;height:100%">
		  
		<table class="table" style="width:50%; margin:50px auto; border:1px solid gray; ">
  
			<tbody>
			<tr>
			<td class="table-label">이름</td>
			<td>${user.name }
			<input type="hidden" class="form-control" id="myInfo_id" name="id" value="${user.id }"/>
			</td>
			</tr>
			<tr>
			<td class="table-label">비밀번호</td>
			<td><input type="text" class="form-control" id="myInfo_pw" name="password" value="${user.password }" readonly="readonly"/>
			<p style="margin: 0px;text-align: left;"></p>
			</td>
			
			</tr>
			<tr>
			<td class="table-label">닉네임</td>
			<td><input type="text" class="form-control" id="myInfo_nickName" name="nickName" value="${user.nickname }" readonly="readonly"/>
			<p style="margin: 0px;text-align: left;"></p>
			</td>
			</tr>
			<tr>
			<td class="table-label">이메일</td>
			<td><input type="text" class="form-control" id="myInfo_email" name="email" value="${user.email }" readonly="readonly"/>
			<p style="margin: 0px;text-align: left;"></p>
			</td>
			</tr>
			<tr>
			<td class="table-label">연락처</td>
			<td><input type="text" class="form-control" id="myInfo_phoneNum" name="phoneNum" value="${user.phoneNum }" readonly="readonly"/>
			<p style="margin: 0px;text-align: left;"></p>
			</td>
			</tr>
			<tr>
			<td class="table-label">생년월일</td>
			<td>${user.birthDate }</td>
			</tr>
			<c:if test="${user.registNum != '0' }"> 
			<tr>
			<td class="table-label">사업자 등록 번호</td>
			<td><input type="text" class="form-control" id="myInfo_registNum" name="registNum" value="${user.registNum }" readonly="readonly"/>
			<p style="margin: 0px;text-align: left;"></p>
			</td>
			</tr>
			</c:if> 
			<tr>
			</tr>
		
			
			</tbody>
		
		</table>  
		  
		  
        <div style="float:right;">
		<input type="button" class="btn btn-default update" style="margin:0px auto; " value="수정"/>
		<a id="modal" href="#deletebtn" rel="modal:open" class="btn btn-danger delete" >회원탈퇴</a>
         </div>
		</form>
            
       	</div>
       	
   		<div id="deletebtn" class="modal modal2" style="display:none;">
                   	 <p>회원 탈퇴시 개인 정보는 모두 삭제됩니다. 진행하시겠습니까?</p>
			          <div style="width:100%; text-align:center;">
                   	  <a href="#" class="btn btn-default del" >예</a>
			          <a id="closebtn" href="#" class="btn btn-default" rel="modal:close">아니오</a>
			          </div>
		</div>
    </body>
</html>