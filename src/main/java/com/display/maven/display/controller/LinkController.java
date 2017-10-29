package com.display.maven.display.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.ibatis.annotations.Param;
import org.apache.log4j.varia.StringMatchFilter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.display.maven.display.domain.AdvancedShow;
import com.display.maven.display.domain.Group;
import com.display.maven.display.domain.ModuleLink;
import com.display.maven.display.domain.ModulePpt;
import com.display.maven.display.domain.ModuleRich;
import com.display.maven.display.domain.SmallInnovateWithBLOBs;
import com.display.maven.display.domain.User;
import com.display.maven.display.domain.extend.MenuConfigExtend;
import com.display.maven.display.service.GroupService;
import com.display.maven.display.service.MenuConfigService;
import com.display.maven.display.service.ModuleLinkService;
import com.display.maven.display.service.ModuleRichService;
import com.display.maven.display.service.UserService;
import com.display.maven.display.service.impl.MenuConfigServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.JsonObject;
import com.sun.star.drawing.framework.ModuleController;

@Controller
@RequestMapping("link")
public class LinkController {
	
	@Resource
	private ModuleLinkService moduleLinkService;
	@Resource
	private MenuConfigService menuConfigServiceImpl;
	/**
	 * 根据微创新id查询对应的微创新页面数据
	 * 
	 * @return
	 */
	@RequestMapping("getWebByGid")
	@ResponseBody
	public Map<String, Object> getWebByGid(HttpServletRequest request) {
		boolean status = false; // 状态
		Map<String, Object> result;
		result = new HashMap<String, Object>(); // 实例化map
		// 得到网址id
		String menuid= request.getParameter("id");
		String id=request.getParameter("menuid");
		String groupid = (String) request.getSession().getAttribute("groupid");
		System.out.println("获取到当前id的pid"+menuid);
		//通过查询获取pid
		MenuConfigExtend menuConfigExtend= menuConfigServiceImpl.getMenuById(menuid);
		String pid=menuConfigExtend.getPid();
		System.out.println("获取到当前id的pid"+pid);
		List<ModuleLink> moduleLinks = new ArrayList<>();
		ModuleLink moduleLink = null;
		//得到数据
		try {
			moduleLinks = moduleLinkService.getByGroupidAndMenuid(groupid, pid);
			if (moduleLinks.size()!=0) {
				moduleLink=moduleLinks.get(0);
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 如果没有查到url
		if (moduleLink == null) {
			// 返回false
			status = false;
		} else {
			status = true;
		}
		result.put("status", status);
		result.put("moduleLink", moduleLink);
		return result;
	}
	/**
	 * 新增、修改先进展示
	 * 
	 * @return
	 */
	@RequestMapping("updateWeb")
	@ResponseBody
	public Map<String, Object> updateWeb(HttpServletRequest request,@Param("link")String link,@Param("menuid") String menuid) {
		Map<String, Object> map = new HashMap<>();
		String groupid = (String) request.getSession().getAttribute("groupid");
		
		ModuleLink moduleLink = new ModuleLink();
		//通过查询获取pid
		MenuConfigExtend menuConfigExtend= menuConfigServiceImpl.getMenuById(menuid);
		String pid=menuConfigExtend.getPid();
		List<ModuleLink> moduleLinks = moduleLinkService.getByGroupidAndMenuid(groupid, pid);
		if (moduleLinks.size()==0) {
			moduleLink.setGroupid(groupid);
			moduleLink.setMenuid(pid);
			moduleLink.setUrl(link);
			int i=moduleLinkService.addLink(moduleLink);
			if (i==1) {
				map.put("msg", "修改成功！");
			} else {
				map.put("msg", "修改失败！");
			}
		} else {
			moduleLink = moduleLinks.get(0);
			moduleLink.setUrl(link);
			int i=moduleLinkService.updateLink(moduleLink);
			if (i==1) {
				map.put("msg", "修改成功！");
			} else {
				map.put("msg", "修改失败！");
			}
		}
		
		return map;
	}
}
