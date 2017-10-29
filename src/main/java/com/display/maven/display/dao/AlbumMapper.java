package com.display.maven.display.dao;

import java.util.List;

import com.display.maven.display.domain.Album;

public interface AlbumMapper {
    int deleteByPrimaryKey(String id);

    int insert(Album record);

    int insertSelective(Album record);

    Album selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Album record);

    int updateByPrimaryKey(Album record);
    
    List<Album> selectByGroupid(String groupid);
}