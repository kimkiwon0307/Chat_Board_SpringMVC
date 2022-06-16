package com.kim.chatHandler;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.log4j.Log4j2;


public class ChattingHandler2 extends TextWebSocketHandler{
			
		private Set<WebSocketSession> sessionList 
		= Collections.synchronizedSet(new HashSet<WebSocketSession>());
	
		
		@Override
		public void afterConnectionEstablished(WebSocketSession session) {
			
			sessionList.add(session); // 세션 추가
			System.out.println(session.getId() + "님이 접속했습니다.");
		}
		
		@Override
		public void handleTextMessage(WebSocketSession session, TextMessage message) throws IOException{
			
			synchronized(sessionList) {
				for(WebSocketSession s : sessionList) {
					s.sendMessage(new TextMessage(session.getPrincipal().getName() + ":" + message.getPayload()));
				}
			}
		}
		
		@Override
		public void afterConnectionClosed(WebSocketSession session, CloseStatus status) {
			
			sessionList.remove(session);
			System.out.println("웹소켓 종료" + session.getId());
		}
		
		
}
