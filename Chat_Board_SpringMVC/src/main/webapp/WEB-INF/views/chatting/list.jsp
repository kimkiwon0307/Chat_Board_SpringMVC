<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅</title>
<%@include file="../includes/header.jsp"%>
</head>
<body>
<h1>채팅리스트</h1>
<div class="container">
		<div class="container-fluid">
	 
			<div class="table-responsive" style="text-align: center">
				<table class="table table-striped table-sm">
					<thead>
						<tr>
							<th scope="col">작성자</th>
							<th scope="col">제목</th>
							<th scope="col">입장 버튼</th>
						</tr>
					</thead>
					<tbody id="ddd">
						<c:forEach items="${chatRoomMap}" var="chatRoomMap" varStatus="status">
							<tr>
								<td>${chatRoomMap.value.r_writer}</td>
								<td>${chatRoomMap.value.r_title}</td>
							 	<td><button class="chat_btn" id="go_chatting" data-room="${chatRoomMap.value.r_no}">입장</button></td> 
							</tr>
						</c:forEach> 
					</tbody>
				</table>
			</div>
			
			<!-- 모달 -->

			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">방 만들기</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form>
								<div class="mb-3">
									<label for="recipient-name" class="col-form-label">작성자</label>
									<input type="text" class="form-control" id="modal-name" name="r_writer" value="${member.m_nick}" readonly>
								</div>
								<div class="mb-3">
									<label for="message-text" class="col-form-label">방제목</label>
									<input type="text" class="form-control" id="modal-title" name="r_title" required="required">
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-primary" id="room_register">만들기</button>
						</div>
					</div>
				</div>
			</div>

			<button type="button" class="btn btn-primary" 
			data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">방 만들기</button>
		</div>
	</div>
	
	<script>
		$(document).ready(function(){
			
			
			
			$("#room_register").on("click",function(){
				
				var r_writer = $("#modal-name").val();
				var r_title = $("#modal-title").val();
				var r_no = guid();
				var data = {r_writer : r_writer, r_title : r_title, r_no : r_no};
				
				$.ajax({
					type: "post",
					url : "/chatting/register",
					data : data,
					success : function(result){
						console.log(result)
						self.location="/chatting/chat?r_no=" + r_no;
						}
				}); 
				 
				
				function guid() {
					  function s4() {
					    return ((1 + Math.random()) * 0x10000 | 0).toString(16).substring(1);
					  }
					  return s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4() + s4() + s4();
					}

				
			})
			
			
		$(".chat_btn").on("click",function(){
				
				var r_no = $(this).data('room');
				
				self.location = "/chatting/chat?r_no=" + r_no ;
			})
			
		})
	</script>
	
</body>
</html>