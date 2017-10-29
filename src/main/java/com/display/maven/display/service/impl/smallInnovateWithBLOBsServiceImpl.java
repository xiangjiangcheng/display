package com.display.maven.display.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.display.maven.display.dao.SmallInnovateMapper;
import com.display.maven.display.dao.SmallInnovateModuleMapper;
import com.display.maven.display.domain.SmallInnovateModule;
import com.display.maven.display.domain.SmallInnovateWithBLOBs;
import com.display.maven.display.service.smallInnovateWithBLOBsService;
import com.display.maven.util.UUIDUtil;

@Service
public class smallInnovateWithBLOBsServiceImpl implements smallInnovateWithBLOBsService {
	@Resource
	private SmallInnovateMapper smallInnovateMapper;
	@Resource
	private SmallInnovateModuleMapper smallInnovateModuleMapper;

	@Override
	public boolean addsmallInnovateWithBLOBs(SmallInnovateWithBLOBs smallInnovateWithBLOBs) {
		// uuid 生成主键
		smallInnovateWithBLOBs.setId(UUIDUtil.getUUID());
		return smallInnovateMapper.insertSelective(smallInnovateWithBLOBs) == 1 ? true : false;
	}

	@Override
	public SmallInnovateWithBLOBs getsmallInnovateWithBLOBsById(String id) {
		return smallInnovateMapper.selectByGroupid(id);
	}

	@Override
	public boolean updatesmallInnovateWithBLOBs(SmallInnovateWithBLOBs smallInnovateWithBLOBs) {
		return smallInnovateMapper.updateByPrimaryKeySelective(smallInnovateWithBLOBs) == 1 ? true : false;
	}

	@Override
	public List<SmallInnovateWithBLOBs> QueryData(String condition,String groupid) {
		
		return smallInnovateMapper.QueryData(condition, groupid);
	}

	@Override
	public SmallInnovateModule getSModuleByGid(String groupid) {
		return smallInnovateModuleMapper.getSModuleByGid(groupid);
	}

	@Override
	public boolean addSModule(SmallInnovateModule smallInnovateModule) {
		smallInnovateModule.setId(UUIDUtil.getUUID());
		return smallInnovateModuleMapper.insertSelective(smallInnovateModule) == 1 ? true : false;
	}

	@Override
	public boolean updateSModule(SmallInnovateModule smallInnovateModule) {
		return smallInnovateModuleMapper.updateByPrimaryKeySelective(smallInnovateModule) == 1 ? true : false;
	}

	@Override
	public boolean delete(String id) {
		SmallInnovateWithBLOBs smallInnovateWithBLOBs = new SmallInnovateWithBLOBs();
		smallInnovateWithBLOBs.setDlt(1);
		smallInnovateWithBLOBs.setId(id);;
		return smallInnovateMapper.updateByPrimaryKeySelective(smallInnovateWithBLOBs) == 1 ? true : false;
	}

}
