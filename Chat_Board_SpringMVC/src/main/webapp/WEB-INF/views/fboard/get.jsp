<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>

<%@include file="../includes/header.jsp"%>
<script src="/resources/fboard/summernote/summernote-lite.js"></script>
<script src="/resources/fboard/summernote/lang/summernote-ko-KR.js"></script>
 
<link rel="stylesheet" href="/resources/fboard/summernote/summernote-lite.css">

<meta charset="UTF-8">
<title>Insert f_title here</title>
<style>
	strong{
		color:red;
		padding-left:10px;
	}
	p{
	padding-left:10px;
	}
	#replyUpdate{
		display:none;
	}
	 .update_register{
		display:none;	
	} 
	
	#reply_text{
		
		height:100px;
	}
	h5{
		font-weight: bold;
	}
</style>

</head>

<body>


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
  					<textarea  class="form-control" id="summernote"name="f_content" readonly="readonly">${board.f_content}</textarea>
				</div>
			
			<c:if test="${member.m_nick} == ${board.f_writer}">
				<div class="btn_group" style="margin-top:10px; float: right;">
					<button type="button" class="btn btn-primary" id="btn_update">수 정</button>
					<button type="button" class="btn btn-danger" id="btn_list">목 록</button>
				</div>
			</c:if>
			
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
					<h5>댓글을 남겨 주세요</h5>
				</div>
				<div class="panel-body">
					<ul class="chat" style="padding-left:0">
					</ul>
				<c:if test="${member != null}">
					<div style="border:1px solid black;">
						<div>
							<input type="text"  class="form-control" id="replyer" name="replyer" value="${member.m_nick}" readonly="readonly">
							<input type="text"  class="form-control" id="reply_text" placeholder="댓글을 작성하세요" name="reply" required="required">
						
							<div class="btn_group" style="margin-top:10px; float: right;">
								<button type="button" class="btn btn-primary" id="reply_register_btn">댓 글</button>
							</div>
						</div>
					</div>
				</c:if>
				
				<c:if test="${member == null}">
						<div>
							<input type="text"  class="form-control" value="로그인 한 사용자만 입력 가능합니다." readonly="readonly">
						</div>
				</c:if>
				
				
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
            var m_nick = $("#replyer").val();  // session에서 로그인한 m_nick 가져오기
            
			getList();
			
            // 댓글 목록을 가져오는 함수
		 	function getList(){
		 	
		 		$.getJSON("/replies/"+ f_no + ".json", function(data){
		 			
		 		var html = "";
		 	
		 		for(var i=0 ; i < data.length ; i++){
					html +="<li style='list-style:none;margin-top: 2px;'>"
					html +="<div id='"+ data[i].rno + "'style='border: 1px solid black;background-color: antiquewhite;'>";
					html +="<div class='header'>";
					html +="<strong>" + data[i].replyer + "</strong>";
					html +="<small style='float:right; padding-right:10px;'>" + data[i].replyDate + "</small></div>";
					html +="<p> " + data[i].reply +"</p>";
					html +="</div>";
					
					if(m_nick == data[i].replyer){
					html +="<div id='btn_rno" + data[i].rno + "' >";	
					html +="<button type='button'  class='btn delete btn-outline-danger' data-rno='" + data[i].rno +"'>삭제</button>" +
						 "<button class='btn update btn-outline-success' data-rno='"+ data[i].rno + 
						 " 'data-replyer='" + data[i].replyer +"' data-reply='"+ data[i].reply + "'>수정</button>"
					
					html +="</div>";
					}//if
					
					html +="</li><br/>";
		 		}
		 		
		 		replyUL.html(html);

		 		$(".delete").on('click',replyDelete); 
		 		$(".update").on('click',replyUpdate); 
		 		
		 		});// getJSON();
		 	}// getList();
				
		 	 
			// 댓글 등록하기
			$("#reply_register_btn").on("click",function(e){
				
		 		var replyer = $('#replyer').val();
				var reply_text = $('#reply_text').val();
				
				if(!reply_text){
					alert("댓글을 작성하세요.");
				}
				
				var reply = {"f_no" : f_no, "reply" : reply_text, "replyer":replyer}

				$.ajax({
					type : 'post',
					url : '/replies/new',
					data : JSON.stringify(reply),
					contentType : "application/json; charset=utf-8",
					success : function(){
						getList();
						$('#reply_text').val("");
					}
				})
				// ajax
				
			});

			
			// 삭제할때 사용하는 함수
			function replyDelete(){
				
				if(confirm("댓글을 삭제하시겠습니까?")){
				
				var rno = $(this).data('rno');
				var data = {"rno" : rno};
				
				$.ajax({
					
					method: "get",
					url : "/replies/replyDelete",
					data : data,
					success :function(data){
						getList();
					}
					
				})//ajax
				
			   }else{
				   return;
			   }
				
				
			}
			
			// 수정버튼 누르면 data를 수집한다.
			function replyUpdate(){
			
				var rno = $(this).data("rno");
				var replyer = $(this).data("replyer");
				var reply = $(this).data("reply");
		
		 		$("#btn_rno"+rno).hide();
		 			
		 		var html = "";
		 		
					html +="<li style='list-style:none;margin-top: 2px;'>";
					html +="<div id='"+ rno + "'style='border: 1px solid black;background-color: antiquewhite;'>";
					html +="<div class='header'>";
					html +="<strong>" + replyer + "</strong>";
					html +="</div>";
					html +="<input type='text' id='update_reply_text' value='"+reply+"' style='width:1294px;' /></div></li>";
					html +="<button type='button' class='btn cancel btn-outline-danger' data-rno='" + rno +"'>취소</button>" +
						 "<button class='btn save btn-outline-success'  data-rno='" + rno +"'>저장</button>" 
		 			
					 replyUL.find('#'+rno).replaceWith(html);
				 	$(".cancel").on('click',replyCancel); 
				 	$(".save").on('click',replyUpdateSave); 
					 
		 	}  
		 	
			//저장 버튼을 누르면 작동하는 함수
		 	function replyUpdateSave(){
		 
		 	var reply = $("#update_reply_text").val();
			var rno = $(this).data('rno'); 
		 	
			data = {"rno":rno, "reply":reply};
		 	
			$.ajax({
				
				method: "post",
				url : "/replies/replyUpdate",
				data : data,
				success :function(data){
					alert("댓글이 수정되었습니다.");
					getList();
				}
				
			})
		 		
		 	}// replyUpdateAjax()
		 	
		 	
		 	// 취소 버튼을 누르면 작동하는 함수
		 	function replyCancel(){
		 		getList();
		 	}
		 	
		 	
		 	// summernote
			  
			$("#summernote").summernote({
				toolbar:false,
				width:1200, 
				height:300,
				minHeight: null,
				maxHeight: null,
				focus: true,
				lang: "ko-KR",
			}); 
			
		 	
		 	
		 	
		}) // document.ready();
	
	</script>

</body>
	<%@include file="../includes/footer.jsp"%>
</body>
</html>