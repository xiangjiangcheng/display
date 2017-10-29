package com.display.maven.display.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.display.maven.display.dao.ExcelMapper;
import com.display.maven.display.dao.ModuleTableMapper;
import com.display.maven.display.domain.Excel;
import com.display.maven.display.domain.ModuleTable;
import com.display.maven.display.service.ModuleTableService;
import com.display.maven.util.UUIDUtil;

@Service
public class ModuleTableServiceImpl implements ModuleTableService{
	
	@Resource
	private ModuleTableMapper moduleTableMapper;
	
	@Resource
	private ExcelMapper excelMapper;
	

	@Override
	public int addTable(ModuleTable moduleTable) {
		int i=0;
		ModuleTable count=moduleTableMapper.getModuleByYearAndMonth(moduleTable.getYear(), moduleTable.getMonth(),moduleTable.getDay(), moduleTable.getWeek(), moduleTable.getMenuid());
 
		if(count!=null){
			count.setRemark(moduleTable.getRemark());
			count.setFileName(moduleTable.getFileName());
			i=moduleTableMapper.updateByPrimaryKeySelective(count);
		}else{
			String idString=UUIDUtil.getUUID();
			moduleTable.setId(idString);
			i=moduleTableMapper.insertSelective(moduleTable);
		}
		return i;
	}

	@Override
	public List<ModuleTable> getModuletable(String groupid, String menuid,String name) {
		List<ModuleTable> moduleTables= moduleTableMapper.getModuleTableByMeneId(groupid,menuid,name);
		return moduleTables;
	}

	@Override
	public int dleTableById(String id) {
		ModuleTable moduleTable=new ModuleTable();
		moduleTable.setId(id);
		moduleTable.setDlt(1);
		int i=moduleTableMapper.updateByPrimaryKeySelective(moduleTable);
		return i;
	}

	@Override
	public List<Excel> getAllExcelModel() {
		List<Excel> excels=excelMapper.getAllExcelModel();
		return excels;
	}

	@Override
	public ModuleTable getModuleTableById(String id) {
		ModuleTable moduleTable=moduleTableMapper.selectByPrimaryKey(id);
		return moduleTable;
	}

	@Override
	public Excel getExcelByMenuId(String menuid) {
		Excel excel=excelMapper.getModuleByMenuId(menuid);
		return excel;
	}

	@Override
	public Excel getExcelModelByType(String type) {
		Excel excel=excelMapper.getModuleBytype(type);
		return excel;
	}

	@Override
	public Excel getExcelModelById(String id) {
		Excel excel=excelMapper.selectByPrimaryKey(id);
		return excel;
	}

	
	
}
