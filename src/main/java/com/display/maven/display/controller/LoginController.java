package com.display.maven.display.controller;

import java.net.InetAddress;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.display.maven.display.domain.User;
import com.display.maven.display.service.UserService;

@Controller
@RequestMapping("login")
public class LoginController {

	@Resource
	private UserService userServiceImpl;
	
	/**
	 * 用户登录
	 * @param User
	 * @return
	 */
	@RequestMapping("tologin")
	@ResponseBody
	public Map<String, Object> tologin(@Valid User user,Model model, HttpServletRequest request){
		String msg = ""; // 返回信息
		boolean status = false; // 状态
		Map<String, Object> resMap;
		resMap = new HashMap<String, Object>(); // 实例化map
		HttpSession session = request.getSession();
		// 查询的用户
		User userFind = new User();
		try {
			//  根据用户名查询用户
			userFind = userServiceImpl.getUserByUsername(user.getUsername());
			if (userFind != null) {
				// 判断角色是否匹配
				if (userFind.getType() == user.getType()) {
					if (userFind.getPassword().equals(user.getPassword())) {
						msg = "登录成功！";
						status = true;
						if (userFind.getType() == 0) {
							// 管理员
							userFind.setGroupid("0");
						}
						// 用户信息存入session
						session.setAttribute("User", userFind);
						session.setAttribute("groupid", userFind.getGroupid());
						session.setAttribute("role", userFind.getType());
						session.setAttribute("ipAddress", InetAddress.getLocalHost().getHostAddress());
						
					} else {
						msg = "登录失败，密码错误！";
						status = true;
					}
				} else {
					msg = "登录失败，该用户没有该权限!";
					status = false;
				}
				 
			} else {
				msg = "不存在该用户!";
				status = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		resMap.put("msg", msg);
		resMap.put("status", status);
		return resMap;
	}
	
	/**
	 * 用户注销
	 * @return
	 */
	@RequestMapping("loginout")
	public String loginout(HttpServletRequest request){
		HttpSession session = request.getSession();
		// 移除session
		session.removeAttribute("User");
		session.removeAttribute("groupid");
		session.removeAttribute("role");
		return "redirect:/login.jsp";
	}
	
}
