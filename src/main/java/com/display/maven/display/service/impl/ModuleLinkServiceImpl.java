package com.display.maven.display.service.impl;


import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.display.maven.display.dao.ModuleLinkMapper;
import com.display.maven.display.dao.TitleMapper;
import com.display.maven.display.domain.ModuleLink;
import com.display.maven.display.domain.Title;
import com.display.maven.display.service.ModuleLinkService;
import com.display.maven.display.service.TitleService;
import com.display.maven.util.DateUtil;
import com.display.maven.util.UUIDUtil;
import com.sun.star.ucb.Link;
@Service
public class ModuleLinkServiceImpl implements ModuleLinkService {

	@Resource
	private ModuleLinkMapper moduleLinkMapper;

	@Override
	public List<ModuleLink> getByGroupidAndMenuid(String groupid, String menuid) {
		List<ModuleLink> moduleLinks = moduleLinkMapper.selectByGroupidAndMenuid(groupid, menuid);
		return moduleLinks;
	}

	@Override
	public List<ModuleLink> getByUrl(String url) {
		List<ModuleLink> moduleLinks = moduleLinkMapper.selectByUrl(url);
		return moduleLinks;
	}

	@Override
	public int addLink(ModuleLink moduleLink) {
		moduleLink.setId(UUIDUtil.getUUID());
		int i = moduleLinkMapper.insertSelective(moduleLink);
		return i;
	}

	@Override
	public int updateLink(ModuleLink moduleLink) {
		int i = moduleLinkMapper.updateByPrimaryKeySelective(moduleLink);
		return i;
	}

/*	@Override
	public List<Title> getAllTitle(String groupid) {
		// TODO Auto-generated method stub
		return titleMapper.getAllTitle(groupid);
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
	/**
	 * 通过pid查询数据
	 */
/*@Override
public ModuleLink getMenuByPid(String pid) {
	
	return moduleLinkMapper.getMenuByPid(pid);
}*/
	
}
