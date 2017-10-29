package com.display.maven.display.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.display.maven.display.domain.Group;
import com.display.maven.display.domain.ModuleRich;
import com.display.maven.display.domain.User;
import com.display.maven.display.domain.extend.MenuConfigExtend;
import com.display.maven.display.service.GroupService;
import com.display.maven.display.service.MenuConfigService;
import com.display.maven.display.service.ModuleRichService;
import com.display.maven.display.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("rich")
public class RichController {
	
	@Resource
	private ModuleRichService moduleRichServiceImpl;
	@Resource
	private MenuConfigService menuConfigServiceImpl;
	@Resource
	private GroupService  groupServiceImpl;
	@Resource
	private UserService  userServiceImpl;
	/**
	 * 规程制度列表
	 * 
	 * @param Username
	 * @return
	 */
	@RequestMapping("QueryRich")
	@ResponseBody
	public PageInfo<ModuleRich> QueryRich(@RequestParam(value = "title") String title,
			@RequestParam(value = "PageNum") int page,@RequestParam(value = "menuid") String menuid) {
		PageHelper.startPage(page, 5);
		PageInfo<ModuleRich> moduleRich = null;
		List<ModuleRich> list = moduleRichServiceImpl.queryRichByUserame(title,menuid);
		moduleRich = new PageInfo<>(list);
		System.out.println("模块名字:"+menuid+"名字:" + title + "页数:" + page);
		return moduleRich;
	}

	/**
	 * 富文本删除
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("deleteRich/{id}")
	@ResponseBody
	public Map<String, Object> deleteRich(@PathVariable(value = "id") String id) {
		String msg = ""; // 返回信息
		boolean status = false; // 状态
		Map<String, Object> result = new HashMap<String, Object>();
		boolean flag = moduleRichServiceImpl.deleteRich(id);
		result.put("status", flag);
		return result;
	}

	/**
	 * 富文本添加
	 * 
	 * @param User
	 * @return
	 */
	@RequestMapping("addRich/{menuid}")
	@ResponseBody
	public Map<String, Object> addUser(@Valid ModuleRich moduleRich,@PathVariable("menuid") String  menuid) {
		String msg = ""; // 返回信息
		boolean status = false; // 状态
		Map<String, Object> result = new HashMap<String, Object>();
		boolean flag = moduleRichServiceImpl.addRich(moduleRich);
		result.put("status", flag);
		return result;
	}

	/**
	 * 富文本修改
	 * 
	 * @param User
	 * @return
	 */
	@RequestMapping("updateRich")
	@ResponseBody
	public Map<String, Object> updateUser(@Valid ModuleRich moduleRich) {
		String msg = ""; // 返回信息
		boolean status = false; // 状态
		Map<String, Object> result = new HashMap<String, Object>();
		boolean flag = moduleRichServiceImpl.updateRich(moduleRich);
		result.put("status", flag);
		return result;
	}
	/**
	 * 查看详情界面
	 */
	@RequestMapping("showRichDetails/{id}")
	public String showRichDEtils(@PathVariable("id") String id, HttpServletRequest req) {
		System.out.println("详情界面的id"+id);
		ModuleRich moduleRich = moduleRichServiceImpl.getRichById(id);
		req.setAttribute("moduleRich", moduleRich);
		return "display/showRichDetails";
	}
	/**
	 * 跳转到添加用户界面
	 * 
	 * @return
	 */
	@RequestMapping("toaddRich/{menuid}")
	public String toaddUser(Model model,@PathVariable("menuid") String menuid,HttpServletRequest request) {
		System.out.println("菜單id"+menuid);
		MenuConfigExtend menuConfigExtend=menuConfigServiceImpl.getMenuById(menuid);
		String title=menuConfigExtend.getTitle();
		System.out.println(title);
		request.setAttribute("title", title);
		request.setAttribute("menuid", menuid);
		return "display/addRich";
	}

	/**
	 * 跳转到详情和修改富文本界面
	 * 
	 * @return
	 */
	@RequestMapping("toUpdateRich")
	public String toUpdateUser(String id,String menuid, Model model,HttpServletRequest request) {
		//获取富文本的详细信息
		ModuleRich modelRich= new ModuleRich();
		modelRich=moduleRichServiceImpl.getRichById(id);
		MenuConfigExtend menuConfigExtend=menuConfigServiceImpl.getMenuById(menuid);
		String title=menuConfigExtend.getTitle();
		System.out.println(title);
		request.setAttribute("title", title);
		request.setAttribute("menuid", menuid);
		model.addAttribute("modelRich",modelRich);
		return "display/updateRich";
	}
	
	
}
