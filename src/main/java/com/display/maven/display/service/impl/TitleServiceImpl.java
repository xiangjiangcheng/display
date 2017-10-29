package com.display.maven.display.service.impl;


import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.display.maven.display.dao.TitleMapper;
import com.display.maven.display.domain.Title;
import com.display.maven.display.service.TitleService;
import com.display.maven.util.DateUtil;
@Service
public class TitleServiceImpl implements TitleService {

	@Resource
	private TitleMapper titleMapper;

	@Override
	public List<Title> getAllTitle(String groupid) {
		// TODO Auto-generated method stub
		return titleMapper.getAllTitle(groupid);
	}
/**
 * 修改title
 */
	@Override
	public int updateTitle(Title title) {
		int i=0;
		Date time = new Date();
		title.setUpdatetime(time);
		title.setDlt(0);
		i=titleMapper.updateByPrimaryKeySelective(title);
		return i;
	}
	
}
