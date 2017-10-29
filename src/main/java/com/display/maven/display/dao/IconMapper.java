package com.display.maven.display.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.display.maven.display.domain.Icon;

public interface IconMapper {
    int deleteByPrimaryKey(String id);

    int insert(Icon record);

    int insertSelective(Icon record);

    Icon selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Icon record);

    int updateByPrimaryKey(Icon record);
    
    @Select("select * from icon where dlt=0 and type=1")
    List<Icon> getAllMenuIcon();
    
    @Select("select * from icon where dlt=0")
    List<Icon> getAllIcon();
    
    // 添加图标并得到该条数据的id
	String addIconGetId(Icon icon);
}