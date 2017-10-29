package com.display.maven.display.service;

import java.util.List;

import com.display.maven.display.domain.AlbumImg;

public interface AlbumImgService {

	List<AlbumImg> getByAlbumid(String albumid);
	
	int updateAlbumImg(AlbumImg albumImg);
	
	AlbumImg getById(String id);
	
	int addAlbumImg(AlbumImg albumImg);
	
	List<AlbumImg> getByName(String filename);
}
