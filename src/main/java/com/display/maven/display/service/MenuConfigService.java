package com.display.maven.display.service;

import java.util.List;

import com.display.maven.display.domain.Background;
import com.display.maven.display.domain.Icon;
import com.display.maven.display.domain.MenuConfig;
import com.display.maven.display.domain.extend.MenuConfigExtend;

public interface MenuConfigService {
	// 得到所有的菜单配置信息
	public List<MenuConfig> getAllMenuConfig();

	// 得到所有的背景图片
	public List<Background> getAllBackground();

	// 得到所有的图标
	public List<Icon> getAllIcon();
	
	// 通过父id去查询该菜单下面的子菜单，如果pid=#;说明去查询所有的一级菜单
	public List<MenuConfig> getMenuByLevel(String level, String groupid);
	
	/**
	 * 通过名字查询模块
	 * @param name
	 * @return
	 */
	List<MenuConfigExtend> queryModuleByName(String name,String level,String groupid);
	
	MenuConfigExtend getModeuleDetailById(String id);
	/**
	 * 通过id删除模块
	 * @param id
	 * @return
	 */
	boolean deleteModuleById(String id);

	public boolean addMenu(MenuConfig menuConfig);
	
	/**
	 * 根据父id查询菜单 xjc
	 * @param pid
	 * @return
	 */
	public List<MenuConfig> getMenuByPid(String pid);

	public List<MenuConfig> getMenuByPidAndGroupId(String pid, String groupid);
	/**
	 * id查标题
	 * @param menuid
	 * @return
	 */
	public MenuConfigExtend getMenuById(String menuid);

	public boolean updateIsHide(String menuid, int ishide);

	public List<MenuConfig> getMenuByPidAndGroupIdIsHide(String pid, String groupid);

	public int getMaxOrderBy(String pid, String groupid);

	public int updateMenuConfig(MenuConfig menuConfig, String groupid);
}
