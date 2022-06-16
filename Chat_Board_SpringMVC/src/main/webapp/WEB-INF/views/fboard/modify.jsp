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
			<div class = "subject_h1" >
				<h1>수정 </h1>
			</div>
			<div class = "subject_h5">
				<h5>홈 > SpringMVC게시판 > 수정</h5>
			</div>
			
		</div>
		
		<form action="/fboard/modify" method="post" id="form_modify">
					
			<div class="input_group_a">
			
				<input type='hidden' name="f_no" value="${board.f_no}"/>
				<input type="hidden" name="pageNum" value="${cri.pageNum}">
				<input type="hidden" name="amount" value="${cri.amount }">
				
			
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">제 목</span> 
					<input type="text" class="form-control" value="${board.f_title}" 
					  name="f_title" aria-label="Username" aria-describedby="basic-addon1" required>
				</div>
			
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">작성자</span> 
					<input type="text" class="form-control" placeholder="작성자" name="f_writer" value="${board.f_writer}" readonly="readonly">
				</div>
			
			
				<div class="input-group">
					<span class="input-group-text">내 용</span>
  					<textarea class="form-control" aria-label="With textarea" name="f_content" required>${board.f_content}</textarea>
				</div>


				<div class="btn_group">
					<button type="submit" class="btn btn-primary" id="btn_update">수 정</button>
					<button type="submit" class="btn btn-danger" id="btn_delete">삭 제</button>
					<button type="button" class="btn btn-danger" id="btn_list">목 록</button>
				</div>
				
					
			</div>
		</form>
			
	</div>

	<div class="bottom">
	</div>

	<script>
			$(document).ready(function(){
				
				$("#btn_list").on("click",function(e){
					
					e.preventDefault();
					
					var form = $("#form_modify");
					
					form.attr("action","/fboard/list").attr("method","get");
					
					var pageNumTag = $("input[name='pageNum']").clone();
					var amountTag = $("input[name='amount']").clone();
					
					form.empty();
					form.append(pageNumTag);
					form.append(amountTag);
					
					form.submit();
				});
				
				
				$("#btn_delete").on("click",function(e){
					e.preventDefault();
					$("#form_modify").attr("action","/fboard/remove");
					$(this).unbind('click').click();
				});
			})	
	</script>
</body>
	<%@include file="../includes/footer.jsp"%>
</body>
</html>