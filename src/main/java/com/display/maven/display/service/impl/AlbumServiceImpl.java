package com.display.maven.display.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.display.maven.display.dao.AlbumMapper;
import com.display.maven.display.domain.Album;
import com.display.maven.display.service.AlbumService;
import com.display.maven.util.UUIDUtil;
@Service
public class AlbumServiceImpl implements AlbumService {

	@Resource
	private AlbumMapper albumMapper;
	
	@Override
	public List<Album> getByGroupid(String groupid) {
		List<Album> albums = albumMapper.selectByGroupid(groupid);
		return albums;
	}

	@Override
	public int addAlbum(Album album) {
		album.setId(UUIDUtil.getUUID());
		album.setDlt(0);
		int i = albumMapper.insertSelective(album);
		return i;
	}

	@Override
	public Album getById(String id) {
		Album album = albumMapper.selectByPrimaryKey(id);
		return album;
	}

	@Override
	public int updateAlbum(Album album) {
		int i = albumMapper.updateByPrimaryKeySelective(album);
		return i;
	}

}
