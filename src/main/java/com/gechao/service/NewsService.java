package com.gechao.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gechao.bean.News;
import com.gechao.bean.NewsExample;
import com.gechao.bean.NewsExample.Criteria;
import com.gechao.dao.NewsMapper;

@Service
public class NewsService {
	@Autowired
	NewsMapper newsMapper;

	/**
	 * 查询所有有效的新闻
	 * 
	 * @return
	 */
	public List<News> getHomeNews() {
		NewsExample example = new NewsExample();
		example.setOrderByClause("time desc");
		Criteria criteria = example.createCriteria();
		criteria.andDefunctEqualTo("N");
		return newsMapper.selectByExample(example);
	}
	
	public News getNewsById(String id){
		return newsMapper.selectByPrimaryKey(Integer.valueOf(id));
	}
	
	
	
	
}
