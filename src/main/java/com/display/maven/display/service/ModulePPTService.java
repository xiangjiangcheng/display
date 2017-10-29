package com.display.maven.display.service;

import com.display.maven.display.domain.ModulePpt;

public interface ModulePPTService {

	int addModulePPT(ModulePpt modulePpt);
	
	ModulePpt getByGroupId(String groupid);

	boolean updateModulePpt(ModulePpt getmodulePpt);
}
