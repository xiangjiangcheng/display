package com.display.maven.display.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.display.maven.display.dao.IconMapper;
import com.display.maven.display.domain.Icon;
import com.display.maven.display.service.IconService;

@Service
public class IconServiceImpl implements IconService{
	@Resource
	private IconMapper iconMapper;

	@Override
	public List<Icon> getAllIcon() {
		List<Icon> icons=iconMapper.getAllMenuIcon();
		return icons;
	}

	@Override
	public int addIconGetId(Icon icon) {
		return iconMapper.insertSelective(icon);
	}
	

}
