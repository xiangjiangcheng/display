package com.display.maven.display.service;

import java.util.List;

import com.display.maven.display.domain.SmallInnovateModule;
import com.display.maven.display.domain.SmallInnovateWithBLOBs;

public interface smallInnovateWithBLOBsService {
 
	// 添加微创新
	public boolean addsmallInnovateWithBLOBs(SmallInnovateWithBLOBs smallInnovateWithBLOBs);
	
	// 根据id查询微创新
	SmallInnovateWithBLOBs getsmallInnovateWithBLOBsById(String id);
	
	// 修改微创新
	public boolean updatesmallInnovateWithBLOBs(SmallInnovateWithBLOBs smallInnovateWithBLOBs);
	
	// 分页查询微创新信息，condition是成果名称
	public List<SmallInnovateWithBLOBs> QueryData(String condition, String groupid);
	
	// 根据班组id获取该班组微创新已选择的模
	public SmallInnovateModule getSModuleByGid(String groupid);

	public boolean addSModule(SmallInnovateModule smallInnovateModule);

	public boolean updateSModule(SmallInnovateModule smallInnovateModule);

	public boolean delete(String id); //删除微创新
	
}
