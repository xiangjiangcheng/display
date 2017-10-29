package com.display.maven.display.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.display.maven.display.dao.AlbumImgMapper;
import com.display.maven.display.domain.AlbumImg;
import com.display.maven.display.service.AlbumImgService;
import com.display.maven.util.UUIDUtil;

@Service
public class AlbumImgServiceImpl implements AlbumImgService {

	@Resource
	private AlbumImgMapper albumImgMapper;

	@Override
	public List<AlbumImg> getByAlbumid(String albumid) {
		List<AlbumImg> albumImgs = albumImgMapper.selectByAlbumid(albumid);
		return albumImgs;
	}

	@Override
	public int updateAlbumImg(AlbumImg albumImg) {
		int i = albumImgMapper.updateByPrimaryKeySelective(albumImg);
		return i;
	}

	@Override
	public AlbumImg getById(String id) {
		AlbumImg albumImg = albumImgMapper.selectByPrimaryKey(id);
		return albumImg;
	}

	@Override
	public int addAlbumImg(AlbumImg albumImg) {
		albumImg.setId(UUIDUtil.getUUID());
		albumImg.setDlt(0);
		int i = albumImgMapper.insertSelective(albumImg);
		return i;
	}

	@Override
	public List<AlbumImg> getByName(String filename) {
		List<AlbumImg> albumImgs = albumImgMapper.selectByName(filename);
		return albumImgs;
	}
}
