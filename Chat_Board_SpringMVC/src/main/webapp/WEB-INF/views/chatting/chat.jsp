<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<meta charset="UTF-8">
	<title>Chating</title>
	<style>
		*{
			margin:0;
			padding:0;
		}
		.container{
			width: 500px;
			margin: 0 auto;
			padding: 25px
		}
		.container h1{
			text-align: left;
			padding: 5px 5px 5px 15px;
			color: #FFBB00;
			border-left: 3px solid #FFBB00;
			margin-bottom: 20px;
		}
		.chating{
			background-color: #99b9c1;
			height: 500px;
			overflow: auto;
		}
		input{
			width: 330px;
			height: 25px;
		}
	 	#yourMsg{
			display: none;
		} 
		.myMsg{
			text-align:right;
			height : 30px;
			margin-top : 10px;
			margin-bottom:30px;
			}
		.myMsg>span{
			background-color:yellow;
			margin-right:10px;
			display: inline-block;
			text-align: center;
			border-radius:5px;
			padding:10px;
		}
  
#sender{
	margin-top:10px;
	margin-bottom:30px;
}
#content_sty{
	background-color: white;
	padding: 10px;
	border-radius: 5px;
}
		
#sender_span{
	margin-left:10px;
}
#king_img{
	width:50px;
}
#chatting{
	width: 500px;
	height : auto;
}
#out_th{
	position:absolute; 
	margin-left:665px
}	
	</style>
</head>

<body>
	<%@include file="../includes/header.jsp"%>
	
	<div id="container" class="container">
		
		<div id="chating" class="chating">
			
		</div>
		
		<input type="hidden" value="<c:out value='${chatRoomMap.r_no}'/>" id="r_no"/>
		<input type="hidden" value="<c:out value='${chatRoomMap.r_writer}'/>" id="r_writer"/>
		
		<div id="yourName">
			<table class="inputTable">
				<tr>
					<th><button class="btn btn-success" onclick="chatName()" id="startBtn">채팅 시작</button></th>
				</tr>
			</table>
		</div> 
	
		<div id="yourMsg">
			<table class="inputTable">
				<tr>
						<th><input type="hidden" id="nick" value="${member.m_nick}"/>
						<th>
							<div class="input-group mb-3">
							  <input type="text" id="chatting" class="form-control" placeholder="보내실 메시지를 입력하세요." aria-label="Recipient's username" aria-describedby="button-addon2" >
							  <button class="btn btn-outline-success" type="button"  onclick="send()" id="sendBtn">작성</button>
							</div>
						</th>
						
						<th id="out_th"><button class="btn btn-outline-danger" onclick="out()" id="room_out">나가기</button></th>
				</tr> 
				
			</table>
		</div>
	</div>
	
	<script>
	
	var chating ;
	
	function wsOpen(){
		var r_no = $("#r_no").val();
		ws = new WebSocket("ws://" + location.host + "/chating/" + r_no);
		
		$("#yourName").hide();
		$("#yourMsg").show();
		
		wsEvt();
	
	}
		 
	function wsEvt() {
	
		//소켓이 열리면 초기화 세팅하기
		ws.onopen = function(data){
		/* 	chatWindow = document.getElementById("chating"); */
			chating = $("#chating");
			var data = "님이 접속했습니다."
			send(data);
		}
		   
		ws.onmessage = function(data) {
			var msg = data.data.split("|");
			var sender = msg[0];
			var content = msg[1];
			var r_writer = $("#r_writer").val();
		
			if(sender == r_writer && msg != null){
				chating.append("<div id='sender'><span id='sender_span'><img src='/resources/image/king.png' alt='왕관' id='king_img'/>"+ sender+ "</span> " +"<span id='content_sty'>"+ content +"</span></div>");
			}
			else if(sender != r_writer && msg != null){
				chating.append("<div id='sender'><span id='sender_span'><img src='/resources/image/man.png' alt='사람' id='king_img'/>"+ sender+ "</span> " +"<span id='content_sty'>"+ content +"</span></div>");
			}
	   }
		
		
		document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){ //enter press
				send();
			}
		});
		
	} 

	function chatName(){
			wsOpen();
			
	}

	function send(data) { 
		var uN = $("#nick").val();
		var msg = $("#chatting").val();
		
		if(!msg && !data){
			alert("메시지를 입력해주세요");
			return;
		}
		
		if(data){
			chating.append( "<div class='myMsg'><span>"+ uN + data +"</span></div>");
			ws.send(uN +"|"+ data);
		}else {
			chating.append( "<div class='myMsg'><span>"+ msg +"</span></div>");
			ws.send(uN +"|"+ msg);
		}
		/* chatWindow.scrollTop = chatWindow.scrollHeight; */
			chating.scrollTop($(document).height());
		
		$('#chatting').val("");
	}

	function out(){
	
	
		var	room_writer = $("#r_writer").val();
		var	room_rno =  $("#r_no").val();
		var data = {r_writer : room_writer, r_no : room_rno};
		var m_nick = $("#nick").val();
		
		
	 	 if(room_writer == m_nick){
			
	 		 if(confirm("방을 삭제하시겠습니까?")){
	 		 
	 		 $.ajax({
					type : "post",
					url : "/chatting/delete",
					data : data,
					success : function(result) {
						console.log(result)
						var data = "님이 퇴장하셨습니다.";
						send(data);
						self.location = "/chatting/list";
					}
				}); 
	 		 }else{
	 			 return;
	 		 }
		}else{
			self.location = "/chatting/list";
			var data = "님이 퇴장하셨습니다.";
			send(data);
			}   
		}
	</script>
		<%@include file="../includes/footer.jsp"%>
</body>
</html>