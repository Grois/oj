package com.gechao.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gechao.bean.News;
import com.gechao.service.NewsService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class HomeController {
	@Autowired
	NewsService newsService;

	@RequestMapping("/")
	public String home(
			@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			Model model) {
		System.out.println(pn);
		PageHelper.startPage(pn, 2);
		List<News> newsList = newsService.getHomeNews();
		PageInfo<News> page = new PageInfo<News>(newsList, 6);

		model.addAttribute("newsList", page);

		return "home";
	}

	@RequestMapping("/news/{id}")
	public String newsDetail(@PathVariable("id") String id, Model model) {
		News news = newsService.getNewsById(id);
		model.addAttribute("news", news);
		return "news_detail";
	}

	
}
