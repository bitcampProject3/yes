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
	 		
	 		
			$('#updateform').validate({
    			focusout:true,
    			onsubmit:false,
    			onkeyup: true,
    			rules:{
    				password:{required:true,minlength:4},
    				registNum:{required:true,number:true},
    				nickName:{required:true,
    						  minlength:2},
    				phoneNum:{required:true,
    					      number:true,
    					      minlength:11,
    					      maxlength:11},
    				email:{required:true,
    						email:true},
    				
    			},
    			
    			messages:{
    				password:{
    					required:"필수정보입니다",
    					minlength:"최소 4자 이상 입력하세요"
    				},
    				registNum:{
    					required:"필수정보입니다",
    					number:"올바른 값을 입력해주세요"
    				},
    				nickName:{
    					required:"필수정보입니다",
    					minlength:"최소 2자 이상 입력하세요"
    				},
    				phoneNum:{
    					required:"필수정보입니다",
    					number:"올바른 값을 입력해주세요",
    					minlength:"",
    					maxlength:""
    					},
    				email:{
    					required:"필수정보입니다",
    					email:"이메일 주소를 입력해주세요"
    				},
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
    				
    			}
    			
    		});
		});
	 
	
	</script>

    </head>
    <body style="overflow:auto; z-index:0; positio:relative;">
       <jsp:include page="../layout/header.jsp"></jsp:include>
         <br/>
         <h1>예약 현황</h1>
         
       
         
            
       
    </body>
</html>