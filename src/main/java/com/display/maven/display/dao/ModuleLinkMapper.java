package com.display.maven.display.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.display.maven.display.domain.ModuleLink;


public interface ModuleLinkMapper {
    int deleteByPrimaryKey(String id);

    int insert(ModuleLink record);

    int insertSelective(ModuleLink record);

    ModuleLink selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ModuleLink record);

    int updateByPrimaryKey(ModuleLink record);
    
    List<ModuleLink> selectByGroupidAndMenuid(@Param("groupid") String groupid,@Param("menuid") String menuid);

	ModuleLink getModuleLinkByMenuid(String menuid);
	
	List<ModuleLink> selectByUrl(String url);
}