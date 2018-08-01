<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" href="/css/bootstrap.css">
</head>
<body>
<div class="container">
    <form id="commentForm" name="commentForm" method="post">
    <br><br>
        <div>
            <div>
                <span><strong>Comments</strong></span> <span id="cCnt"></span>
            </div>
            <div>
                <table class="table">                    
                    <tr>
                        <td>
                            <textarea style="width: 1100px" rows="3" cols="30" id="comment" name="comment" placeholder="댓글을 입력하세요"></textarea>
                            <br>
                            <div>
                                <a href="#" onClick="addComment('${bean.idx}')" class="btn pull-right btn-success">등록</a>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <input type="hidden" id="review_idx" name="review_idx" value="${bean.idx}" />        
<!--         <input type="hidden" id="idx" name="idx" value="16" /> -->        
    </form>
</div>
<div class="container">
    <form id="commentListForm" name="commentListForm" method="post">
        <div id="commentList">
        </div>
    </form>
</div>
 
<script type="text/javascript">
/*
 * 댓글 등록하기(Ajax)
 */
function addComment(code){
    
    $.ajax({
        type:'POST',
        url : "<c:url value='addComment'/>",
        data:$("#commentForm").serialize(),
        success : function(data){
            if(data=="success")
            {
                getCommentList();
                $("#comment").val("");
            }
        },
        error:function(request,status,error){
            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
        
    });
}
 
/**
 * 초기 페이지 로딩시 댓글 불러오기
 */
$(function(){
    
    getCommentList();
    
});
 
/**
 * 댓글 불러오기(Ajax)
 */
function getCommentList(){
    
    $.ajax({
        type:'GET',
        url : "<c:url value='commentList'/>",
        dataType : "json",
        data:$("#commentForm").serialize(),
        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
        success : function(data){
            
            var html = "";
            var cCnt = data.length;
            
            if(data.length > 0){
                
                for(i=0; i<data.length; i++){
                	if(data[i].comment_idx != null){
                	html += "<form id='commentDelete"+data[i].comment_idx+"' name='commentDelete' method='post'>"
                    html += "<div>";
                    html += "<div><table class='table'><h6><strong>"+data[i].writer+"</strong>&emsp;<a href='#'>수정</a>&emsp;<a href='#' onClick='deleteAlert("+data[i].comment_idx+")'>삭제</a></h6>";
/*                     html += "<div><table class='table'><h6><strong>"+data[i].writer+"</strong>&emsp;<a href='#'>수정</a>&emsp;<a href='#' onClick='deleteComment(\"${bean.idx}\")'>삭제</a></h6>"; */
                    html += data[i].comment+"  /   "+data[i].comment_idx + "<tr><td></td></tr>";
                    html += "</table></div>";
                    html += "</div>";
                    html += "<input type='hidden' id='comment_idx' name='comment_idx' value="+data[i].comment_idx+" /> ";
                    html += "<input type='hidden' id='review_idx' name='review_idx' value='${bean.idx}' /> ";
                    html += "</form>";
                } else {
                	html += "<form id='commentDelete"+data[i].comment_idx+"' name='commentDelete' method='post'>"
                	html += "</form>"
                }
                }
            } else {
                
                html += "<div>";
                html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
                html += "</table></div>";
                html += "</div>";
                
            }
            
            $("#cCnt").html(cCnt);
            $("#commentList").html(html);
        },
        error:function(request,status,error){
  
       }
    });
}


function deleteAlert(code) {
	if(confirm("정말 삭제하시겠습니까?")) {
		deleteComment(code)
	} else {
	}
}

function deleteComment(code) {
	
	$.ajax({
		type: 'POST',
		url : "<c:url value='deleteComment'/>",
		data: $("#commentDelete"+code).serialize(),
		success : function(data) {
			if(data == "success") {
 				getCommentList();
				$("#comment").val();
			}
		}
	})
	
}


</script>
 
</body>
</html>
