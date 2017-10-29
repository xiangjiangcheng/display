package com.display.maven.display.service;

import java.util.List;

import com.display.maven.display.domain.ModuleLink;
import com.display.maven.display.domain.Title;
import com.sun.star.ucb.Link;

public interface ModuleLinkService {

/*	*//**
	 * 查询数据库中的title
	 * @return
	 *//*
	List<Title> getAllTitle(String groupid);
	*//**
	 * 修改标题
	 *//*
	int updateTitle(Title title);*/
	List<ModuleLink> getByGroupidAndMenuid(String groupid,String menuid);
	
	List<ModuleLink> getByUrl(String url);
	
	int addLink(ModuleLink moduleLink);
	
	int updateLink(ModuleLink moduleLink);
}
