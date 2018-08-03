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
	.table-content{
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
	 	// $(document).ready(function(){
	 	//
	 	//
	 	//
	 	// 	$('#add').click(function(){
		// 		$('#form').css('display','inline-block');
		// 		$('#first').css('display','none');
	 	// 	});
	 	//
	 	//
	 	//
		// 	$('#updateform').validate({
    		// 	focusout:true,
    		// 	onsubmit:false,
    		// 	onkeyup: true,
    		// 	rules:{
    		// 		password:{required:true,minlength:4},
    		// 		registNum:{required:true,number:true},
    		// 		nickName:{required:true,
    		// 				  minlength:2},
    		// 		phoneNum:{required:true,
    		// 			      number:true,
    		// 			      minlength:11,
    		// 			      maxlength:11},
    		// 		email:{required:true,
    		// 				email:true},
    		//
    		// 	},
    		//
    		// 	messages:{
    		// 		password:{
    		// 			required:"필수정보입니다",
    		// 			minlength:"최소 4자 이상 입력하세요"
    		// 		},
    		// 		registNum:{
    		// 			required:"필수정보입니다",
    		// 			number:"올바른 값을 입력해주세요"
    		// 		},
    		// 		nickName:{
    		// 			required:"필수정보입니다",
    		// 			minlength:"최소 2자 이상 입력하세요"
    		// 		},
    		// 		phoneNum:{
    		// 			required:"필수정보입니다",
    		// 			number:"올바른 값을 입력해주세요",
    		// 			minlength:"",
    		// 			maxlength:""
    		// 			},
    		// 		email:{
    		// 			required:"필수정보입니다",
    		// 			email:"이메일 주소를 입력해주세요"
    		// 		},
    		// 	},
    		//
    		// 	errorPlacement:function(error,element){
    		// 		if(element.is(".form-control"))
    		// 			{
    		// 			error.appendTo(element.next());
    		// 			}
    		// 		else{
    		//
    		// 		}
    		// 	},
    		// 	submitHandler:function(){
    		// 		$.css({cursor:"wait"});
    		// 		$('#updateform').submit();
    		// 	},
    		// 	success:function(element){
    		//
    		// 	}
    		//
    		// });
		// });
	 
	
	</script>

    </head>
    <body style="overflow:auto; z-index:0; positio:relative;">
       <jsp:include page="../layout/header.jsp"></jsp:include>
        <div class="container" style=" border-bottom: 1px solid #CCCCCC;">
           
           <div class="container" style=" border-bottom: 1px solid #CCCCCC; padding-left:0px; padding-right:0px; 
               border-bottom-color: #e04f5f; margin-top:30px;">
                
              <div class="col-sm-9" style="width: 100%; padding-left: 14px; padding-right:14px;  ">
                  <h1 style="padding: 5px; margin-bottom: 20px; ">
                      <a href="" style="color: black;">매장정보</a>
                  </h1>

              </div>
            </div>
         <%----%>
        <%--<form id="updateform"action="mypageUpdate" method="POST" class="form-horizontal" >--%>
		  <%----%>
		<table class="table" style="width:50%; margin:50px auto; border:1px solid gray; ">
  <%----%>
			<tbody id="form">
			<%----%>
			<c:forEach items="articleList" var="bean">
			<tr>
			
			
			
			<td class="table-label">사업자 등록번호</td>
			<td class="table-content"><input type="text" class="form-control" id="registNum" name="registNum" value="${bean.registNum }"/>
			</td>
			</tr>
			</c:forEach>
			<%--<tr>--%>
			<%--<td class="table-label">상호명</td>--%>
			<%--<td><input type="text" class="form-control" id="branchName" name="branchName" value="${bean.branchName }"/>--%>
			<%--<p></p>--%>
			<%--</td>--%>
			<%----%>
			<%--</tr>--%>
			<%--<tr>--%>
			<%--<td class="table-label">주소</td>--%>
			<%--&lt;%&ndash;<td><input type="text" class="form-control" id="roadAddress" name="roadAddress" value="${bean.roadAddress}"/>&ndash;%&gt;--%>
			<%--<p></p>--%>
			<%--</td>--%>
			<%--</tr>--%>
			<%--<tr>--%>
			<%--<td class="table-label">영업시간</td>--%>
			<%--<td><input type="text" class="form-control" id="opDate" name="opDate" value="${bean.opDate }"/>--%>
			<%--<p></p>--%>
			<%--</td>--%>
			<%--</tr>--%>
			<%--<tr>--%>
			<%--<td class="table-label">메뉴</td>--%>
			<%--&lt;%&ndash;<td><input type="text" class="form-control" id="menu" name="menu" value="${bean.menu }"/>&ndash;%&gt;--%>
			<%--<p></p>--%>
			<%--</td>--%>
			<%--</tr>--%>
			<%--<tr>--%>
			<%--<td class="table-label">연락처</td>--%>
			<%--<td><input type="text" class="form-control" id="phoneNum" name="phoneNum" value="${bean.phoneNum }"/></td>--%>
			<%--</tr>--%>
			<%--<tr>--%>
			<%--<td class="table-label">카테고리</td>--%>
			<%--&lt;%&ndash;<td><input type="text" class="form-control" id="zoneCode" name="zoneCode" value="${bean.zoneCode }"/>&ndash;%&gt;--%>
			<%--<p></p>--%>
			<%--</td>--%>
			<%--</tr>--%>
			<%--<tr>--%>
			<%--<td colspan="2">--%>
			<%----%>
		<%--<button type="submit" class="btn btn-primary" style="margin:0px auto; width:100%;" >수정</button>--%>
			<%--</td>--%>
			<%----%>
			<%--</tr>--%>
		<%----%>
			<%----%>
			 <%--<c:if test="${bean == null }">--%>
			<%--<tbody id="first">--%>
			<%--<tr>--%>
			<%--<td colspan="2">등록된 매장이 없습니다</td>--%>
			<%--</tr>--%>
			<%--<tr>--%>
			<%--<td colspan="2" ><a id="add" href="#modal2" onclick="javascript:modalStep1();" rel="modal:open" class="btn btn-default" role="btn">등록하기</a></td>--%>
			<%--</tr>			--%>
			</tbody>
			 <%--</c:if> --%>
			
		
		</table>
		  <%----%>
		  <%----%>
		<%--</form>--%>
         
            
       	</div>
    </body>
</html>