package com.display.maven.display.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.display.maven.display.domain.User;

public interface UserMapper {
    int deleteByPrimaryKey(String id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    // 根据用户名查询用户信息
    @Select("select * from user where dlt=0 and username = #{username}")
	User getUserByUsername(@Param("username") String username);
    
    // 得到所有
    @Select("select * from user where dlt=0")
	List<User> getAllUser();
    
    // SQL CONCAT函数用于将两个字符串连接起来，形成一个单一的字符串。
    @Select("select * from user where dlt=0 and username like concat('%',#{username},'%') and type = 1")
	List<User> queryUserByUserame(@Param("username") String username);
    
    // 修改 dlt = 1
    @Update("update user u set u.dlt=1 where u.id=#{id}")
	int deleteUserById(@Param("id") String id);
}