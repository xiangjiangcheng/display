package com.display.maven.display.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.display.maven.display.domain.Background;
import com.display.maven.display.domain.Icon;
import com.display.maven.display.domain.MenuConfig;
import com.display.maven.display.domain.extend.MenuConfigExtend;

public interface MenuConfigMapper {
	int deleteByPrimaryKey(String id);

	int insertSelective(MenuConfig record);

	MenuConfig selectByPrimaryKey(String id);

	int updateByPrimaryKeySelective(MenuConfig record);

	/**
	 * 通过标题查询
	 * 
	 * @param name
	 * @return @Select(
	 *         "select * from menuconfig as a, background as b,title as c, icon as d where a.backgroundid=b.id and a.iconid=d.id and a.title=c.id and a.id like concat('%',#{id},'%') and a.dlt = 0"
	 *         )
	 */
	/*
	 * @Select(
	 * "select * from menuconfig as a, background as b,title as c, icon as d where a.backgroundid=b.id and a.iconid=d.id and a.title like concat('%',#{title},'%') and a.level like concat('%',#{levle},'%')  and a.dlt = 0"
	 * )
	 */
	@Select("select *,b.bgname as backgroundname from menuconfig as a, background as b,icon as d where a.backgroundid=b.id and a.iconid=d.id and a.title like concat('%',#{title},'%') and a.level=#{level} and a.dlt = 0 and a.groupid=#{groupid}")
	List<MenuConfigExtend> queryModuleByName(@Param("title") String title, @Param("level") String level,@Param("groupid")String groupid);

	List<MenuConfig> getAllMenuConfig();

	List<Background> getAllBackground();

	List<Icon> getAllIcon();

	// 通过level获取该级的子菜单
	List<MenuConfig> getMenuByLevel(@Param("level") String level, @Param("groupid") String groupid);

	@Select("select * from menuconfig where id=#{id} and dlt=0")
	MenuConfigExtend getMenuById(String id);

	@Update("update menuconfig t set t.dlt=1 where t.id=#{id}")
	int deleteModuleById(String id);

	@Update("update menuconfig set orderby=#{originOrder} where orderby =#{newOrder} and pid=#{pid} and level=#{level}  and dlt=0")
	int updateMenuConfigByOrderby(@Param("originOrder") int originOrder, @Param("newOrder") int newOrder,
			@Param("level") int level, @Param("pid") String pid);
	// id升序查询
	@Select("select * from menuconfig where pid=#{pid} and dlt=0 and groupid=0 order by id ASC")
	List<MenuConfig> getMenuByPid(@Param("pid") String pid);
	
	@Select("select * from menuconfig where pid=#{pid} and dlt=0 and groupid=#{groupid} order by id ASC")
	List<MenuConfig> getMenuByPidAndGroupId(@Param("pid") String pid, @Param("groupid") String groupid);
	
	@Update("update menuconfig t set t.ishide=#{ishide} where t.id=#{menuid}")
	int updateIsHide(@Param("menuid")String menuid, @Param("ishide") int ishide);
	
	@Select("select * from menuconfig where pid=#{pid} and dlt=0 and groupid=#{groupid} and ishide=0 order by id ASC")
	List<MenuConfig> getMenuByPidAndGroupIdIsHide(@Param("pid") String pid, @Param("groupid") String groupid);
	
	@Select("select MAX(orderby) as max from menuconfig where pid=#{pid} and dlt=0 and groupid=#{groupid} and ishide=0 order by orderby")
	int getMaxOrderBy(@Param("pid") String pid, @Param("groupid") String groupid);
	
	@Select("select * from menuconfig where dlt=0 and groupid=#{pid} and pid = '#' and orderby != '' order by id ASC")
	List<MenuConfig> getMenuCount(@Param("pid") String pid);
	
	// 查出该排size为2的菜单
	@Select("select * from menuconfig where dlt=0 and groupid=#{groupid} and pid = '#' and orderby != '' and orderby >= #{min} and orderby <= #{max} and size = '2' order by id ASC")
	MenuConfig getMenuByMinAndMax(@Param("groupid") String groupid, @Param("min") int min, @Param("max") int max);
	
	// 查出该排size为1,orderby最小的数据
	@Select("select * from menuconfig where dlt=0 and groupid=#{groupid} and pid = '#' and orderby != '' and orderby >= #{min} and orderby <= #{max} and size = '1' order by id ASC")
	List<MenuConfig> getMenuByMinOrderBy(@Param("groupid") String groupid, @Param("min") int min, @Param("max") int max);

}