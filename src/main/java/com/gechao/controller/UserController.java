package com.gechao.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gechao.bean.User;
import com.gechao.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	UserService userService;

	@RequestMapping("/login")
	public String login_page() {
		return "login";
	}

	@RequestMapping("/log")
	@ResponseBody
	public String login(User user, Model model, HttpSession session)
			throws NoSuchAlgorithmException, UnsupportedEncodingException {
		System.out.println("-------------login---------------");
		System.out.println(user.toString());

		HashMap<String, String> data = new HashMap<>();
		data.put("user_id", user.getUserId());
		data.put("password", user.getPassword());

		boolean login = userService.login(user);
		if (login) {// 如果登录成功 进行下一步
			System.out.println("登录成功！");
			session.setAttribute("userId", user.getUserId());
			try {
				Connection connection = Jsoup.connect(
						"http://59.110.141.67/hustoj/login.php").data(data);
				Map<String, String> cookies = connection.execute().cookies();
				String PHPSESSID = cookies.get("PHPSESSID");
				session.setAttribute("PHPSESSID", PHPSESSID);
				return "success";
			} catch (IOException e) {
				e.printStackTrace();
				return "error";
			}
		} else {
			System.out.println("登录失败！");
			return "error";
		}

	}

	@RequestMapping("/login/checkUser/{userId}")
	@ResponseBody
	public String check(@PathVariable("userId") String userId) {
		boolean checkUserId = userService.checkUserId(userId);
		if (!checkUserId) {// 用户名已存在
			return "exists";
		} else {
			return "success";
		}
	}

	@RequestMapping("/register")
	public String register() {
		return "reg";
	}

	@ResponseBody
	@RequestMapping("/regis")
	public String registerMethod(User user) {
		user.setDefunct("N");
		System.out.println(user);
		
		boolean save = userService.save(user);
		return save ? "success" : "error";
	}

	@ResponseBody
	@RequestMapping("/signout")
	public String signOut(HttpSession session) {
		session.removeAttribute("userId");
		return "success";
	}

}
