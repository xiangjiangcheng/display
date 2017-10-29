package com.display.maven.display.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.display.maven.display.domain.Background;

public interface BackgroundMapper {
    int deleteByPrimaryKey(String id);

    int insertSelective(Background record);

    Background selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Background record);

    @Select("select * from background where dlt=0 and type=1")
    List<Background> getAllMenuBackground();
    
    //获取所有大背景
    List<Background> getAllBigBg();
    
    @Select("select * from background where dlt=0")
    List<Background> getAllBackground();
    
    // 添加背景 并得到该条数据的id
	String addBackgroundGetId(Background background);
    //通过name找background
    List<Background> getBackgroundByName(String bgname);
}