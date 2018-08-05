<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>NaverLoginSDK</title>
</head>
<body>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("urGoHBK2Hl9eBQpjZEMD", "http://localhost:8090/yes/callback");
  // 접근 토큰 값 출력
  //alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
   
    //비동기 통신
    $.ajax({
    	type:"POST",
    	url:"./naverlogin",
    	data:{
    		"email": naver_id_login.getProfileData('email'),
    		"name":naver_id_login.getProfileData('name'),
    		"birthDate":naver_id_login.getProfileData('birthday'),
    		"age":naver_id_login.getProfileData('age')
    	},
    	success:function(data){
    		if(data=='success')
    	   	{self.close();
    	    $(opener.location).attr("href","http://localhost:8090/yes/");
    	   	}
    	   }
    	}
    	
    
     );
    

  }
</script>	
	
	
	
</body>

</html>