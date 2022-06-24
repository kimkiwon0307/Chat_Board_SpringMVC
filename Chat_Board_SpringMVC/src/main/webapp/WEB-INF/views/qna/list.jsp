<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert f_title here</title>
<style>
.go_get{
	text-decoration : none;
	color:black;
}
.go_get:hover{
	text-decoration : none;
	color:red;
}
thead{
	background-color:antiquewhite;
}

</style>
</head>
<body>

	<%@include file="../includes/header.jsp"%>
	<div class="container">
		<div class="container-fluid">
			<div class="table-responsive" style="text-align: center">
				<table class="table table-striped table-sm">
					<thead>
						<tr>
							<th scope="col" >번호</th>
							<th scope="col" >제목</th>
							<th scope="col">이름</th>
							<th scope="col">날짜</th>
							<th scope="col">조회</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="qvo">
							<tr>
								<c:if test="${qvo.q_step == 0 }">
								<td><c:out value="${qvo.q_no}" /></td>
								</c:if>
								
								<c:if test="${qvo.q_step > 0 }">
								<td style="text-align: left;"></td>
								</c:if>
								
								<td style="text-align: left;">
								<c:if test ="${qvo.q_step > 0 }">
									<c:forEach begin="1" end="${qvo.q_step}">
										 &nbsp;&nbsp;
									</c:forEach>
									답변 : 
								</c:if>
								<a class="go_get" href="${qvo.q_no}">	<c:out value="${qvo.q_title}" />
								</a>
								</td>
								<td><c:out value="${qvo.q_writer}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${qvo.q_date}" /></td>
								<td><c:out value="${qvo.q_count}"/></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>


				<!-- modal -->
				<div class="modal" tabindex="-1" id="checkModal">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-f_title">Q&A</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<p>처리가 완료되었습니다.</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
				<!-- /modal -->
		
			</div>
			
			<!-- pagination -->
			<nav aria-label="Page navigation" style="float:right;">
				<ul class="pagination">
					
				  <c:if test="${pageMaker.prev}">
					<li class="page-item disabled">
						<a class="page-link" href="${pageMaker.startPage -1}"tabindex="-1" aria-disabled="true">Previous</a>
					</li>
				  </c:if>	

				  <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
					<li class="page-item ${pageMaker.cri.pageNum == num ? "active" : "" }">
						<a class="page-link" id="page_num" href="${num}">${num}</a>
					</li>
				  </c:forEach>

				   <c:if test="${pageMaker.next}">
					<li class="page-item">
						<a class="page-link" href="${pageMaker.endPage -1}">Next</a>
					</li>
				  </c:if>
				</ul>
			</nav>
		<!-- /pagination -->
		
		
			<button type="button" class="btn btn-primary" id="btn_register">등록</button>
			
			<form action="/qna/list" method="get" id="with_paging">
				<input type="hidden" name='pageNum' value="${pageMaker.cri.pageNum}">
				<input type="hidden" name='amount' value="${pageMaker.cri.amount}">
			</form>
			
		</div>
	</div>
	<%@include file="../includes/footer.jsp"%>

	<script>
		$(document).ready(function(){
			
			
			// 게시판 제목 눌렀을 때 조회(get) 페이지로 이동하는 함수
			$(".go_get").on("click",function(e){
				
				//이벤트를 막는다
				e.preventDefault();
				
				// q_no 값을 가져온다.
				q_no = $(this).attr('href');
				
				// 조회 페이지로 이동한다.
				self.location = "/qna/get?q_no=" + q_no;
				
				// 클릭이벤트 재실행 한다.
				$(this).unbind('click').click();
			})
			
			// 글 등록페이지로 이동
			$("#btn_register").on("click",function(){
				self.location = "/qna/register";
			})
			
			// 1이면 새글 2이면 글수정 3이면 글삭제
			var result = '<c:out value="${result}"/>';
			
			//모달함수 실행
			checkModal(result);
			
			// 게시글 작성하고 리스트로 돌아오면 실행되는 모달함수
			function checkModal(result){
				
				if(result == '2'){
					$(".modal-body").html("Q&A 글이  수정되었습니다.");
					$("#checkModal").modal("show");
				}else if(result == '1'){
					$(".modal-body").html("Q&A 글이  등록되었습니다.");
					$("#checkModal").modal("show");
				}else if(result == '3'){
					$(".modal-body").html("Q&A 글이  삭제되었습니다.");
					$("#checkModal").modal("show");
				}
			} // /function checkModal(result)
		
			
						
			$(".page-item a").on("click",function(e){
				e.preventDefault();
				$("#with_paging").find('input[name="pageNum"]').val($(this).attr("href"));
				$("#with_paging").submit();
				
			})
			
			
			
		}) // /$(document).ready(function(){})
		
		
	</script>

</body>
</html>