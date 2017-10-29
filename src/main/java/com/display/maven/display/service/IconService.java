package com.display.maven.display.service;

import java.util.List;

import com.display.maven.display.domain.Icon;

public interface IconService {
	
	List<Icon> getAllIcon();

	int addIconGetId(Icon icon);
	

}
