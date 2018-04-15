package com.gechao.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gechao.bean.Problem;
import com.gechao.bean.ProblemWithBLOBs;
import com.gechao.service.ProblemService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class ProblemController {
	@Autowired
	ProblemService problemService;

	@RequestMapping("/problems")
	public String home(
			@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			Model model) {
		System.out.println(pn);
		PageHelper.startPage(pn, 2);
		List<Problem> problemList = problemService.getProblems();
		PageInfo<Problem> page = new PageInfo<Problem>(problemList, 6);

		model.addAttribute("problemList", page);

		return "problems";
	}

	@RequestMapping("/problem/{id}")
	public String problemDetail(@PathVariable("id") String id, Model model) {
		ProblemWithBLOBs problem = problemService.getProblemById(id);
		model.addAttribute("problem", problem);
		return "problem_detail";
	}

	@RequestMapping("/problem")
	public String problemSearch(
			@RequestParam(value = "title", defaultValue = "") String title,
			@RequestParam(value = "pid", defaultValue = "") String pid,
			@RequestParam(value = "source", defaultValue = "") String source,
			@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			Model model) {
		PageHelper.startPage(pn, 2);

		List<Problem> problemList = problemService.getProblems();
		PageInfo<Problem> page = new PageInfo<Problem>(problemList, 6);

		model.addAttribute("problemList", page);

		return "problems";
	}

	// 提交代码编译
	@RequestMapping("/problem/submit")
	public String problemSubmit(HttpServletRequest request, Model model) throws IOException {
		String id = request.getParameter("pid");
		String language = request.getParameter("compiler_id");
		String source = request.getParameter("code");
		HashMap<String, String> cookie = new  HashMap<>();
		HashMap<String, String> data = new  HashMap<>();
		cookie.put("lastlang", "3");
		cookie.put("user_id", (String) request.getSession().getAttribute("userId"));
//		cookie.put("PHPSESSID", "um2uhehvpsdo9o654c78av1c44");
		
		data.put("id", id);
		data.put("language", language);
		data.put("source", source);
		System.out.println("data:"+data);
		System.out.println("cookie:"+cookie);
		data.put("csrf", "qW9cwcXWlqaprjvxF7miIKZdzci5g8zV");
		Document document = Jsoup.connect("http://59.110.141.67/hustoj/submit.php").cookies(cookie).data(data).post();
		System.out.println(document);

		
		
		return "";
	}

}
