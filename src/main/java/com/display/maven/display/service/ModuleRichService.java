package com.display.maven.display.service;

import java.util.List;

import com.display.maven.display.domain.ModuleRich;
import com.display.maven.display.domain.Title;
import com.display.maven.display.domain.User;

public interface ModuleRichService {
	/**
	 * 通过过标题查询富文本
	 * @param username
	 * @return
	 */
	List<ModuleRich> queryRichByUserame(String rulesname, String moduleId);
	/**
	 * 通过id查询富文本
	 * @param id
	 * @return
	 */
	ModuleRich getRichById(String id);
	/**
	 *修改富文本
	 * @param moduleRich
	 * @return
	 */
	boolean updateRich(ModuleRich moduleRich);
	boolean addRich(ModuleRich moduleRich);
	boolean deleteRich(String id);

/*	*//**
	 * 查询数据库中的title
	 * @return
	 *//*
	Title getAllTitle();
	*//**
	 * 修改标题
	 *//*
	int updateTitle(Title title);*/
	
	
}
