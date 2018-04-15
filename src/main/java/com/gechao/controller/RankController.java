package com.gechao.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gechao.bean.Solution;
import com.gechao.bean.User;
import com.gechao.service.RankService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class RankController {
	@Autowired
	RankService rankService;

	@RequestMapping("/rank")
	public String rank(
			@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			Model model) {
		System.out.println(pn);
		PageHelper.startPage(pn, 2);
		List<User> userList = rankService.getRanks();
		PageInfo<User> page = new PageInfo<User>(userList, 6);

		model.addAttribute("userList", page);

		return "rank";
	}

//	@RequestMapping("/status/{id}")
//	public String solutionDetail(@PathVariable("id") String id, Model model) {
//		Solution solution = rankService.getSolutionById(id);
//		model.addAttribute("solution", solution);
//		return "status_detail";
//	}

}
