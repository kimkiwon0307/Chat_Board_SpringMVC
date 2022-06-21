<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>채팅 서비스</title>
 	<style>
 		#chatWindow{border:1px solid black; width:270px; height:310px; overflow:scroll; padding:5px;}
		#chatMessage{width:236px; height:30px;}
		#sendBtn{height:30px; position:relative; top:2px; left:-2px;}
		#closeBtn{margin-bottom:3px; position:relative; top:2px; left:-2px;}
		#chatId{width:158px; height:24px; border:1px solid #AAAAAA; background-color:#EEEEEE;}
		.myMsg{text-align:right;}
 	</style>
</head>
<body>
	
	대화명 : <input type="text" id="chatId" value="반가워" readonly/>
	<button id="closeBtn" onclick="disconnect();">채팅종료</button>
	<div id="chatWindow"></div>
	<div>
		<input type="text" id="chatMessage" onkeyup="enterKey();">
		<button id="sendBtn" onclick="sendMessage();">전송</button>
	</div>


<script>
	var webSocket = new WebSocket("ws://localhost:8090/");
	var chatWindow, chatMessage, chatId;
	
	window.onload = function (){
		chatWindow = document.getElementById("chatWindow");
		chatMessage = document.getElementById("chatMessage");
		chatId = "반가워";
	}
	
	function sendMessage(){
		
		chatWindow.innerHTML += "<div class='myMsg'>" + chatMessage.value + "</div>"
		webSocket.send(chatId + ":" + chatMessage.value);
		chatMessage.value = "";
		chatWindow.scrollTop = chatWindow.scrollHeight;
		
	}
	
	function disconnect(){
		webSocket.close();
	}
	
	function enterKey(){
		
		if(window.event.keyCode == 13){
			sendMessage();
		}
	}
	
	webSocket.onopen = function(event){
		chatWindow.innerHTML += "웹소켓 서버에 연결되었습니다.<br/>";
	};
	
	webSocket.onclose = function(event){
		chatWindow.innerHTML += "웹 소켓 서버가 종료 되었습니다. <br/>"
	};
	
 	webSocket.onmessage = function(event){
 		
 		var message = event.data.split("|");
 		var sender = message[0];
 		var content = message[1];
 		if(content != ""){
 			if(content.match("/")){
 				var temp = content.replace(("/" + chatId), "[귓속말] : ");
 				chatWindow.innerHTML += "<div>" + sender + "" + temp + "</div>";
 			}
 		}else {
 			chatWindow.innerHTML += "<div>" + sender + " : " + content + "</div>";
 		}
 	}
 	chatWindow.scrollTop = chatWindow.scrollHeight;

</script>
</body>
</html>