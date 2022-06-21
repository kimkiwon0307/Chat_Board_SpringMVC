package com.kim.domain;

import lombok.Data;

@Data
public class ChatRoomVO {
	
	private String r_no; // 방번호 UUID
	private String r_writer; // 방 작성자
	private String r_title; // 방 제목
	
}
