package com.display.maven.display.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.swing.text.StyledEditorKit.BoldAction;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.display.maven.display.dao.BackgroundMapper;
import com.display.maven.display.dao.IconMapper;
import com.display.maven.display.dao.MenuConfigMapper;
import com.display.maven.display.dao.TitleMapper;
import com.display.maven.display.domain.Background;
import com.display.maven.display.domain.Icon;
import com.display.maven.display.domain.MenuConfig;
import com.display.maven.display.domain.extend.MenuConfigExtend;
import com.display.maven.display.service.MenuConfigService;
import com.display.maven.exception.CallBackException;

@Service
public class MenuConfigServiceImpl implements MenuConfigService {
	@Resource
	private TitleMapper titleMapper;
	@Resource
	private MenuConfigMapper menuConfigMapper;
	@Resource
	private IconMapper iconMapper;
	@Resource
	private BackgroundMapper backgroundMapper;
	
	private static final transient Logger log = LoggerFactory.getLogger(MenuConfigServiceImpl.class);
	
	// 得到所有的菜单配置信息
	public List<MenuConfig> getAllMenuConfig() {
		return menuConfigMapper.getAllMenuConfig();
	}

	// 得到所有的背景图片
	@Override
	public List<Background> getAllBackground() {
		return backgroundMapper.getAllMenuBackground();
	}

	// 得到所有的图标
	@Override
	public List<Icon> getAllIcon() {
		return iconMapper.getAllMenuIcon();
	}
	
	// 通过菜单级别去查询该菜单下面的子菜单  - 这里用的level字段查询的
	@Override
	public List<MenuConfig> getMenuByLevel(String level, String groupid) {
		return menuConfigMapper.getMenuByLevel(level, groupid);
	}

	@Override
	public int updateMenuConfig(MenuConfig menuConfig, String groupid) {		
		
		String bgid=menuConfig.getBackgroundid();
		String iconname=menuConfig.getIconid();
		
		if(StringUtils.isNotBlank(bgid)){
			Background background=new Background();
			String bid=bgid.substring(0, bgid.length()-4);
			background.setId(bid);
			background.setBgname(bgid);
			menuConfig.setBackgroundid(bid);
			int i=backgroundMapper.insertSelective(background);
			if(i==1){
				log.info("==========插入背景图成功，然后插入图标！==========");
			}else{
				throw new CallBackException("插入背景图失败！");
			}
		}else{
			log.info("==========没有修改背景图==========");
		}
		
		if(StringUtils.isNotBlank(iconname)){
			Icon icon=new Icon();
			String iid=iconname.substring(0, iconname.length()-4);
			icon.setId(iid);
			icon.setIconname(iconname);
			menuConfig.setIconid(iid);
			int j=iconMapper.insertSelective(icon);
			if(j==1){
				log.info("==========插入图标成功，修改排序前的原始orderby！==========");
			}else{
				throw new CallBackException("插入图标失败！");
			}
		}else{
			log.info("==========没有修改图标==========");
		}
		
		//查询出本菜单的原始orderby====>例如原始为1，现在要修改为2
		MenuConfig mConfig=menuConfigMapper.selectByPrimaryKey(menuConfig.getId());
		//原始的orderby====>1
		int originOrder=mConfig.getOrderby();
		//再根据menuConfig的orderby，查询出相同orderby的menuConfig
		//即将更改的orderby====>menuConfig是接受的数据，所以newOrder是即将修改的oder,===>2
		int newOrder=menuConfig.getOrderby();
		
		if(originOrder!=newOrder){
			
			//修改被替换的menuConfig====>现在去找orderby为2的menu,将orderby修改为1======>
			int k=menuConfigMapper.updateMenuConfigByOrderby(originOrder,newOrder,mConfig.getLevel(),mConfig.getPid());
		}
		
		// 判断被修改的菜单的大小是否要改变
		if(mConfig.getSize() != menuConfig.getSize()) {
			// 查出orderby 一级菜单的条数
			int count = menuConfigMapper.getMenuCount(groupid).size();
			// 原始的orderby
			int originOrder1 = mConfig.getOrderby(); 
			// 得到菜单组数 
			int menuNum = count / 4;
			int min = 0;
			int max = 0;
			// 要修改
			// 先修改其他对应菜单的数据
			if (mConfig.getSize() == 1) {
				// 原来的大小为1 则将他们同一排的size为2的一个改为1
				for (int i = 1; i <= menuNum; i++) {
					min = (i - 1 ) * 4 + 1;
				    max = i * 4;
				    // 判断该菜单在哪一个范围
				    if (originOrder1 >= min && originOrder1 <= max ) {
				    	// 查出该排size为2的数据
				    	MenuConfig menu = menuConfigMapper.getMenuByMinAndMax(groupid, min, max);
				    	if (menu != null) {
				    		menu.setSize(1);
				    		menuConfigMapper.updateByPrimaryKeySelective(menu);
				    		break;
				    	}
				    }
				}
			} else {
				// 原来的大小为2 则将他们同一排的orderby最小的一个改为2
				for (int i = 1; i <= menuNum; i++) {
					min = (i - 1 ) * 4 + 1;
				    max = i * 4;
				    // 判断该菜单在哪一个范围
				    if (originOrder1 >= min && originOrder1 <= max ) {
				    	// 查出该排size为1,orderby最小的数据
				    	List<MenuConfig> menu = menuConfigMapper.getMenuByMinOrderBy(groupid, min, max);
				    	if (menu.size() > 0) {
				    		menu.get(0).setSize(2);
				    		menuConfigMapper.updateByPrimaryKeySelective(menu.get(0));
				    		break;
				    	}
				    }
				}
			}
			
		} 
		
		
		// 更新被修改菜单的数据
		int l=menuConfigMapper.updateByPrimaryKeySelective(menuConfig);
		if(l==1){
			log.info("==========更新成功==========");
			return l;
		}else{
			throw new CallBackException("更新数据时失败！");
		}
		
	}
	
	/**
	 * 通过名字查询模块
	 */
	@Override
	public List<MenuConfigExtend> queryModuleByName(String name,String level,String groupid) {
		
		return menuConfigMapper.queryModuleByName(name,level,groupid);
	}
	
	/**
	 * 查看模块的的详情
	 */
	@Override
	public MenuConfigExtend getModeuleDetailById(String id) {
		MenuConfigExtend menuConfig=menuConfigMapper.getMenuById(id);
		Background background=backgroundMapper.selectByPrimaryKey(menuConfig.getBackgroundid());
		Icon icon=iconMapper.selectByPrimaryKey(menuConfig.getIconid());
		menuConfig.setBackgroundname(background.getBgname());
		menuConfig.setIconname(icon.getIconname());
		return menuConfig;
	}
	/**
	 * 删除
	 */
	@Override
	public boolean deleteModuleById(String id) {
		// 删除ProProjectScal
		if (menuConfigMapper.deleteModuleById(id)>= 1) {
			return true;
		} 
		return false;
	}
	
	/**
	 * 添加菜单
	 */
	@Override
	public boolean addMenu(MenuConfig menuConfig) {
		if (menuConfigMapper.insertSelective(menuConfig)>= 1) {
			return true;
		} 
		return false;
	}

	@Override
	public List<MenuConfig> getMenuByPid(String pid) {
		
		return menuConfigMapper.getMenuByPid(pid);
	}

	@Override
	public List<MenuConfig> getMenuByPidAndGroupId(String pid, String groupid) {
		// TODO Auto-generated method stub
		return menuConfigMapper.getMenuByPidAndGroupId(pid, groupid);
	}
	/**
	 * 通过id查标题
	 */
	@Override
	public MenuConfigExtend getMenuById(String menuid) {
		MenuConfigExtend menuConfig=menuConfigMapper.getMenuById(menuid);
		return menuConfig;
	}

	@Override
	public boolean updateIsHide(String menuid,int ishide) {
		boolean status = false;
		status = menuConfigMapper.updateIsHide(menuid, ishide)==1?true:false;
		return status;
	}

	@Override
	public List<MenuConfig> getMenuByPidAndGroupIdIsHide(String pid, String groupid) {
		// TODO Auto-generated method stub
		return menuConfigMapper.getMenuByPidAndGroupIdIsHide(pid, groupid);
	}

	@Override
	public int getMaxOrderBy(String pid, String groupid) {
		return menuConfigMapper.getMaxOrderBy(pid, groupid);
	}
}
