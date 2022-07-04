<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<title>Headers · Bootstrap v5.1</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/5.1/examples/headers/">


<!-- Bootstrap core CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

   <script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" />
<!--     <script type="text/javascript" src="cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script> -->



<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}


@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>

</head>
<body>

  <div class="container">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
      <a href="/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
        <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"/>1</svg>
      </a>

      <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
        <li><a href="/" class="nav-link px-2 link-dark">Home</a></li>
        <li><a href="/chatting/list" class="nav-link px-2 link-dark">채팅방</a></li>
        <li><a href="/fboard/list" class="nav-link px-2 link-dark">자유게시판</a></li>
        <li><a href="/qna/list" class="nav-link px-2 link-dark">Q&A</a></li>
      </ul>
	
	<!-- 로그인 하지 않은 상태 -->
	<c:if test="${member == null}">
      <div class="col-md-3 text-end">
        <button type="button" class="btn btn-outline-primary me-2" id="login_btn">로그인</button>
        <button type="button" class="btn btn-primary" id="signUp_btn">회원가입</button>
      </div>
	</c:if>
	
	<!-- 로그인 상태 -->
	<c:if test="${member !=null }">
		 <div class="col-md-3 text-end">
		 	<strong>${member.m_nick}</strong>님 반갑습니다. 
		 <div>
			<button type="button" class="btn btn-outline-primary me-2" id="logOut_btn">로그아웃</button>
    	   
    	   <c:if test="${member.m_no eq null }">
				<label>카카오 로그인 회원입니다.</label>			
    	   </c:if>
    	<%--    <c:if test="${member.m_no ne null }">
	    	    <button type="button" class="btn btn-primary" id="signUp_btn">회원정보</button>
    	   </c:if> --%>
		 </div>
		 </div> 
	</c:if>
	
    </header>
    <div style="height: 200px;">
    			
    </div>
  </div>
	<script>
	 	$(document).ready(function(){
	 		
	 		
	 		$("#login_btn").on("click",function(){
	 			self.location = "/member/login";
	 		})
	 		
	 		
	 		$("#signUp_btn").on("click",function(){
	 				self.location = "/member/signUp";
	 			})
	 			
	 		$("#logOut_btn").on("click",function(){
	 			
	 			self.location = "/member/logout";
	 			
	 		})
	 			
	 			
	 			
	 	})
	</script>


</body>
</html>