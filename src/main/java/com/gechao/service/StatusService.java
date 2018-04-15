package com.gechao.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gechao.bean.Solution;
import com.gechao.dao.SolutionMapper;

@Service
public class StatusService {
	@Autowired
	SolutionMapper solutionMapper;

	public List<Solution> getSolutions() {
		return solutionMapper.selectByExample(null);
	}

	public Solution getSolutionById(String id) {
		return solutionMapper.selectByPrimaryKey(Integer.valueOf(id));
	}

}
