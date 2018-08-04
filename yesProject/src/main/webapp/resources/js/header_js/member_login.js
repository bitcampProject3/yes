

Kakao.init('630e98d8425188c04dae0728c65822bb');

function loginWithKakao() {
    // 로그인 창을 띄웁니다.
    Kakao.Auth.login({
		throughTalk: false,
		persistAccessToken: false,
		success: function(authObj) {
	 		Kakao.API.request({
                url: '/v1/user/me',
                success: function (res) {
                    console.log(JSON.stringify(res.kaccount_email));
                    var id = res.id;
                    var name = JSON.stringify(res.properties.nickname);
                    $.ajax({
                        type: "POST",
                        url: "./kakaologin",
                        data: {
                            "id": id,
                            "name": name
                        },
                        success: function (data) {
                            alert(data);
                            $(location).attr("href", "http://localhost:8090/yes/");
                        },
                        error: function (request, status, error) {
                            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                        }
                    });
                },
                fail: function (err) {
                    alert(JSON.stringify(err));
                }
            })
		}
    });
}




function logoutKakao(){
    window.open('http://developers.kakao.com/logout', 'kakao_iframe','width=2px, height=2px');
    alert('로그아웃 되었습니다.');
    $(location).attr("href", "http://localhost:8090/yes/");
}

 /*  Kakao.init('630e98d8425188c04dae0728c65822bb');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
        // 로그인 성공시, API를 호출합니다.
        Kakao.API.request({
          url: '/v2/user/me',
          success: function(res) {
            console.log(JSON.stringify(res.properties.profile_image));
            console.log(JSON.stringify(res.properties.nickname));
            var name=JSON.stringify(res.properties.nickname);
            $.ajax({
                type:"POST",
                url:"./kakaologin",
                data:{
                    "name":name
                },
                success:function(data){
                }
            });
            $(location).attr("href","http://localhost:8090/yes/");

          },
          fail: function(error) {
            alert(JSON.stringify(error));
          }
        });
      },
      fail: function(err) {
        alert(JSON.stringify(err));
      }
    }); */

function loginJoin(){
    $('#loginForm').css('display','none');
    $('.step1').clone(true).appendTo('#login');
    $('.step2').clone(true).appendTo('#login');
}


function loginCheck(){
    var id=$('.id').val();
    var pw=$('.password').val();
    $.ajax({
        type:"POST",
        url:"./check",
        data:{"id":id,
            "password":pw
        },
        success:function(data){
            var result=data.slice(0,2);
            if(result==='성공'){
                location.href="/yes/";
            }
            else{
                alert(data);
            }
        },
		error: function(request,status,error) {
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
  });
}

function loginBack(){
	$('#login-findID').css('display','none');
	$('#login-findPW').css('display','none');
	$('#loginForm').css('display','block');
}
$('#findID_btn').click(function(){
		var name=$('.name').val();
		var birth=$('.birth').val();
		var email=$('.email').val();

		$.ajax({
         	type:"POST",
        	url:"./find",
        	data:{"name":name,
        		"birth":birth,
        		"email":email
        	},
        	success:function(data){
				var result=data.slice(0,2);
				if(result=='에러'){
					alert(data.slice(3));
				}else{
					alert('찾으시는 아이디는'+data+'입니다');
					$('#login-findID').css('display','none');
					$('#loginForm').css('display','block');
				}
        	}
      });
});
var id;
$('#findPW_btn').click(function(){
	id=$('.id2').val();
	var name=$('.name2').val();
	var birth=$('.birth2').val();
	var email=$('.email2').val();
	var answer=$('.pwQuestion').val();
	$.ajax({
     	type:"POST",
    	url:"./find2",
    	data:{
    		"id":id,
    		"name":name,
    		"birth":birth,
    		"email":email,
    		"answer":answer
    	},
    	success:function(data){
			var result=data.slice(0,2);
			if(result=='에러'){
				alert(data.slice(3));
			}else{
				$('#login-findPW').css('display','none');
				$('#login-findPW2').css('display','block');
			}
    	}
  });

});
$('#updatePW').click(function(){
	var pw=$('.pw').val();

	 $.ajax({
     	type:"POST",
    	url:"./pwUpdate",
    	data:{
    		"id":id,
    		"password":pw,
    	},
    	success:function(data){
    		console.log(data);
			if(data=='성공'){
				alert('비밀번호 변경 성공');
				$('#login-findPW2').css('display','none');
				$('#loginForm').css('display','block');
			}
			else{
				alert('비밀변호 변경 실패');
			}
    	}

	});
});
