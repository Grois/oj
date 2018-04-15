package com.gechao.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gechao.bean.User;
import com.gechao.service.NewsService;

@Controller
public class AdminController {
	@Autowired
	NewsService newsService;

	@RequestMapping("/admin")
	public String admin() {
		return "/admin/index";
	}

	@RequestMapping("/admin/login")
	public String login(User user,Model model) {
		
		return "/admin/home";
	}

	@RequestMapping("/admin/tzgg")
	public String admin_tzgg() {
		return "/admin/tzgg";
	}

	@RequestMapping("/admin/news_manage")
	public String admin_news_manage() {
		return "/admin/xwgl";
	}

	@RequestMapping("/admin/news_add")
	public String admin_news_add() {
		return "/admin/xwzj";
	}

}
