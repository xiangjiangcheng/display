package com.display.maven.display.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.ls.LSInput;

import com.display.maven.display.domain.Background;
import com.display.maven.display.domain.Icon;
import com.display.maven.display.domain.MenuConfig;
import com.display.maven.display.domain.extend.MenuConfigExtend;
import com.display.maven.display.service.BackgroundService;
import com.display.maven.display.service.IconService;
import com.display.maven.display.service.MenuConfigService;
import com.display.maven.util.UUIDUtil;
import com.display.maven.util.UploadFilePathUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.JsonObject;

 

@Controller
@RequestMapping("menu")
public class MenuConfigController {
	
	@Resource
	private MenuConfigService menuConfigService;  
	
	@Resource
	private BackgroundService backgroundServiceImpl;
	
	@Resource
	private IconService iconServiceImpl;
	
	/**
	 * 跳转到添加主页菜单页面
	 * @return
	 */
	@RequestMapping("addModuleMenu")
	public String addModule(HttpServletRequest request, Model model){
		return "display/addModuleMenu";
	}
	
	/**
	 * 通过菜单级别去查询该菜单下面的子菜单  - 这里用的level字段查询的
	 * @return
	 */
	@RequestMapping("getMenuByLevel")
	@ResponseBody
	public Map<String, Object> getMenuByLevel(HttpServletRequest request, Model model, @RequestParam("level") String level){
		String msg = ""; // 返回信息
		boolean status = false; // 状态
		Map<String, Object> resMap;
		resMap = new HashMap<String, Object>(); // 实例化map
		HttpSession session = request.getSession();
		// 查询菜单
		List<MenuConfig> menuconfigList = new ArrayList<MenuConfig>();
		try {
			// 通过父id去查询该菜单下面的子菜单，如果pid=#;说明去查询所有的一级菜单
			menuconfigList = menuConfigService.getMenuByLevel(level, (String)session.getAttribute("groupid"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		resMap.put("menuconfigList", menuconfigList);
		return resMap;
	}
	
	/**
	 * 得到所有的菜单配置数据（菜单背景和菜单图标）
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "getAllModule")
	@ResponseBody
	public Map<String, Object> getAllModule(HttpServletRequest request,Model model) {
		String msg = ""; // 返回信息
		boolean status = false; // 状态
		Map<String, Object> resMap;
		List<Background> backgroundList = new ArrayList<Background>(); 
		List<Icon> iconList = new  ArrayList<Icon>();
		resMap = new HashMap<String, Object>(); // 实例化map
		
		try {
			// 查询背景图片
			backgroundList = menuConfigService.getAllBackground();
			// 查询图标
			iconList = menuConfigService.getAllIcon();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (backgroundList.size() > 0) {
			msg = "查询成功！";
			status = true;
		} else {
			msg = "查询失败";
			status = false;
		}
		resMap.put("msg", msg);
		resMap.put("status", status);
		resMap.put("iconList", iconList);
		resMap.put("backgroundList", backgroundList);

		return resMap;

	}
	
	/**
	 * 添加菜单
	 * @return
	 */
	@RequestMapping("addMenu")
	@ResponseBody
	public Map<String, Object> addMenu(HttpServletRequest request,@Valid MenuConfig menuConfig, @Valid Background background, @Valid Icon icon){
		String msg = ""; // 返回信息
		boolean status = false; // 状态
		Map<String, Object> resMap;
		resMap = new HashMap<String, Object>(); // 实例化map
		HttpSession session = request.getSession();
		
		// 得到图标和背景的上传类型（1：选择；2:自己上传）
		int icontype = 1; // 选择
		int bgtype = 1;
		try {
			icontype = Integer.parseInt(request.getParameter("icontype"));
			bgtype = Integer.parseInt(request.getParameter("bgtype"));
		} catch (Exception e) {
		}
		
		if (bgtype == 2) {
			// 先添加背景
			String backgroundid = UUIDUtil.getUUID();
			background.setId(backgroundid);
			menuConfig.setBackgroundid(backgroundid);
			backgroundServiceImpl.addBackgroundGetId(background);
		} 
		if (icontype == 2) {
			// 再添加图标
			String iconid = UUIDUtil.getUUID();
			icon.setId(iconid);
			menuConfig.setIconid(iconid);
			iconServiceImpl.addIconGetId(icon);
		}
		
		// 最后添加菜单
		menuConfig.setId(UUIDUtil.getUUID());
		menuConfig.setGroupid((String)session.getAttribute("groupid"));
		// 获取最大的排序最大的值
		String groupid = (String)session.getAttribute("groupid");
		int orderby = menuConfigService.getMaxOrderBy(menuConfig.getPid(), groupid);
		menuConfig.setOrderby((orderby+1));
		try {
			// 添加菜单
			if (menuConfig.getLevel()==1 && menuConfig.getPid().equals("#")) {
				//如果是一级菜单,再填加一条数据
				MenuConfig menuConfig2 = new MenuConfig();
				menuConfig2.setId(UUIDUtil.getUUID());
				menuConfig2.setGroupid((String)session.getAttribute("groupid"));
				menuConfig2.setPid(menuConfig.getId());
				menuConfig2.setTitle(menuConfig.getTitle());
				// 设置url
				switch (menuConfig.getType()) {
					case 1:{
						//富文本
						menuConfig2.setUrl("/page/ruleManange"); 
						break;
					}
					case 2:{
						//ppt
						menuConfig2.setUrl("/page/showPPT");
						break;
					}
					case 3:{
						//表格
						menuConfig2.setUrl("");
						break;
					}	
					case 4:{
						//表单
						menuConfig2.setUrl("");
						break;
					}
					case 5:{
						//链接
						menuConfig2.setUrl("/page/showWeb");
						break;
					}
				}
				menuConfig2.setTitle(menuConfig.getTitle());
				menuConfigService.addMenu(menuConfig2);
 			}  else if (menuConfig.getType() != 0) { // 如果是页面（选了模板），设置url
 				// 设置url
				switch (menuConfig.getType()) {
					case 1:{
						//富文本
						menuConfig.setUrl("/page/ruleManange"); 
						break;
					}
					case 2:{
						//ppt
						menuConfig.setUrl("/page/showPPT");
						break;
					}
					case 3:{
						//表格
						menuConfig.setUrl("");
						break;
					}	
					case 4:{
						//表单
						menuConfig.setUrl("");
						break;
					}
					case 5:{
						//链接
						menuConfig.setUrl("/page/showWeb");
						break;
					}
					case 6:{
						//相册
						menuConfig.setUrl("/page/showPhoto");
						break;
					}
				}
 			}
			
			status = menuConfigService.addMenu(menuConfig);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		resMap.put("msg", msg);
		resMap.put("status", status);
		return resMap;
	}
	
	/**
	 * 查询项目
	 * @return
	 */
	@RequestMapping("QueryModule")
	@ResponseBody
	public PageInfo<MenuConfigExtend> QueryModule(@RequestParam(value = "modulePageName") String name,
			@RequestParam(value = "modulePageNum") int page,@RequestParam("moduleLevel") String level,HttpServletRequest request){
		String groupid=(String) request.getSession().getAttribute("groupid");
		PageHelper.startPage(page, 5);
		PageInfo<MenuConfigExtend> menuConfig = null;
		List<MenuConfigExtend> list = menuConfigService.queryModuleByName(name,level,groupid);
		menuConfig = new PageInfo<>(list);
		System.out.println("名字:"+name+"页数:"+page);
		return menuConfig;
	}
	@ResponseBody
	@RequestMapping(value = "delete/{id}")
	public String deleteModuleById(@PathVariable(value = "id") String id) {
		JsonObject jsonObject = new JsonObject();
		try {
			if (menuConfigService.deleteModuleById(id)) {
				jsonObject.addProperty("message", "删除成功");
				jsonObject.addProperty("result", "true");
			} else {
				jsonObject.addProperty("message", "删除失败");
				jsonObject.addProperty("result", "false");
			}
		} catch (Exception e) {
			jsonObject.addProperty("message", e.getMessage());
			jsonObject.addProperty("result", "false");
		}
		return jsonObject.toString();
	}
	/**
	 * 显示菜单的详细信息
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("showMenuDetail/{id}")
	public String showModuleDetail(@PathVariable String id,Model model){

		//通过Id，得到menu的详细信息
		MenuConfigExtend menuConfig=menuConfigService.getModeuleDetailById(id);
		//得到所有的图标和背景
		model.addAttribute("menu", menuConfig);
		return "display/showMenuDetail";
	}
	
	@RequestMapping("addSmallBg")
	@ResponseBody
	public String addSmallbg(String base64,String Bgfile,HttpServletRequest request){
		JsonObject jsonObject=new JsonObject();
		//服务器地址
		// String imgPath=request.getServletContext().getRealPath("/")+"static/web/img/menubg/";
		// String imgPath = Config.bgPath;
		String imgPath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + "/file/icon/";
		String type=StringUtils.substringAfter(Bgfile, "."); // 后缀
        String fileNames = StringUtils.join(UUIDUtil.getUUID(),".",type);//文件名
        String uploadPathName = imgPath + fileNames;//获取到上传后的文件路径+文件名 
        int i=UploadFilePathUtil.saveBasePic(base64, uploadPathName);//保存图片
        if(i==1){
        	jsonObject.addProperty("msg", "success");
        	jsonObject.addProperty("imgName", fileNames);
        }else{
        	jsonObject.addProperty("msg", "error");
        }
        return jsonObject.toString();
	}
	
	/**
	 * 添加图标
	 * @param base64
	 * @param Bgfile
	 * @param request
	 * @return
	 */
	@RequestMapping("addIcon")
	@ResponseBody
	public String addIcon(String base64,String Iconfile,HttpServletRequest request){
		JsonObject jsonObject=new JsonObject();
		//服务器地址
		//String imgPath=request.getServletContext().getRealPath("/")+"static/web/img/menuicon/";
		//上传到本地磁盘 D:\fms
		String imgPath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + "/file/background/";
		// String imgPath = Config.iconPath;
		String type=StringUtils.substringAfter(Iconfile, "."); // 后缀
        String fileNames = StringUtils.join(UUIDUtil.getUUID(),".",type);//文件名
        String uploadPathName = imgPath + fileNames;//获取到上传后的文件路径+文件名 
        int i=UploadFilePathUtil.saveBasePic(base64, uploadPathName);//保存图片
        if(i==1){
        	jsonObject.addProperty("msg", "success");
        	jsonObject.addProperty("imgName", fileNames);
        }else{
        	jsonObject.addProperty("msg", "error");
        }
        return jsonObject.toString();
	}
	
	@RequestMapping("updateMenu")
	@ResponseBody
	public String updateMenuDetail(MenuConfig menuConfig,int size,HttpServletRequest request){ 
		HttpSession session = request.getSession();
		Map<String, Object> result = new HashMap<String, Object>(); // 实例化map
		String groupid = (String) session.getAttribute("groupid");
		JsonObject jsonObject =new JsonObject();

		int i=menuConfigService.updateMenuConfig(menuConfig,groupid);
		if(i==1){
			jsonObject.addProperty("msg", "success");
		}else{
			jsonObject.addProperty("msg", "error");
		}
		return jsonObject.toString();
	}
	
	
	/**
	 * 根据父id查询菜单 xjc
	 * @param pid
	 * @param request
	 * @return
	 */
	@RequestMapping("getMenuByPid")
	@ResponseBody
	public Map<String, Object> getMenuByPid(HttpServletRequest request){
		HttpSession session = request.getSession();
		Map<String, Object> result = new HashMap<String, Object>(); // 实例化map
		String pid = "#";
		String groupid = (String) session.getAttribute("groupid");
		try {
			pid = request.getParameter("pid");
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (pid == null) {
			pid = "#";
		}
		List<MenuConfig> menuConfigList = new ArrayList<MenuConfig>();
		if (groupid == "0") {
			// 查询
			menuConfigList = menuConfigService.getMenuByPid(pid);
		} else {
			// 查询
			menuConfigList = menuConfigService.getMenuByPidAndGroupId(pid, groupid);
		}
		
		result.put("menuConfigList", menuConfigList);
		return result;
	}
	
	/**
	 * 根据班组id和pid="#"两个条件去查询一级菜单的个数，判断新增的菜单是否可以显示
	 * @param pid
	 * @param request
	 * @return
	 */
	@RequestMapping("menuCanShow")
	@ResponseBody
	public Map<String, Object> menuCanShow(HttpServletRequest request){
		HttpSession session = request.getSession();
		Map<String, Object> result = new HashMap<String, Object>(); // 实例化map
		String pid = "#";
		String groupid = (String) session.getAttribute("groupid");
		List<MenuConfig> menuConfigList = new ArrayList<MenuConfig>();
		boolean status = true; // 标识新增的菜单是否可以显示
		try {
			menuConfigList = menuConfigService.getMenuByPidAndGroupIdIsHide(pid, groupid);
			if (menuConfigList.size() >= 9) { // 这里算上了通用配置这个菜单
				// 新增的菜单不可显示
				status = false;
			} else {
				// 新增的菜单可显示
				status = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		result.put("status", status);
		return result;
	}
	
	/**
	 * 修改菜单状态
	 * @param pid
	 * @param request
	 * @return
	 */
	@RequestMapping("updateIsHide")
	@ResponseBody
	public Map<String, Object> updateIsHide(HttpServletRequest request,@RequestParam("ishide") int ishide,@RequestParam("menuid") String menuid){
		HttpSession session = request.getSession();
		Map<String, Object> result = new HashMap<String, Object>(); // 实例化map
		boolean status = true; // 标识新增的菜单是否可以显示
		try {
			status = menuConfigService.updateIsHide(menuid, ishide);
		} catch (Exception e) {
			e.printStackTrace();
		}
		result.put("status", status);
		return result;
	}
	
}
