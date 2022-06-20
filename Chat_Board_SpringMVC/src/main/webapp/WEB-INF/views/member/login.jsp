<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.kim.utils.CookieManager"%>
<%
String loginId = CookieManager.getCookie(request, "loginId");
String cookieCheck ="";

if(!loginId.equals("")){
	cookieCheck = "checked";
}

%>
<!DOCTYPE html>
<html>
<head>

<style>
@import url('https://fonts.googleapis.com/css?family=Numans');

html,body{
background-image: url('https://photo.coolenjoy.net/data/editor/2104/69cbd32a9819a1f1e7494df8a456f231366292b2.jpg');
background-size: cover;
background-repeat: no-repeat;
height: 100%;
font-family: 'Numans', sans-serif;
}

.container{
height: 100%;
align-content: center;
}

.card{
height: 370px;
margin-top: auto;
margin-bottom: auto;
width: 400px;
background-color: rgba(0,0,0,0.5) !important;
}

.social_icon span{
font-size: 60px;
margin-left: 10px;
color: #FFC312;
}

.social_icon span:hover{
color: white;
cursor: pointer;
}

.card-header h3{
color: white;
}

.social_icon{
position: absolute;
right: 20px;
top: -45px;
}

.input-group-prepend span{
width: 50px;
background-color: #FFC312;
color: black;
border:0 !important;
}

input:focus{
outline: 0 0 0 0  !important;
box-shadow: 0 0 0 0 !important;

}

.remember{
color: white;
}

.remember input
{
width: 20px;
height: 20px;
margin-left: 15px;
margin-right: 5px;
}

.login_btn{
color: black;
background-color: #FFC312;
width: 100px;
}

.login_btn:hover{
color: black;
background-color: white;
}

.links{
color: white;
}

.links a{
margin-left: 4px;
}

#wrong_nickPw{
color: red;
}

#kakao_logo{
	margin-top:60px;
}

</style>


<meta charset="UTF-8">
<title>Insert title here</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

	<title>Login Page</title>
   <!--Made with love by Mutiullah Samim -->
   
	<!--Bootsrap 4 CDN-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    
    <!--Fontawesome CDN-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

	<!--Custom styles-->
	<link rel="stylesheet" type="text/css" href="styles.css">

	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<meta name="google-signin-client_id" content="674219897073-16arble3uju9bkv6gg0a2npd2peq0lud.apps.googleusercontent.com">
	
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>
	<div class="container">
	<div class="d-flex justify-content-center h-100">
		<div class="card">
			<div class="card-header">
				<h3>로그인</h3>
				<div class="d-flex justify-content-end social_icon" id="kakao_logo">
					<a href="#" id="kakao_login"><img src="/resources/image/kakao_login.png" alt="카카오로고"/></a>
				</div>
			</div>
			<div class="card-body">
				<form id="login_form" method="post" action="/member/login">
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" name="m_nick" id="m_nick" class="form-control" placeholder="닉네임을 입력하세요" 
						value="<%= loginId %>" required="required">
						
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
						</div>
						<input type="password" name="m_pw" class="form-control" placeholder="비밀번호를 입력하세요" required="required">
					</div>
					<div class="row align-items-center remember">
						<input type="checkbox" name="checkId" id="checkId"  <%= cookieCheck %>>아이디 저장
					</div>
					
					<!--아이디와 비밀번호 잘못 입력하면 나오는 문구 -->
					<c:if test="${result ==0 }">
						<div id="wrong_nickPw">
							아이디 또는 비밀번호를 잘못 입력했습니다.
						</div>
					</c:if>
					
					<div class="form-group">
						<input type="submit" value="Login" class="btn float-right login_btn" id="login_btn">
					</div>
				</form>
			</div>
			<div class="card-footer">
				<div class="d-flex justify-content-center links">
					아이디를 가지고 계시지 않은가요?<a href="/member/signUp" style="color: yellow;">Sign Up</a>
				</div>
				<div class="d-flex justify-content-center">
					<a href="#" style="color: yellow;">비밀번호를 잊으셨나요?</a>
				</div>
			</div>
		</div>
	</div>
</div> 




<script>

$(document).ready(function(){
		
	 Kakao.init('b869ee81ece3f60c27ab38cd1318819b');
	// console.log(Kakao.isInitialized());
	
	
	$("#kakao_login").on("click",function(){
	
		    Kakao.Auth.login({
		      success: function (response) {
		        Kakao.API.request({
		          url: '/v2/user/me',
		          success: function (response) {
					//카카오서버에서 받은 데이터중 nickname만 꺼내기
		        	  var nickname = response.properties["nickname"];
		        	  
					// 꺼낸 nickname으로 객체만들기
		        	  var data = {"m_nick" : nickname};
		        	  
					// ajax로 data를 json형식으로 컨트롤러에 보내기
		        	  $.ajax({
		        		  type : 'post',
		        		  url : '/member/kakaoLogin',
		        		  data : JSON.stringify(data),
		        		  contentType : "application/json; charset=utf-8",
		        		  success : 
		        			  self.location = "/fboard/list"
		        	  });
		        	  
		          },
		          fail: function (error) {
		            console.log(error)
		          },
		        })
		      },
		      fail: function (error) {
		        console.log(error)
		      },
		    })
		  })
	})
</script>

</body>
</html>