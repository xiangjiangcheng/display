package com.display.maven.display.service.impl;

import java.util.Date;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.display.maven.display.dao.ModulePptMapper;
import com.display.maven.display.domain.ModulePpt;
import com.display.maven.display.service.ModulePPTService;
import com.display.maven.util.UUIDUtil;
@Service
public class ModulePPTServiceImpl implements ModulePPTService {

	@Resource
	private ModulePptMapper modulePptMapper;

	@Override
	public int addModulePPT(ModulePpt modulePpt) {
		Date time = new Date();
		modulePpt.setId(UUIDUtil.getUUID());
		modulePpt.setCreatetime(time);
		int i = modulePptMapper.insertSelective(modulePpt);
		return i;
	}

	@Override
	public ModulePpt getByGroupId(String groupid) {
		ModulePpt modulePpt = modulePptMapper.selectByGroupId(groupid);
		return modulePpt;
	}

	@Override
	public boolean updateModulePpt(ModulePpt getmodulePpt) {
		Date time = new Date();
		getmodulePpt.setUpdatetime(time);
		return modulePptMapper.updateByPrimaryKeySelective(getmodulePpt) == 1 ? true : false;
	}
	
}
