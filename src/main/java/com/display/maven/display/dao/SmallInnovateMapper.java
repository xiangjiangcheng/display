package com.display.maven.display.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.display.maven.display.domain.SmallInnovate;
import com.display.maven.display.domain.SmallInnovateWithBLOBs;

public interface SmallInnovateMapper {
    int deleteByPrimaryKey(String id);

    int insert(SmallInnovateWithBLOBs record);

    int insertSelective(SmallInnovateWithBLOBs record);

    SmallInnovateWithBLOBs selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(SmallInnovateWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(SmallInnovateWithBLOBs record);

    int updateByPrimaryKey(SmallInnovate record);
    
    @Select("select * from small_innovate where id=#{id} and dlt=0")
	SmallInnovateWithBLOBs selectByGroupid(String id);
    
    @Select("select * from small_innovate where groupid=#{id} and dlt=0 and achievementname like concat('%',#{achievementname},'%')")
	List<SmallInnovateWithBLOBs> QueryData(@Param("achievementname") String condition,@Param("id") String id);
}