package com.display.maven.display.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.display.maven.display.dao.AdvancedShowMapper;
import com.display.maven.display.domain.AdvancedShow;
import com.display.maven.display.service.AdvancedShowService;
import com.display.maven.util.UUIDUtil;

@Service
public class AdvancedShowServiceImpl implements AdvancedShowService {
	@Resource
	private AdvancedShowMapper advancedShowMapper;


	@Override
	public List<AdvancedShow> QueryData(String condition,String groupid) {
		
		return advancedShowMapper.QueryData(condition, groupid);
	}

	@Override
	public AdvancedShow getAdvancedShowByGid(String groupid) {
		return advancedShowMapper.getAdvancedShowByGid(groupid);
	}

	@Override
	public boolean addAdvancedShow(AdvancedShow advancedShow) {
		advancedShow.setId(UUIDUtil.getUUID());
		return advancedShowMapper.insertSelective(advancedShow) == 1 ? true : false;
	}

	@Override
	public boolean updateAdvancedShow(AdvancedShow advancedShow) {
		return advancedShowMapper.updateByPrimaryKeySelective(advancedShow) == 1 ? true : false;
	}

	@Override
	public boolean delete(String id) {
		AdvancedShow AdvancedShow = new AdvancedShow();
		AdvancedShow.setDlt(1);
		AdvancedShow.setId(id);;
		return advancedShowMapper.updateByPrimaryKeySelective(AdvancedShow) == 1 ? true : false;
	}

	@Override
	public AdvancedShow getAdvancedShowByid(String id) {
		return advancedShowMapper.selectByPrimaryKey(id);
	}

}
