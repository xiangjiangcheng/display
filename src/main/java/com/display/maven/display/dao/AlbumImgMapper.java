package com.display.maven.display.dao;

import java.util.List;

import com.display.maven.display.domain.AlbumImg;

public interface AlbumImgMapper {
    int deleteByPrimaryKey(String id);

    int insert(AlbumImg record);

    int insertSelective(AlbumImg record);

    AlbumImg selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(AlbumImg record);

    int updateByPrimaryKey(AlbumImg record);
    
    List<AlbumImg> selectByAlbumid(String albumid);
    
    List<AlbumImg> selectByName(String filename);
}