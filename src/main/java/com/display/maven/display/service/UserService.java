package com.display.maven.display.service;

import java.util.List;

import com.display.maven.display.domain.Icon;
import com.display.maven.display.domain.User;

public interface UserService {
	public List<User> getAllUser();
	
	// 根据用户名查询用户信息
	public User getUserByUsername(String username);
	
	// 分页、模糊查询用户信息
	public List<User> queryUserByUserame(String username);
	
	// 删除用户
	public boolean deleteUserById(String id);
	
	// 添加用户
	public boolean addUser(User user);
	
	// 根据id查询用户信息
	User getUserById(String id);
	
	// 修改用户信息
	public boolean updateUser(User user);
	
}
