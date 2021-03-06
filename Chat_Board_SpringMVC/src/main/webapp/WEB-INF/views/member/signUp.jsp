<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
html,body{
background-image: url('https://photo.coolenjoy.net/data/editor/2101/a4eeed5b64ae71f0653a6e754d1d5886c4c7d8a1.jpg');
background-size: cover;
background-repeat: no-repeat;
height: 100%;
font-family: 'Numans', sans-serif;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<style>
	.divider-text {
    position: relative;
    text-align: center;
    margin-top: 15px;
    margin-bottom: 15px;
}
.divider-text span {
    padding: 7px;
    font-size: 12px;
    position: relative;   
    z-index: 2;
}
.divider-text:after {
    content: "";
    position: absolute;
    width: 100%;
    border-bottom: 1px solid #ddd;
    top: 55%;
    left: 0;
    z-index: 1;
}

.btn-facebook {
    background-color: #405D9D;
    color: #fff;
}
.btn-twitter {
    background-color: #42AEEC;
    color: #fff;
}

#s_nick_check_success{
	color:green;
	display:none;
}
#s_nick_check_fail{
	color:red;
	display:none;
}
.form-group input-group{
	width:319px;
}

.card bg-light{
	margin-top : 300px;
}


</style>
</head>
<body>
	<div class="container">
		<hr>
		
		<div class="card bg-light" style="margin-top : 250px; border-radius:200px; background-color:#F8F9B5!important">
			<article class="card-body mx-auto" style="max-width: 400px;">
				<h4 class="card-title mt-3 text-center">회원 가입</h4>
			<!-- 
				<p id="#kakao_logo" style=margin-left:5px;>
						<a href="#" id="kakao_login"><img src="/resources/image/kakao_login_wide.png" alt="카카오로고"/></a>
				</p>
			
				<p class="divider-text">
					<span class="bg-light">OR</span>
				</p>
				 -->
			<form action="/member/signUp" method="POST">
				<div class="form-group input-group" style="width:318px;"> 
						<div class="input-group-prepend">
							<span class="input-group-text"> 
								<i class="fa fa-user"></i>
							</span>
						</div>
						<input name="m_nick" id="nick_check" class="form-control" placeholder="사용할 닉네임" type="text" required="required">
					<span  class="input-group" id="s_nick_check_success">사용 가능한 닉네임 입니다.</span>
					<span  class="input-group" id="s_nick_check_fail">존재하는 닉네임 입니다.</span>
					</div>
					
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> 
								<i class="fa fa-envelope"></i>
							</span>
						</div>
						<input name="m_mail" class="form-control" placeholder="이메일 주소" type="email" required="required">
					</div>

					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> 
								<i class="fa fa-lock"></i>
							</span>
						</div>
						<input name="m_pw" class="form-control" placeholder="비밀번호"  type="password" required="required">
					</div>
					<!-- form-group// -->
				<!-- 	<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> 
								<i class="fa fa-lock"></i>
							</span>
						</div>
						<input class="form-control" placeholder="비밀번호 체크" id="check_pw" type="password">
					</div> -->
					<!-- form-group// -->
					<div class="form-group">
						<button type="submit" id="signUp_btn" class="btn btn-outline-primary btn-block">회원가입</button>
					</div>
					<!-- form-group// -->
					<p class="text-center">
						아이디를 보유 중인가요? <a href="/member/login">Log In</a>
					</p>
				</form>
			</article>
		</div>
		<!-- card.// -->

	</div>
	<!--container end.//-->

	<br>
	<br>
	
	<script>
		$(document).ready(function(){
			
			// 아이디 중복검사
			$('#nick_check').on("propertychange change keyup paste input", function(){
				
				var m_nick = $('#nick_check').val();
				var data = {m_nick : m_nick};
				
				$.ajax({
					
					type: "post",
					url : "/member/m_nick_check",
					data : data,
					success : function(result){
						console.log(result);
						if(result != 'fail'){
							$("#s_nick_check_fail").css("display","none");
							$("#s_nick_check_success").css("display","inline-block");
							$("#signUp_btn").attr("type","submit");
						}else{
							$("#s_nick_check_fail").css("display","inline-block");
							$("#s_nick_check_success").css("display","none");
							$("#signUp_btn").attr("type","button");
						}
					}
				}); 
			});
			
		
		})
	</script>

</body>
</html>