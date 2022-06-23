<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../includes/header.jsp"%>

 <script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
 <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" />
<!--  <script type="text/javascript" src="cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script> -->

 
<script src="/resources/fboard/summernote/summernote-lite.js"></script>
<script src="/resources/fboard/summernote/lang/summernote-ko-KR.js"></script>
 
<link rel="stylesheet" href="/resources/fboard/summernote/summernote-lite.css">


<meta charset="UTF-8">
<title>Insert title here</title>




</head>
<body>


<body>
	<header>
	</header>
	<div class="container">
		<div class="sub_menu">
			<div class = "subject_h1" >
				<h1>글쓰기 </h1>
			</div>
			<div class = "subject_h5">
				<h5>홈 > SpringMVC게시판 > 글쓰기</h5>
			</div>
		</div>
		
		<form action="/fboard/register" method="post" >
			<div class="input_group_a">
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">제 목</span> 
					<input type="text" class="form-control" placeholder="제목을 작성하세요." 
					  name="f_title" aria-label="Username" aria-describedby="basic-addon1" required>
				</div>
			
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">작성자</span> 
					<input type="text" class="form-control" placeholder="작성자" name="f_writer" value="${member.m_nick}" readonly="readonly">
				</div>
			
			 
				<div class="input-group">
					<span class="input-group-text">내 용</span>
  					<textarea id="summernote"  name="f_content" required></textarea>
				</div>
 
				<div class="btn_group">
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
			
			$("#summernote").summernote({
			  	 
				width:1200, 
				height:300,
				minHeight: null,
				maxHeight: null,
				focus: true,
				lang: "ko-KR",
				placeholder: '최대 2048자리까지 가능',
				callbacks: {	//여기 부분이 이미지를 첨부하는 부분
					onImageUpload : function(files) {
						uploadSummernoteImageFile(files[0],this);
					},
					onPaste: function (e) {
						var clipboardData = e.originalEvent.clipboardData;
						if (clipboardData && clipboardData.items && clipboardData.items.length) {
							var item = clipboardData.items[0];
							if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
								e.preventDefault();
							}
						}
					}
				}
			});
			 
			 
			function uploadSummernoteImageFile(file, editor) {
				data = new FormData();
				console.log(data);
				data.append("file", file);
				$.ajax({
					data : data,
					type : "POST",
					url : "/fboard/uploadSummernoteImageFile",
					contentType : false,
					processData : false,
					success : function(data) {
		            	//항상 업로드된 파일의 url이 있어야 한다.
						$(editor).summernote('insertImage', data.url);
		            	alert("tjdrhd")
					}
				});
			} 
		})
	 
	</script>

</body>
	<%@include file="../includes/footer.jsp"%>
</body>
</html>