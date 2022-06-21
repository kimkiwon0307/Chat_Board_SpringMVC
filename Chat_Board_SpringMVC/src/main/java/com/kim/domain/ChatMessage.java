package com.kim.domain;

import java.awt.TrayIcon.MessageType;

import lombok.Data;

@Data
public class ChatMessage {
	
	private String chatRoomId;
	private String writer;
	private String message;
	private MessageType type;
	
}
