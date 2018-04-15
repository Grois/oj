package com.gechao.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gechao.bean.Solution;
import com.gechao.bean.User;
import com.gechao.bean.UserExample;
import com.gechao.dao.UserMapper;

@Service
public class UserService {
	@Autowired
	UserMapper userMapper;

	public boolean login(User user) {
		UserExample example = new UserExample();
		example.createCriteria().andUserIdEqualTo(user.getUserId())
				.andPasswordEqualTo(user.getPassword()).andDefunctEqualTo("N");
		List<User> userList = userMapper.selectByExample(example);
		return userList.size() == 0 ? false : true;
	}

	/**
	 * 检查重名
	 * 
	 * @param user
	 * @return
	 */
	public boolean checkUserId(String userId) {
		UserExample example = new UserExample();
		example.createCriteria().andUserIdEqualTo(userId);
		List<User> userList = userMapper.selectByExample(example);
		return userList.size() == 0 ? true : false;
	}

	/*
	 * 注册用户
	 */
	public boolean save(User user) {
		int insert = userMapper.insertSelective(user);
		return insert == 1 ? true : false;
	}

}
