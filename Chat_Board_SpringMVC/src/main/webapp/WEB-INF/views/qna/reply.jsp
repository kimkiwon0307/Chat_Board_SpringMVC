<%@ page language="java" contentType="text/html; charset=UTF-8" 	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reply JSP</title>
</head>
<body>
	<%@include file="../includes/header.jsp"%>

<div class="container">
		<div class="sub_menu">
			<div class = "subject_h1" style="float:left;">
				<h1>답글 쓰기 </h1>
			</div>
			<div class = "subject_h5" style="float:right; margin-top:20px;">
				<h5>홈 > Q&A > 답글쓰기</h5>
			</div>
		</div>
		
		<form action="/qna/reply_insert.no" method="post" >
			
			<input type="hidden" name="q_no" value="${qvo.q_no}" />
			<input type="hidden" name="q_root" value="${qvo.q_root}" />
			<input type="hidden" name="q_step" value="${qvo.q_step }" />
			<input type="hidden" name="q_indent" value="${qvo.q_indent }" />
	
		
			<div class="input_group_a">
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">제 목</span> 
					<input type="text" class="form-control" value="${qvo.q_title}의 답변글"
					  name="q_title" aria-label="Username" aria-describedby="basic-addon1" required>
				</div>
			
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">작성자</span> 
					<input type="text" class="form-control" value="${member.m_nick}" placeholder="작성자" name="q_writer" readonly="readonly">
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


<%@include file="../includes/footer.jsp"%>
</body>
</html>
