package com.display.maven.display.dao;

import java.util.List;

import com.display.maven.display.domain.Title;

public interface TitleMapper {
    int deleteByPrimaryKey(String id);

    int insert(Title record);

    int insertSelective(Title record);

    Title selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Title record);

    int updateByPrimaryKey(Title record);
    
    //查询各班组所有的title
    List<Title> getAllTitle(String groupid);
}