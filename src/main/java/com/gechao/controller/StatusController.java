package com.gechao.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gechao.bean.News;
import com.gechao.bean.Problem;
import com.gechao.bean.ProblemWithBLOBs;
import com.gechao.bean.Solution;
import com.gechao.service.NewsService;
import com.gechao.service.ProblemService;
import com.gechao.service.StatusService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class StatusController {
	@Autowired
	StatusService statusService;

	@RequestMapping("/status")
	public String status(
			@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			Model model) {
		System.out.println(pn);
		PageHelper.startPage(pn, 2);
		List<Solution> solutionList = statusService.getSolutions();
		PageInfo<Solution> page = new PageInfo<Solution>(solutionList, 6);

		model.addAttribute("solutionList", page);

		return "status";
	}

	@RequestMapping("/status/{id}")
	public String solutionDetail(@PathVariable("id") String id, Model model) {
		Solution solution = statusService.getSolutionById(id);
		model.addAttribute("solution", solution);
		return "status_detail";
	}

}
