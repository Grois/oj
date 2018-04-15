package com.gechao.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommonController {

	@RequestMapping("/faq")
	public String faq() {
		return "faq";
	}

}
