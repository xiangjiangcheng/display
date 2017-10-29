package com.display.maven.display.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.display.maven.display.domain.ModuleTable;

public interface ModuleTableMapper {
    int deleteByPrimaryKey(String id);

    int insertSelective(ModuleTable record);

    ModuleTable selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ModuleTable record);

    /**
     * 根据menuid和groupuid，查询对应的数据
     * @param groupid
     * @param menuid
     * @return
     */
    List<ModuleTable> getModuleTableByMeneId(@Param("groupid") String groupid,@Param("menuid") String menuid,@Param("remark") String remark);
    
    ModuleTable getModuleByYearAndMonth(@Param("year")Integer year,@Param("month")Integer month,@Param("day")Integer day ,@Param("week")Integer week, @Param("menuid")String menuid);
}