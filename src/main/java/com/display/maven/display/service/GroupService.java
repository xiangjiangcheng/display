package com.display.maven.display.service;

import java.util.List;

import com.display.maven.display.domain.Group;

public interface GroupService {
	
	public Group getGroupById(String id);
	
	public List<Group> getAllGroup();
	/**
	 * 查询班组信息
	 * @param groupname
	 * @return
	 */
	public List<Group> queryGroupByGroupName(String groupname);
	/**
	 * 删除班组
	 * @param id
	 * @return
	 */
	public boolean deleteGroupById(String id);
	int addGroup(String groupname);
	
	public boolean updateGroup(Group group);
}
