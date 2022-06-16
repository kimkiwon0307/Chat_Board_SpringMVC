<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert f_title here</title>
</head>

<body>

	<%@include file="../includes/header.jsp"%>

<body>
	<header>
	</header>
	<div class="container">
		<div class="sub_menu">
			<div class = "subject_h1" >
				<h1>조회 </h1>
			</div>
			<div class = "subject_h5">
				<h5>홈 > SpringMVC게시판 > 조회</h5>
			</div>
			
		</div>
		
			<div class="input_group_a">

				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">제 목</span> 
					<input type="text" class="form-control" placeholder="제목을 작성하세요." 
					  name="f_title" aria-label="Username" aria-describedby="basic-addon1" value="${board.f_title}" readonly="readonly"/>
				</div>
			
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">작성자</span> 
					<input type="text" class="form-control" placeholder="작성자" name="f_writer" value="${board.f_writer}" readonly="readonly">
				</div>
			
			
				<div class="input-group">
					<span class="input-group-text">내 용</span>
  					<textarea class="form-control" aria-label="With textarea " rows="10" name="f_content" readonly="readonly">${board.f_content}</textarea>
				</div>

				<div class="btn_group" style="margin-top:10px; float: right;">
					<button type="button" class="btn btn-primary" id="btn_update">수 정</button>
					<button type="button" class="btn btn-danger" id="btn_list">목 록</button>
				</div>
			
				<form method="get" id="withPagingInfo">
					<input type="hidden" name='type' value="${cri.type}">
					<input type="hidden" name='keyword' value="${cri.keyword}">
					<input type="hidden" name='pageNum' value="${cri.pageNum}">
					<input type="hidden" name='amount' value="${cri.amount}">
					<input type="hidden" name="f_no" value="${board.f_no }">
				</form>
			</div>
			
			<div class="panel panel-default" style="margin-top:40px;">
				<div class="panel-heading" >
					<h5>Comment</h5>
				</div>
				<div class="panel-body">
					<ul class="chat" style="padding-left:0">
						<!-- <li style="list-style:none;margin-top: 2px; ">
							<div style="border: 1px solid black;background-color: antiquewhite;">
								<div class="header">
									<strong style="padding-left:10px;"> user00</strong>
									<small style="float:right; padding-right:10px;">2018-01-01</small>
								</div>
								<p style="padding-left:10px;"> good </p> 
								
							</div>
						</li>
						
						<li style="list-style:none;margin-top: 2px; ">
							<div style="border: 1px solid black;background-color: antiquewhite;">
								<div class="header">
									<strong style="padding-left:10px;"> user00</strong>
									<small style="float:right; padding-right:10px;">2018-01-01</small>
								</div>
								<p style="padding-left:10px;"> good </p> 
							</div>
						</li>
						
						<li style="list-style:none;margin-top: 2px; ">
							<div style="border: 1px solid black;background-color: antiquewhite;">
								<div class="header">
									<strong style="padding-left:10px;"> user00</strong>
									<small style="float:right; padding-right:10px;">2018-01-01</small>
								</div>
								<p style="padding-left:10px;"> good </p> 
							</div>
						</li> -->
					</ul>
					<div style="border:1px solid black;">
						<div>
							
							<input type="text"  class="form-control" id="reply_text" placeholder="댓글을 작성하세요" name="reply">
							<input type="text"  class="form-control" id="replyer" name="replyer">
						
							<div class="btn_group" style="margin-top:10px; float: right;">
								<button type="button" class="btn btn-primary" id="btn_reply">댓 글</button>
							</div>
						</div>
							
					</div>
				</div>
			</div>
			
			
</div>
	<script>
		$(document).ready(function(){
			
			// 목록 버튼 누르면 목록으로 가기
			$("#btn_list").on("click",function(e){
				
			e.preventDefault();

			var form = $("#withPagingInfo");
			
			form.attr("action","/fboard/list");
			form.submit();
				
			})
			
			// 수정 버튼 누르면 수정페이지로 이동
			$("#btn_update").on("click",function(e){
			
				e.preventDefault();

				var form = $("#withPagingInfo");
			
				form.attr("action","/fboard/modify");
				form.submit();
			})

			// 댓글 목록 가져오기
			var f_no = ${board.f_no};
			var replyUL = $(".chat");

			getList();
			
		 	function getList(){
		 	
		 		$.getJSON("/replies/"+ f_no + ".json", function(data){
		 			
		 		var html = "";
		 	
		 		for(var i=0 ; i < data.length ; i++){
					html +="<li style='list-style:none;margin-top: 2px;'>";
					html +="<div style='border: 1px solid black;background-color: antiquewhite;'>";
					html +="<div class='header'>";
					html +="<strong style='padding-left:10px;'>" + data[i].replyer + "</strong>";
					html +="<small style='float:right; padding-right:10px;'>" + data[i].replyDate + "</small>";
					html +="</div>";
					html +="<p style='padding-left:10px;'>" + data[i].reply +"</p></div></li>"
		 		}
		 		
		 		replyUL.html(html);
		 		
		 		});
		 	}
				
		 	
			// 댓글 등록하기
			$("#btn_reply").on("click",function(e){
				
		 		var replyer = $('#replyer').val();
				var reply_text = $('#reply_text').val();
				var reply = {"f_no" : f_no, "reply" : reply_text, "replyer":replyer}

				$.ajax({
					type : 'post',
					url : '/replies/new',
					data : JSON.stringify(reply),
					contentType : "application/json; charset=utf-8",
					success : function(){
						getList();
					}
				})
				// ajax
				
			});
			
		})
	
	</script>

</body>
	<%@include file="../includes/footer.jsp"%>
</body>
</html>