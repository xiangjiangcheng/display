package com.display.maven.display.service;

import java.util.List;

import com.display.maven.display.domain.Excel;
import com.display.maven.display.domain.ModuleTable;

public interface ModuleTableService {
	
	int addTable(ModuleTable moduleTable);
	
	List<ModuleTable> getModuletable(String groupid,String menuid,String name);
	
	int dleTableById(String id);
	
	/**
	 * 获取所有的表格目录
	 */
	List<Excel> getAllExcelModel();
	
	ModuleTable getModuleTableById(String id);
	
	Excel getExcelByMenuId(String menuid);

	Excel getExcelModelByType(String type);
	
	Excel getExcelModelById(String id);
}
