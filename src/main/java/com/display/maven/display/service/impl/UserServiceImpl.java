package com.display.maven.display.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.display.maven.display.dao.IconMapper;
import com.display.maven.display.dao.UserMapper;
import com.display.maven.display.domain.Icon;
import com.display.maven.display.domain.User;
import com.display.maven.display.service.IconService;
import com.display.maven.display.service.UserService;
import com.display.maven.util.UUIDUtil;

@Service
public class UserServiceImpl implements UserService{
	@Resource
	private UserMapper userMapper;

	@Override
	public List<User> getAllUser() {
		return userMapper.getAllUser();
	}
	
	/**
	 * 根据用户名查询用户信息
	 */
	@Override
	public User getUserByUsername(String username) {
		return userMapper.getUserByUsername(username);
	}
	
	/**
	 * 根据用户id查询用户信息
	 */
	@Override
	public User getUserById(String id) {
		return userMapper.selectByPrimaryKey(id);
	}
	
	/**
	 * 分页、模糊查询用户信息
	 */
	@Override
	public List<User> queryUserByUserame(String username) {
		return userMapper.queryUserByUserame(username);
	}
	
	/**
	 * 删除用户
	 */
	@Override
	public boolean deleteUserById(String id) {
		return userMapper.deleteUserById(id)==1?true:false;
	}

	@Override
	public boolean addUser(User user) {
		// uuid 生成主键
		user.setId(UUIDUtil.getUUID());
		return userMapper.insertSelective(user)==1?true:false;
	}

	@Override
	public boolean updateUser(User user) {
		return userMapper.updateByPrimaryKeySelective(user)==1?true:false;
	}

}
