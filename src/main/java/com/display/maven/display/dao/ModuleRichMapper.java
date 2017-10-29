package com.display.maven.display.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.display.maven.display.domain.ModuleRich;

public interface ModuleRichMapper {
    int deleteByPrimaryKey(String id);


    int insertSelective(ModuleRich record);

    ModuleRich selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ModuleRich record);

    /**
     * 通过title查询富文本
     * @param richtitle
     * @return
     */
    @Select("select * from module_rich where title  like concat('%',#{richtitle},'%') and menuid=#{moduleId} and dlt=0")
	List<ModuleRich> queryRichByUserame(@Param("richtitle")String richtitle, @Param("moduleId") String moduleId);
    /**
     * 通过id查询富文本详情
     * @param id
     * @return
     */
    @Select("select * from module_rich where id=#{id} and dlt=0")
	ModuleRich getRichById(String id);

    /**
     * 通过id删除富文本
     * @param id
     * @return
     */
    // 修改 dlt = 1
    @Update("update module_rich set dlt=1 where id=#{id}")
	int deleteRich(String id);
}