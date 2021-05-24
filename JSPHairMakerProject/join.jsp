<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<link href="join.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
	<title>로그인</title>
	<!--logo font-->
  <link href="https://fonts.googleapis.com/css?family=Frijole|Rock+Salt" rel="stylesheet">
   <!--Made with love by Mutiullah Samim -->
   
	<!--Bootsrap 4 CDN-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    
    <!--Fontawesome CDN-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

	<!--Custom styles-->
	<link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
     <script>
         function check(){
             if(document.frm1.userID.value ==""){
                 $("#id").attr('placeholder', '아이디를 입력하시오.');
                 document.frm1.userID.focus();
                 return false;
             }
            
             if(document.frm1.userName.value ==""){
                  document.frm1.userName.focus();
                 $("#name").attr('placeholder', '이름을 입력하시오.');
                  return false;                    
             }  
             if(document.frm1.userPassword.value ==""){
                  document.frm1.userPassword.focus();
                 $("#pswd").attr('placeholder', '비밀번호를 입력하시오.');
                  return false;                    
             } 
             if(document.frm1.userPasswordchk.value ==""){
                  document.frm1.userPasswordchk.focus();
                 $("#pswdchk").attr('placeholder', '비밀번호 확인을 입력하시오.');
                  return false;                    
             } 
             if(document.frm1.userPassword.value != document.frm1.userPasswordchk.value){
                 document.frm1.userPasswordchk.focus();
                 alert("비밀번호가 일치하지않습니다.")
                  return false;
             }
             if(document.frm1.userGender.value ==""){
                  document.frm1.userGender.focus();
                 $("#gender").attr('placeholder', '성별을 입력하시오.');
                  return false;                    
             }
             if(document.frm1.userEmail.value ==""){
                  document.frm1.userEmail.focus();
                 $("#email").attr('placeholder', '이메일을 입력하시오.');
                  return false;                    
             } 
             document.frm1.submit();
         }
     </script>

<div class="container">
    <!--<div class="logo"><a href="index.html">Hair Maker</a></div>-->
	<div class="d-flex justify-content-center h-100">
		<div class="card">
			<div class="card-header">
				<h3>Sign Up</h3>
				<div class="d-flex justify-content-end social_icon">
					<span><a href="https://www.facebook.com/"><i class="fab fa-facebook-square"></i></a></span>
					<span><i class="fab fa-google-plus-square"></i></span>
					<span><i class="fab fa-twitter-square"></i></span>
				</div>
			</div>
			<div class="card-body">
				<form method="post" name="frm1" action="joinAction.jsp">
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" class="form-control" placeholder="아이디" id="id" name="userID" maxlength="20">
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" id= "name"class="form-control" placeholder="이름" name="userName" maxlength="20">
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
						</div>
						<input type="password" id="pswd" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
						</div>
						<input type="password" id= "pswdchk" class="form-control" placeholder="비밀번호 확인" name="userPasswordchk" maxlength="20">
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="gender"></i></span>
						</div>
						<input type="text" id="gender" class="form-control" placeholder="남자 or 여자" name="userGender" maxlength="20">
                    </div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="mail"></i></span>
						</div>
						<input type="text" id="mail" class="form-control" placeholder="이메일" name="userEmail" maxlength="20">
					</div>				
					<div class="form-group">
						<input type="button" value="회원가입" class="btn float-right login_btn" onclick="check()" >
					</div>
				</form>
			</div>
			<div class="card-footer">
				<div class="d-flex justify-content-center links">
					계정이 있으신가요?<a href="login.jsp">로그인</a>
				</div>
				<div class="d-flex justify-content-center">
					<a href="#">비밀번호를 잊으셨나요?</a>
				</div>
			</div>
			
		</div>
	</div>
</div>
</body>
</html>