package com.gechao.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gechao.bean.News;
import com.gechao.bean.NewsExample.Criteria;
import com.gechao.bean.Problem;
import com.gechao.bean.ProblemExample;
import com.gechao.bean.ProblemWithBLOBs;
import com.gechao.dao.ProblemMapper;

@Service
public class ProblemService {
	@Autowired
	ProblemMapper problemMapper;

	/**
	 * 获取问题列表
	 * 
	 * @return
	 */
	public List<Problem> getProblems() {
		ProblemExample example = new ProblemExample();
		// example.setOrderByClause("time desc");
		com.gechao.bean.ProblemExample.Criteria criteria = example
				.createCriteria();
		criteria.andDefunctEqualTo("N");
		return problemMapper.selectByExample(example);
	}

	public ProblemWithBLOBs getProblemById(String id) {
		return problemMapper.selectByPrimaryKey(Integer.valueOf(id));
	}

}
