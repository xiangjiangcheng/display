package com.display.maven.display.service.impl;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.aspectj.weaver.ast.Var;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.display.maven.display.dao.GroupMapper;
import com.display.maven.display.dao.MenuConfigMapper;
import com.display.maven.display.dao.TitleMapper;
import com.display.maven.display.domain.Group;
import com.display.maven.display.domain.MenuConfig;
import com.display.maven.display.domain.ModuleLink;
import com.display.maven.display.domain.Title;
import com.display.maven.display.service.GroupService;
import com.display.maven.exception.CallBackException;
import com.display.maven.util.UUIDUtil;

@Service
public class GroupServiceImpl implements GroupService{
	@Resource
	private GroupMapper groupMapper;
	@Resource
	private TitleMapper titleMapper;
	@Resource
	private MenuConfigMapper menuConfigMapper;
	
	private static final transient Logger log = LoggerFactory.getLogger(GroupServiceImpl.class);
	@Override
	public Group getGroupById(String id) {
		Group group=null;
		try{
			group= groupMapper.selectByPrimaryKey(id);
		}catch(Exception e){
			e.printStackTrace();
			
		}
		return group;
	}

	@Override
	public List<Group> getAllGroup() {
		
		return groupMapper.getAllGroup();
	}
	/**
	 * 查询班组信息
	 */
	@Override
	public List<Group> queryGroupByGroupName(String groupname) {
		return groupMapper.queryGroupByGroupName(groupname);
	}
	/**
	 * 删除班组
	 */
	@Override
	public boolean deleteGroupById(String id) {
		return groupMapper.deleteGroupById(id)==1?true:false;
	}

	@Override
	public boolean updateGroup(Group group) {
		return groupMapper.updateByPrimaryKeySelective(group)==1?true:false;
	}

	@Override
	public int addGroup(String groupname) {
		Group group=new Group();
		String groupId=UUIDUtil.getUUID();
		group.setId(groupId);
		group.setGroupname(groupname);
		int i=groupMapper.insertSelective(group);
		if(i==1){
			log.debug("插入班组信息成功，然后去生成默认数据,先生成首页标题背景等信息");
			Title title=this.initTitle(groupId);
			int j=titleMapper.insertSelective(title);
			if(j==1){
				log.debug("初始化首页标题背景等信息成功");
				int k=this.initMenuByGroup(groupId);
				if(k==1){
					log.debug("初始化首页菜单等信息成功");
					return k;
				}else{
					throw new CallBackException("初始化首页菜单等信息失败");
				}
			}else{
				throw new CallBackException("初始化首页标题背景等信息失败，请查明原因");
			}
		}else{
			throw new CallBackException("插入班组信息失败，请查明原因");
		}
		
	}
	
	public Title initTitle(String groupId){
		Title title=new Title();
		title.setGroupid(groupId);
		title.setId(UUIDUtil.getUUID());
		title.setTitle1("班级公务看过来");
		title.setTitle2("争创文明班组，争做优秀员工");
		title.setRemark(1+""); // 设为1
		title.setBackgroundid("21");
		return title;
	}
	public int initMenuByGroup(String groupId){
		
		int j=1;
		String idString = ""; // 记录一级菜单的id
		String realyIdString = ""; // 记录二级菜单的id
		for(int i=1;i<=9;i++){
			idString = UUIDUtil.getUUID(); // 给一级菜单id赋值
			realyIdString = UUIDUtil.getUUID(); // 给二级菜单id赋值
			MenuConfig menuConfig=new MenuConfig(); // 存储一级菜单
			MenuConfig realyMenuConfig=new MenuConfig(); // 存储类似于一级菜单的“二级菜单”
			ModuleLink link = new ModuleLink();
			// 初始化一级菜单
			menuConfig.setGroupid(groupId);
			menuConfig.setPid("#");
			menuConfig.setLevel(1);
			menuConfig.setId(idString); //该条一级菜单的id
			menuConfig.setBackgroundid(i+"");
			menuConfig.setIconid(i+"");
			if(i==5){
				menuConfig.setBackgroundid(11+"");
			}
			menuConfig.setOrderby(i-1);
			// 默认初始化类似于一级菜单的“二级菜单”
			realyMenuConfig.setGroupid(groupId);
			realyMenuConfig.setPid(idString);
			realyMenuConfig.setId(realyIdString); //该条二级菜单的id
			realyMenuConfig.setBackgroundid(i+"");
			realyMenuConfig.setIconid(i+"");
			realyMenuConfig.setOrderby(i-1);
			if(i==1){
				menuConfig.setTitle("通用配置");
				menuConfig.setType(4);
				menuConfig.setOrderby(null);
				// 这里单独插入 首页配置，相册管理，模块管理
				MenuConfig home=new MenuConfig(); 
				MenuConfig photo=new MenuConfig(); 
				MenuConfig menu=new MenuConfig(); 
				home.setTitle("首页配置");
				home.setGroupid(groupId);
				home.setPid(idString);
				home.setLevel(2);
				home.setId(UUIDUtil.getUUID()); 
				home.setUrl("/page/indexConfig");
				
				photo.setTitle("相册管理");
				photo.setGroupid(groupId);
				photo.setPid(idString);
				photo.setLevel(2);
				photo.setId(UUIDUtil.getUUID()); 
				photo.setUrl("/page/showPhoto");
				
				menu.setTitle("模块管理");
				menu.setGroupid(groupId);
				menu.setPid(idString);
				menu.setLevel(2);
				menu.setId(UUIDUtil.getUUID()); 
				menu.setUrl("/page/ModuleManger");
				int m = menuConfigMapper.insertSelective(home);
				m = menuConfigMapper.insertSelective(photo);
				m = menuConfigMapper.insertSelective(menu);
				if(m!=1){
					 throw new CallBackException("插入通用配置菜单时失败");
				}
				
			}else if(i==2){
				menuConfig.setTitle("职工之家");
				//menuConfig.setUrl("/page/showWeb");
				menuConfig.setType(5);
				//
				realyMenuConfig.setTitle("职工之家");
				realyMenuConfig.setUrl("/page/showWeb");
				realyMenuConfig.setType(5);
			}else if(i==3){
				menuConfig.setTitle("民主管理");
				menuConfig.setType(0);
				menuConfig.setSize(2);
				//
				realyMenuConfig.setTitle("民主管理");
				realyMenuConfig.setType(0);
				realyMenuConfig.setSize(2);
				// 特殊菜单，初始化时把民主管理菜单下面的菜单全部初始化完,目前共11个子菜单
				this.initMinZhuMenu(idString, groupId);
				
			}else if(i==4){
				menuConfig.setTitle("厂务公开");
				menuConfig.setType(5);
				//menuConfig.setUrl("/page/showWeb");
				//
				realyMenuConfig.setTitle("厂务公开");
				realyMenuConfig.setUrl("/page/showWeb");
				realyMenuConfig.setType(5);
			}else if(i==5){
				menuConfig.setTitle("电力知识库");
				menuConfig.setType(5);
				//menuConfig.setUrl("/page/showWeb");
				//
				realyMenuConfig.setTitle("电力知识库");
				realyMenuConfig.setUrl("/page/showWeb");
				realyMenuConfig.setType(5);
			}else if(i==6){
				menuConfig.setTitle("培训计划");
				menuConfig.setUrl("/page/showTrainList");
				menuConfig.setType(0);
				menuConfig.setSize(2);
				// 
				realyMenuConfig.setTitle("培训计划");
				realyMenuConfig.setUrl("/page/showTrainList");
				realyMenuConfig.setType(0);
				realyMenuConfig.setSize(2);
			}else if(i==7){
				menuConfig.setTitle("微创新");
				menuConfig.setUrl("/page/smallInnovate"); 
				menuConfig.setType(3);
				//
				realyMenuConfig.setTitle("微创新");
				realyMenuConfig.setUrl("/page/smallInnovate"); 
				realyMenuConfig.setType(3);
			}else if(i==8){
				menuConfig.setTitle("卓越管理");
				menuConfig.setUrl("/page/ruleManange");
				menuConfig.setType(1);
				//
				realyMenuConfig.setTitle("卓越管理");
				realyMenuConfig.setUrl("/page/ruleManange");
				realyMenuConfig.setType(1);
			}else if(i==9){
				menuConfig.setTitle("班组简介");
				menuConfig.setUrl("/page/showPPT");
				menuConfig.setType(4);
				//
				realyMenuConfig.setTitle("班组简介");
				realyMenuConfig.setUrl("/page/showPPT");
				realyMenuConfig.setType(4);
			} 
			int k=menuConfigMapper.insertSelective(menuConfig); 
			int l = 0;
			if(i == 1 || i== 3){
				System.out.println("i-------------:"+i);
			} else {
				l=menuConfigMapper.insertSelective(realyMenuConfig); 
			}
			// 插入
			if(k==1){
				j++;
				continue;
			} else throw new CallBackException("插入第"+l+"条菜单时失败");
		}
		if(j==10) return 1;
		else return 0;
		
	}
	
	// 民主管理菜单下面的菜单全部初始化完,目前共11个子菜单
	// pid为民主管理id
	public int initMinZhuMenu(String pid,String groupId){
		int j=1;
		MenuConfig menuConfig=new MenuConfig(); // 存储一级菜单
		MenuConfig realyMenuConfig=new MenuConfig(); // 存储类似于一级菜单的“二级菜单”
		
		for(int i=1;i<=11;i++){
			// 初始化二级菜单
			String idString = UUIDUtil.getUUID(); // 记录二级菜单的id,便于初始化三级菜单
			menuConfig.setGroupid(groupId);
			menuConfig.setPid(pid);
			menuConfig.setLevel(2);
			menuConfig.setId(idString); //该菜单的id
			menuConfig.setBackgroundid(i+"");
			menuConfig.setIconid(i+"");
			menuConfig.setOrderby(i);
			if (i == 1) {
				menuConfig.setTitle("规程制度");
				menuConfig.setUrl("/page/ruleManange");
				menuConfig.setType(1);
			} else if (i == 2) {
				menuConfig.setTitle("评议评先");
				menuConfig.setUrl("/page/getPageByMenuId");
				menuConfig.setType(1);
				//  初始化评议评先下面的三级菜单
				// 这里单独插入 首页配置，相册管理，模块管理
				MenuConfig home=new MenuConfig(); 
				MenuConfig photo=new MenuConfig(); 
				MenuConfig menu=new MenuConfig(); 
				home.setTitle("评议班组长");
				home.setGroupid(groupId);
				home.setPid(idString);
				home.setLevel(3);
				home.setId(UUIDUtil.getUUID()); 
				home.setBackgroundid(1+"");
				home.setIconid(1+"");
				home.setUrl("/page/ruleManange");
				
				photo.setTitle("先进公示");
				photo.setGroupid(groupId);
				photo.setPid(idString);
				photo.setLevel(3);
				photo.setId(UUIDUtil.getUUID()); 
				photo.setBackgroundid(2+"");
				photo.setIconid(2+"");
				photo.setUrl("/page/ruleManange");
				
				menu.setTitle("先进展示");
				menu.setGroupid(groupId);
				menu.setPid(idString);
				menu.setLevel(3);
				menu.setId(UUIDUtil.getUUID()); 
				menu.setBackgroundid(3+"");
				menu.setIconid(3+"");
				menu.setUrl("/moduleform/toAdvancedShow");
				int m = menuConfigMapper.insertSelective(home);
				m = menuConfigMapper.insertSelective(photo);
				m = menuConfigMapper.insertSelective(menu);
				if(m!=1){
					 throw new CallBackException("插入通用配置菜单时失败");
				}
				
				
			} else if (i == 3) {
				menuConfig.setTitle("违章通报");
				menuConfig.setUrl("/page/ruleManange");
				menuConfig.setType(1);
			} else if (i == 4) {
				menuConfig.setTitle("五险一金");
				menuConfig.setUrl("/page/ruleManange");
				menuConfig.setType(0);
			} else if (i == 5) {
				menuConfig.setTitle("费用开支");
				menuConfig.setUrl("/page/ruleManange");
				menuConfig.setType(2);
			} else if (i == 6) {
				menuConfig.setTitle("相册管理");
				menuConfig.setUrl("/page/showPhoto");
				menuConfig.setType(0);
			} else if (i == 7) {
				menuConfig.setTitle("员工动态");
				menuConfig.setUrl("/page/showDynamicList");
				menuConfig.setType(2);
			} else if (i == 8) {
				menuConfig.setTitle("工作总结");
				menuConfig.setUrl("/page/showSummaryList");
				menuConfig.setType(2);
			} else if (i == 9) {
				menuConfig.setTitle("工作计划");
				menuConfig.setUrl("/page/showPlanList");
				menuConfig.setType(2);
			} else if (i == 10) {
				menuConfig.setTitle("绩效考核");
				menuConfig.setUrl("/page/showCheckList");
				menuConfig.setType(2);
			} else if (i == 11) {
				menuConfig.setTitle("员工考勤");
				menuConfig.setUrl("/page/showAttendanceList");
				menuConfig.setType(2);
			}
			int k=menuConfigMapper.insertSelective(menuConfig); 
			// 插入
			if(k==1){
				j++;
				continue;
			} else throw new CallBackException("插入第"+i+"条菜单时失败");
			 
		}
		if(j==12) return 1; //成功
		else return 0;
	}
	
}
