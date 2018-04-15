package com.gechao.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gechao.bean.Solution;
import com.gechao.bean.User;
import com.gechao.bean.UserExample;
import com.gechao.dao.UserMapper;

@Service
public class RankService {
	@Autowired
	UserMapper usrMapper;

	public List<User> getRanks() {
		UserExample example = new UserExample();
		example.setOrderByClause("solved desc");
		return usrMapper.selectByExample(example);
	}

	public User getUserById(String userId) {
		return usrMapper.selectByPrimaryKey(userId);
	}

}
