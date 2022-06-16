package com.kim.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {

	 @GetMapping("/chat")
	    public void chat(){
		 System.out.println("hi");
	    }
}
