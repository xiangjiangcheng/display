package com.display.maven.display.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("user")
public class UserController {
	@Resource
	private UserService userServiceImpl;
	@Resource
	private GroupService groupServiceImpl;

	/**
	 * 用户列表
	 * 
	 * @param Username
	 * @return
	 */
	@RequestMapping("QueryUser")
	@ResponseBody
	public PageInfo<User> QueryUser(@RequestParam(value = "username") String username,
			@RequestParam(value = "PageNum") int page) {
		PageHelper.startPage(page, 5);
		PageInfo<User> user = null;
		List<User> list = userServiceImpl.queryUserByUserame(username);
		user = new PageInfo<>(list);
		System.out.println("名字:" + username + "页数:" + page);
		return user;
	}

	/**
	 * 用户删除
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("deleteUser/{id}")
	@ResponseBody
	public Map<String, Object> deleteUser(@PathVariable(value = "id") String id) {
		String msg = ""; // 返回信息
		boolean status = false; // 状态
		Map<String, Object> result = new HashMap<String, Object>();

		boolean flag = userServiceImpl.deleteUserById(id);
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
	@RequestMapping("toUpdateUser/{id}")
	public String toUpdateUser(@PathVariable(value = "id") String id, Model model) {
		// 得到该用户的详细信息
		User user = new User();
		user = userServiceImpl.getUserById(id);
		
		// 得到所有的班组
		List<Group> groupList = new ArrayList<Group>();
		groupList = groupServiceImpl.getAllGroup();
		model.addAttribute("groupList", groupList);
		model.addAttribute("user", user);
		return "display/updateUser";
	}
	/**
	 * 用户修改
	 * 
	 * @param User
	 * @return
	 */
	@RequestMapping("updatePass")
	@ResponseBody
	public Map<String, Object> updatePass(@Valid User user, HttpServletRequest request) {
		String msg = ""; // 返回信息
		boolean status = false; // 状态
		Map<String, Object> result = new HashMap<String, Object>();
		
		// 从session中获取用户id
		HttpSession session = request.getSession();
		User user2 = (User) session.getAttribute("User");
		user.setId(user2.getId());
		boolean flag = userServiceImpl.updateUser(user);
		result.put("status", flag);
		return result;
	}
	
}
