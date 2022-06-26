<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert q_title here</title>
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
	
	#writer_input{
	
		float:left; width:33%; box-sizing:border-box;
	}
	#date_input{
		float:left; width:33%; box-sizing:border-box; margin-left:5px;
	}
	#count_input{
		float:right; width:33%; box-sizing:border-box;
	}
</style>   
</head>
<body>   
      
	<%@include file="../includes/header.jsp"%>

<body>
	<header>
	</header>
	<div class="container">
		<div class="sub_menu" >
			<div class = "subject_h1">
				<h1>조회 </h1>
			</div>
			<div class = "subject_h5">
				<h5>홈 > Q&A > 조회 </h5>
			</div>
		</div>
		
				
			<div class="input_group_a">

				<div class="input-group mb-3">
					<span class="input-group-text" id="ivory_input">제 목</span> 
					<input type="text" id="input_color" class="form-control" placeholder="제목을 작성하세요." 
					  name="q_title" aria-label="Username" aria-describedby="basic-addon1" value="${qvo.q_title}" readonly="readonly"/>
				</div>
				
			<div>
				<div class="input-group mb-3"  id="writer_input">
					<span class="input-group-text" id="ivory_input">작성자</span> 
					<input type="text" id="input_color" class="form-control" placeholder="작성자" name="q_writer" value="${qvo.q_writer}" readonly="readonly">
				</div>
				
				<div class="input-group mb-3" id="date_input">
					<span class="input-group-text" id="ivory_input">작성일자</span> 
					<input type="text" id="input_color" class="form-control" name="q_date"   value='<fmt:formatDate value='${qvo.q_date}'/>'readonly="readonly">
				</div> 
				<div class="input-group mb-3" id="count_input">
					<span class="input-group-text" id="ivory_input">조회수</span> 
					<input type="text"  id="input_color" class="form-control"  name="q_count" value="${qvo.q_count}" readonly="readonly">
				</div>
			</div>  
			  
			 
				<div class="input-group">
					<span class="input-group-text" id="ivory_input">내 용</span>
  					<textarea class="form-control" id="input_color" aria-label="With textarea " rows="10" name="q_content" readonly="readonly">${qvo.q_content}</textarea>
				</div> 
				
			<c:if test="${member.m_nick eq qvo.q_writer || member.m_admin eq 0}"> 
				<div class="btn_group" style="margin-top:10px; float: right;">
					<button type="button" class="btn btn-primary" id="btn_update">수 정</button>
					<button type="button" class="btn btn-danger" id="btn_list">목 록</button>
				<c:if test="${member.m_admin eq 0 }"> 
					<button type="button" class="btn btn-danger" id="btn_reply">답 글</button>
				</c:if>  
				</div>
			</c:if> 
			</div>
			 
	</div>

	<div class="bottom">
	</div>

	<script>
		$(document).ready(function(){
			
			// 목록 버튼 누르면 목록으로 가기
			$("#btn_list").on("click",function(){
				location.href="/qna/list";
			})
			
			// 수정 버튼 누르면 수정페이지로 이동
			$("#btn_update").on("click",function(){
				location.href="/qna/modify?q_no=" + ${qvo.q_no};
			})
			
			
			$("#btn_reply").on("click",function(){
				location.href="/qna/reply.no?q_no=" + ${qvo.q_no};
			})
			
			
		})
	
	</script>

</body>
	<%@include file="../includes/footer.jsp"%>
</body>
</html>