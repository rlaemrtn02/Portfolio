<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="login.css" rel="stylesheet" id="bootstrap-css">
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
<%
		String id = (String)session.getAttribute("ID");
		if (id != null)	
		{
			response.sendRedirect("index.jsp");
		}
%>
<body>
   
   
    <script>
         function check(){
             if(document.loginfrm.userID.value ==""){
                 $("#ID").attr('placeholder', '아이디를 입력하시오.');
                 document.loginfrm.userID.focus();
                 return false;
             }
             if(document.loginfrm.userPassword.value ==""){
                 $("#pswd").attr('placeholder', '비밀번호를 입력하시오.');
                 document.loginfrm.userPassword.focus();
                 return false;
            }
        
            document.loginfrm.submit();
        }
    </script>
    
    
<div class="container">
    <!--<div class="logo"><a href="index.html">Hair Maker</a></div>-->
	<div class="d-flex justify-content-center h-100">
		<div class="card">
			<div class="card-header">
				<h3>Sign In</h3>
				<div class="d-flex justify-content-end social_icon">
					<span><a href="https://www.facebook.com/"><i class="fab fa-facebook-square"></i></a></span>
					<span><i class="fab fa-google-plus-square"></i></span>
					<span><i class="fab fa-twitter-square"></i></span>
				</div>
			</div>
			<div class="card-body">
				<form method="post" name="loginfrm" action="login_ok.jsp">
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" class="form-control" id ="ID" placeholder="아이디" name="userID" maxlength="20">
						
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
						</div>
						<input type="password" class="form-control" ID="pswd" placeholder="비밀번호" name="userPassword" maxlength="20">
					</div>
				
					<div class="form-group">
						<input type="button" onclick = "check()" value="로그인" class="btn float-right login_btn">
					</div>
					<div class="gohome">
					   <a href="index.jsp"> 홈으로 </a>
					</div>
				</form>
			</div>
			<div class="card-footer">
				<div class="d-flex justify-content-center links">
					계정이 없으신가요?<a href="join.jsp">회원가입</a>
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