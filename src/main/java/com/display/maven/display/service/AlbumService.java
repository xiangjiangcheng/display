package com.display.maven.display.service;

import java.util.List;

import com.display.maven.display.domain.Album;

public interface AlbumService {

	List<Album> getByGroupid(String groupid);
	
	int addAlbum(Album album);
	
	Album getById(String id);
	
	int updateAlbum(Album album);
}
