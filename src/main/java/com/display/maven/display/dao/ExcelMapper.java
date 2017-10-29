package com.display.maven.display.dao;

import java.util.List;

import com.display.maven.display.domain.Excel;


public interface ExcelMapper {
    int deleteByPrimaryKey(String id);

    int insertSelective(Excel record);

    Excel selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Excel record);

    List<Excel> getAllExcelModel();
    
    Excel getModuleByMenuId(String menuid);

	Excel getModuleBytype(String type);

}