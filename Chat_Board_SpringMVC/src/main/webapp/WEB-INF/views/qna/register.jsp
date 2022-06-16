<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@include file="../includes/header.jsp"%>

<body>
	<header>
	</header>
	<div class="container">
		<div class="sub_menu">
			<div class = "subject_h1" style="float:left;">
				<h1>글쓰기 </h1>
			</div>
			<div class = "subject_h5" style="float:right; margin-top:20px;">
				<h5>홈 > Q&A > 글쓰기</h5>
			</div>
		</div>
		
		<form action="/qna/register" method="post" >
			<div class="input_group_a">
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">제 목</span> 
					<input type="text" class="form-control" placeholder="제목을 작성하세요." 
					  name="q_title" aria-label="Username" aria-describedby="basic-addon1" required>
				</div>
			
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">작성자</span> 
					<input type="text" class="form-control" placeholder="작성자" name="q_writer" required>
				</div>
			
			
				<div class="input-group">
					<span class="input-group-text">내 용</span>
  					<textarea class="form-control" aria-label="With textarea" rows="10"  name="q_content" required></textarea>
				</div>

				<div class="btn_group" style="margin-top:10px; float: right;">
					<button type="submit" class="btn btn-primary" id="btn_write">작 성</button>
					<button type="button" class="btn btn-danger" id="btn_list">목 록</button>
				</div>
			</div>
		</form>
			
	</div>

	<div class="bottom">
	</div>

	<script>
		$(document).ready(function(){
			
			// 목록 버튼 누르면 목록으로 가기
			$("#btn_list").on("click",function(){
				location.href="/fboard/list"
			})
		})
	
	</script>

	<%@include file="../includes/footer.jsp"%>
</body>
</html>