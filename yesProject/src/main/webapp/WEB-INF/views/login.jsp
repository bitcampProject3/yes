<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        
        <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
       
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>     
        <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
       
        <style>
        @media (max-width: 1050px) {
              .navbar-header {
                  float: none;
              }
              .navbar-left,.navbar-right {
                  float: none !important;
              }
              .navbar-toggle {
                  display: block;
              }
              .navbar-collapse {
                  border-top: 1px solid transparent;
                  box-shadow: inset 0 1px 0 rgba(255,255,255,0.1);
              }
              .navbar-fixed-top {
                  top: 0;
                  border-width: 0 0 1px;
              }
              .navbar-collapse.collapse {
                  display: none!important;
              }
              .navbar-nav {
                  float: none!important;
                  margin-top: 7.5px;
              }
              .navbar-nav>li {
                  float: none;
              }
              .navbar-nav>li>a {
                  padding-top: 10px;
                  padding-bottom: 10px;
              }
              .collapse.in{
                  display:block !important;
              }
            }
            body{
                background-color:RGB(255,232,232);
            }
            .form-group{
                
                font-size: 15px;
                
            }
            .form-group input{
                width:62%;
                height:45px;
                
            }
            #form-a{
                
                margin: 18px;
                
                
            }
        </style>
    </head>
    <body>
    
    <div class="page-header" style="text-align: center">
        <img src="./imgs/logo2.png"/>
    </div>
   
   
    <form style="width: 70%; margin: 0px auto; padding-top:50px;padding-left:270px;">
      <div class="form-group">
        <label for="id">아이디</label>
        <input type="text" class="form-control" id="id" name="id" >
      </div>
      <div class="form-group">
        <label for="pw">비밀번호</label>
        <input type="password" class="form-control" id="pw" name="pw" >
      </div>
       
             
                                                                                                                       
      <button type="submit" class="btn btn-primary" style="padding-left:10px; width:62%; font-size: 20px; margin-top: 30px; ">로그인</button>
      <br/>
         <div style="width:90%; margin-top:20px; " >
            
            <div style="display: inline-block; position:relative; bottom: 20px; ">
                
                <!-- 네이버아이디로로그인 버튼 노출 영역 -->
                <div id="naver_id_login" ></div>

                  <!-- //네이버아이디로로그인 버튼 노출 영역 -->
                  <script type="text/javascript">
                    var naver_id_login = new naver_id_login("urGoHBK2Hl9eBQpjZEMD", "http://localhost:8090/yes/callback.bit");
                    var state = naver_id_login.getUniqState();
                    naver_id_login.setButton("green", 3,47);
                    naver_id_login.setDomain("http://localhost:8090/yes/login.bit");
                    naver_id_login.setState(state);
                    naver_id_login.setPopup(false);
                    naver_id_login.init_naver_id_login();
                  </script>   

                
            </div>
            <div style="display: inline-block;  ">
                
                
                <a id="kakao-login-btn" ></a>

    	

                <script type='text/javascript'>
                //<![CDATA[

                     Kakao.init('630e98d8425188c04dae0728c65822bb');
                // 카카오 로그인 버튼을 생성합니다.
                    Kakao.Auth.createLoginButton({
                    container: '#kakao-login-btn',
                    success: function(authObj) {
                    alert(JSON.stringify(authObj));
                    },
                    fail: function(err) {
                    alert(JSON.stringify(err));
                    }
                    });
                //]]>
                </script>
                
                
                
            </div>
            
        </div>      
      

      
      
     <div class="form-group" style="margin-top:20px; border-top: 1px solid gray;width:57%">
        <div style="margin-top: 20px">
        <a href="findId.bit" id="form-a">아이디 찾기</a>
        |
        <a href="findPw.bit" id="form-a">비밀번호찾기</a>
        |
        <a href="join.bit" id="form-a">회원가입</a>            
        </div>

      </div>
      
    </form>
   
  
   
   
   
    </body>
</html>