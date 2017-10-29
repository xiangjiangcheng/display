package com.display.maven.display.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.display.maven.display.dao.BackgroundMapper;
import com.display.maven.display.domain.Background;
import com.display.maven.display.service.BackgroundService;
import com.display.maven.util.UUIDUtil;

@Service
public class BackgroundServiceImpl implements BackgroundService {
	
	@Resource
	private BackgroundMapper backgroundMapper;

	@Override
	public List<Background> getAllBackGround() {
		List<Background> backgrounds=backgroundMapper.getAllMenuBackground();
		return backgrounds;
	}

	@Override
	public Background getBackgroundById(String id) {
		Background background = backgroundMapper.selectByPrimaryKey(id);
		return background;
	}

	@Override
	public List<Background> getAllBigBg() {
		List<Background> backgrounds = backgroundMapper.getAllBigBg();
		return backgrounds;
	}
	
	// 添加背景并得到该条背景的id
	@Override
	public int addBackgroundGetId(Background background) {
		
		return backgroundMapper.insertSelective(background);
	}

	@Override
	public List<Background> getBackgroundByName(String bgname) {
		List<Background> backgrounds = backgroundMapper.getBackgroundByName(bgname);
		return backgrounds;
	}

	@Override
	public int addBackground(Background background) {
		int i=0;
		Date createtime = new Date();
		background.setDlt(0);
		background.setId(UUIDUtil.getUUID());
		background.setType(2);
		background.setCreatetime(createtime);
		i = backgroundMapper.insertSelective(background);
		return i;
	}

}
