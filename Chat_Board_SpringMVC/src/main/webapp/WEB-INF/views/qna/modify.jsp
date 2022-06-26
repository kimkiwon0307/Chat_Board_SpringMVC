<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
		#ivory_input{
		background-color:ivory;
	}
	#input_color{
		background-color: ivory;
	}
	.subject_h1{
		float:left;
	}
	.subject_h5{
	float:right; margin-top:20px
	}
	.btn_group{
		margin-top:10px; float: right;
	}
	
</style>
</head>
<body>

	<%@include file="../includes/header.jsp"%>
<body>
	<header> </header>
	<div class="container">
		<div class="sub_menu" >
			<div class = "subject_h1">
				<h1>수정 </h1>
			</div>
			<div class = "subject_h5">
				<h5>홈 > Q&A > 수정하기 </h5>
			</div>
		</div>
		
		<form action="/qna/modify" method="post" id="form_modify">

			<div class="input_group_a">

				<input id="ivory_input" type='hidden' name="q_no" value="${qvo.q_no}" />

				<div class="input-group mb-3">
					<span class="input-group-text" id="ivory_input">제 목</span> <input
						type="text" class="form-control" value="${qvo.q_title}"
						name="q_title" aria-label="Username" id="input_color"
						aria-describedby="basic-addon1" required>
				</div>

				<div class="input-group mb-3">
					<span class="input-group-text" id="ivory_input">작성자</span> <input
						type="text" class="form-control" placeholder="작성자" name="q_writer" id="input_color"
						value="${qvo.q_writer}" readonly="readonly">
				</div>


				<div class="input-group">
					<span class="input-group-text" id="ivory_input">내 용</span>
					<textarea class="form-control" rows="10" aria-label="With textarea" id="input_color"
						name="q_content" required>${qvo.q_content}</textarea>
				</div>


				<div class="btn_group">
					<button type="submit" class="btn btn-primary" id="btn_update">수정</button>
					<button type="submit" class="btn btn-danger" id="btn_delete">삭제</button>
					<button type="button" class="btn btn-danger" id="btn_list">목록</button>
				</div>
			</div>
		</form>
	</div>

	<div class="bottom"></div>

	<script>
	
			$(document).ready(function(){
				
				//목록 페이지로 이동
				$("#btn_list").on("click",function(){
					self.location ="/qna/list";
				});
				
				
				//삭제 버튼
				$("#btn_delete").on("click",function(e){
					e.preventDefault();
					if(confirm("답변글도 삭제됩니다. 삭제하시겠습니까?")){
						$("#form_modify").attr("action","/qna/remove");
						$(this).unbind('click').click();
					}
				});
		
				
			})	
	</script>
</body>
<%@include file="../includes/footer.jsp"%>
</body>
</html>