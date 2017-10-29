package com.display.maven.display.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.display.maven.display.domain.Group;

public interface GroupMapper {
    int deleteByPrimaryKey(String id);
    int insert(Group record);

    int insertSelective(Group record);

    Group selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Group record);

    int updateByPrimaryKey(Group record);
    
    @Select("select * from `group` where dlt=0")
	List<Group> getAllGroup();
    @Select("select * from `group` where groupname like concat('%',#{groupname},'%') and dlt=0")
	List<Group> queryGroupByGroupName(String groupname);
 // 修改 dlt = 1
    @Update("update `group` set dlt=1 where id=#{id}")
	int deleteGroupById(String id);
   
}