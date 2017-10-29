package com.display.maven.display.service;

import java.util.List;

import com.display.maven.display.domain.Title;

public interface TitleService {

	/**
	 * 查询数据库中的title
	 * @return
	 */
	List<Title> getAllTitle(String groupid);
	/**
	 * 修改标题
	 */
	int updateTitle(Title title);
}
