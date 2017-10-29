package com.display.maven.display.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.display.maven.display.domain.Group;
import com.display.maven.display.domain.User;
import com.display.maven.display.service.GroupService;
import com.display.maven.display.service.UserService;
import com.display.maven.display.service.impl.UserServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.JsonObject;

@Controller
@RequestMapping("group")
public class GroupController {
	@Resource
	private UserService userServiceImpl;
	@Resource
	private GroupService groupServiceImpl;

	/**
	 * 班组列表
	 * 
	 * @param QueryGroup
	 * @return
	 */
	@RequestMapping("QueryGroup")
	@ResponseBody
	public PageInfo<Group> QueryGroup(@RequestParam(value = "groupname") String groupname,
			@RequestParam(value = "PageNum") int page) {
		PageHelper.startPage(page, 5);
		PageInfo<Group> group = null;
		List<Group> list = groupServiceImpl.queryGroupByGroupName(groupname);
		group = new PageInfo<>(list);
		System.out.println("名字:" + groupname + "页数:" + page);
		return group;
	}

	/**
	 * 用户删除
	 * @param id
	 * @return
	 */
	@RequestMapping("deleteGroup/{id}")
	@ResponseBody
	public Map<String, Object> deleteUser(@PathVariable(value = "id") String id) {
		String msg = ""; // 返回信息
		boolean status = false; // 状态
		Map<String, Object> result = new HashMap<String, Object>();

		boolean flag = groupServiceImpl.deleteGroupById(id);
		result.put("status", flag);
		return result;
	}

	/**
	 * 用户添加
	 * 
	 * @param User
	 * @return
	 */
	@RequestMapping("addUser")
	@ResponseBody
	public Map<String, Object> addUser(@Valid User user) {
		String msg = ""; // 返回信息
		boolean status = false; // 状态
		Map<String, Object> result = new HashMap<String, Object>();

		boolean flag = userServiceImpl.addUser(user);
		result.put("status", flag);
		return result;
	}

	/**
	 * 用户修改
	 * 
	 * @param User
	 * @return
	 */
	@RequestMapping("updateUser")
	@ResponseBody
	public Map<String, Object> updateUser(@Valid User user) {
		String msg = ""; // 返回信息
		boolean status = false; // 状态
		Map<String, Object> result = new HashMap<String, Object>();

		boolean flag = userServiceImpl.updateUser(user);
		result.put("status", flag);
		return result;
	}
	
	/**
	 * 班组修改
	 * 
	 * @param User
	 * @return
	 */
	@RequestMapping("updateGroup")
	@ResponseBody
	public Map<String, Object> updateGroup(@Valid Group group) {
		String msg = ""; // 返回信息
		boolean status = false; // 状态
		Map<String, Object> result = new HashMap<String, Object>();

		boolean flag = groupServiceImpl.updateGroup(group);
		result.put("status", flag);
		return result;
	}
	
	/**
	 * 得到用户所在班组
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("getUserInGroup/{id}")
	@ResponseBody
	public Map<String, Object> getUserInGroup(@PathVariable(value = "id") String id) {
		String msg = ""; // 返回信息
		boolean status = false; // 状态
		Map<String, Object> result = new HashMap<String, Object>();

		// 得到该用户所在的组
		Group group = new Group();
		group = groupServiceImpl.getGroupById(id);
		// 得到所有的班组
		List<Group> groupList = new ArrayList<Group>();
		groupList = groupServiceImpl.getAllGroup();
		result.put("group", group);
		result.put("groupList", groupList);
		result.put("status", true);
		return result;
	}

	/**
	 * 跳转到添加用户界面
	 * 
	 * @return
	 */
	@RequestMapping("toaddUser")
	public String toaddUser(Model model) {
		// 得到所有的班组
		List<Group> groupList = new ArrayList<Group>();
		groupList = groupServiceImpl.getAllGroup();
		model.addAttribute("groupList", groupList);
		return "display/addUser";
	}

	/**
	 * 跳转到详情和修改用户界面
	 * 
	 * @return
	 */
	@RequestMapping("toUpdateGroup/{id}")
	public String toUpdateUser(@PathVariable(value = "id") String id, Model model) {
		// 得到该班组的详细信息
		Group group = new Group();
		group = groupServiceImpl.getGroupById(id);
		/*
		// 得到所有的班组
		List<Group> groupList = new ArrayList<Group>();
		groupList = groupServiceImpl.getAllGroup();
		model.addAttribute("groupList", groupList);*/
		model.addAttribute("group", group);
		return "display/updateGroup";
	}
	
	/**
	 * 新建班组
	 */
	@RequestMapping("toAddGroup")
	public String toAddGroup(){
		return "display/addGroup";
	}
	
	@RequestMapping("addGroup")
	@ResponseBody
	public String addGroup(String groupname){
		JsonObject jsonObject=new JsonObject();
		int i =groupServiceImpl.addGroup(groupname);
		if(i==1){
			jsonObject.addProperty("status", true);
		}else{
			jsonObject.addProperty("status", false);
		}
		return jsonObject.toString();
	}
	
	
}
