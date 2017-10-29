package com.display.maven.display.service.impl;


import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.display.maven.display.dao.GroupMapper;
import com.display.maven.display.dao.ModuleRichMapper;
import com.display.maven.display.dao.TitleMapper;
import com.display.maven.display.domain.ModuleRich;
import com.display.maven.display.domain.Title;
import com.display.maven.display.domain.User;
import com.display.maven.display.service.ModuleRichService;
import com.display.maven.display.service.TitleService;
import com.display.maven.util.DateUtil;
import com.display.maven.util.UUIDUtil;
@Service
public class ModuleRichServiceImpl implements ModuleRichService {
	@Resource
	private ModuleRichMapper ModuleRichMapper;

	/**
	 * 通过标题查询富文本
	 */
	@Override
	public List<ModuleRich> queryRichByUserame(String richtitle,String moduleId) {
		return ModuleRichMapper.queryRichByUserame(richtitle,moduleId);
	}

	@Override
	public ModuleRich getRichById(String id) {
		// TODO Auto-generated method stub
		return ModuleRichMapper.getRichById(id);
	}
	/**
	 * 修改富文本
	 */
	@Override
	public boolean updateRich(ModuleRich moduleRich) {
		// TODO Auto-generated method stub
		return ModuleRichMapper.updateByPrimaryKeySelective(moduleRich)==1?true:false;
	}
	/**
	 * 添加富文本
	 */
	@Override
	public boolean addRich(ModuleRich moduleRich) {
		// TODO Auto-generated method stub
		//Date date = new Date();
		moduleRich.setId(UUIDUtil.getUUID());
		//moduleRich.setCreatetime(date);
		return ModuleRichMapper.insertSelective(moduleRich)==1?true:false;
	}
	/**
	 * 删除富文本
	 */
	@Override
	public boolean deleteRich(String id) {
		return ModuleRichMapper.deleteRich(id)==1?true:false;
	}

	/*@Resource
	private TitleMapper titleMapper;

	@Override
	public Title getAllTitle() {
		// TODO Auto-generated method stub
		return titleMapper.getAllTitle();
	}
*//**
 * 修改title
 *//*
	@Override
	public int updateTitle(Title title) {
		int i=0;
		Date time = new Date();
		title.setUpdatetime(time);
		title.setDlt(0);
		i=titleMapper.updateByPrimaryKeySelective(title);
		return i;
	}*/
	
}
