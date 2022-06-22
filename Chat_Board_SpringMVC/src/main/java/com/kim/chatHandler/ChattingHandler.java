package com.kim.chatHandler;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;


public class ChattingHandler extends TextWebSocketHandler{
			
		private Set<WebSocketSession> sessionList = Collections.synchronizedSet(new HashSet<WebSocketSession>());
		 
		int sum = 1;
		
		@Override
		public void afterConnectionEstablished(WebSocketSession session) {
			
			sessionList.add(session); // 세션 추가
			System.out.println(session.getId() + "님이 접속했습니다.");
		}
		
		@Override
		public void handleTextMessage(WebSocketSession session, TextMessage message) throws IOException{
			
			
			String msg = message.getPayload();
			System.out.println(msg);
			synchronized(sessionList) {
				for(WebSocketSession s : sessionList) {
					if(!s.equals(session) && s.getUri().equals(session.getUri())) {
						System.out.println(session.getUri() == s.getUri());
				    	
						sum +=1;
						System.out.println("이값은"+sum);
						s.sendMessage(new TextMessage(msg));
					}
				}
				sum = 1;
			}
		}
		
		@Override
		public void afterConnectionClosed(WebSocketSession session, CloseStatus status) {
			
			sessionList.remove(session);
			System.out.println("웹소켓 종료" + session.getId());
		}
		

}
