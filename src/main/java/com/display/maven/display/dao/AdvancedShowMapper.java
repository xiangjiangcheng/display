package com.display.maven.display.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.display.maven.display.domain.AdvancedShow;

public interface AdvancedShowMapper {
    int deleteByPrimaryKey(String id);

    int insert(AdvancedShow record);

    int insertSelective(AdvancedShow record);

    AdvancedShow selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(AdvancedShow record);

    int updateByPrimaryKey(AdvancedShow record);
    
    // 查询分页    
    @Select("select * from advanced_show where groupid=#{groupid} and dlt=0 and name like concat('%',#{condition},'%')")
	List<AdvancedShow> QueryData(@Param("condition") String condition, @Param("groupid") String groupid);
    
    // 根据小组id得到对应的先进展示数据
    @Select("select * from advanced_show where groupid=#{groupid} and dlt=0")
    AdvancedShow getAdvancedShowByGid(@Param("groupid") String groupid);
}