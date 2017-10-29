package com.display.maven.display.service;

import java.util.List;

import com.display.maven.display.domain.Background;

public interface BackgroundService {
	List<Background> getAllBackGround();

	//通过id搜索background
	Background getBackgroundById(String id);
	/**
	 * 获取所有大背景
	 */
	List<Background> getAllBigBg();

	int addBackgroundGetId(Background background);
	//通过name找background
	List<Background> getBackgroundByName(String bgname);
	//新增background
	int addBackground(Background background);
}
