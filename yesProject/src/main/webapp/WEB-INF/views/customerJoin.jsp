<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

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
                width:70%;
                height: 40px;                
            }
        
        </style>
    </head>
    <body>
    
    <div class="page-header" style="text-align: center">
        <img src="./imgs/logo2.png"/>
    </div>
   
   
    <form style="width: 50%; margin: 0px auto; padding-left:120px;">
      <div class="form-group">
        <label for="id">���̵�</label>
        <input type="text" class="form-control" id="id" name="id" >
      </div>
      <div class="form-group">
        <label for="pw">��й�ȣ</label>
        <input type="password" class="form-control" id="pw" name="pw" >
      </div>
      <div class="form-group">
        <label for="pw">��й�ȣ ��Ȯ��</label>
        <input type="password" class="form-control" id="pw"  >
      </div>
      <div class="form-group">
        <label for="name">�̸�</label>
        <input type="text" class="form-control" id="name" name="name" >
      </div>
      <div class="form-group" style="display: inline-block">
        <label for="birth">�������</label>
        <input type="date" class="form-control" id="birth" name="birth" style="width: 100%"  >
      </div>
        <div class="form-group" style="display: inline-block; margin-left:15px;">
        <label for="nick">�г���</label>
        <input type="text" class="form-control" id="nick" name="nick" style="width: 100%"  >
      </div>
      <div class="form-group">
        <label for="tel">�޴���ȭ</label>
        <input type="tel" class="form-control" id="tel" name="tel" >
      </div>
      <div class="form-group">
        <label for="quiz">��й�ȣã�� ����</label>
        <div class="dropdown">
  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" style="width: 70%">
    ��â���� ��￡ ���� ��������?
    <span class="caret"></span>
  </button>
  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
    <li><a href="#">����� ������?</a></li>
    <li><a href="#">�����ϴ� ���?</a></li>
    <li><a href="#">Something else here</a></li>
    <li role="separator" class="divider"></li>
    <li><a href="#">Separated link</a></li>
  </ul>
</div>      
      </div>
                                    
      <div class="form-group">
        <label for="answer">����</label>
        <input type="text" class="form-control" id="answer" name="answer" >
      </div>                                     
                                
                                                          
                                                                                    
                                                                                                                                        
      <button type="submit" class="btn btn-primary" style="width:70%; font-size: 20px; margin-top: 30px;">�����ϱ�</button>
    </form>
   
   
   
   
   
   
    </body>
</html>