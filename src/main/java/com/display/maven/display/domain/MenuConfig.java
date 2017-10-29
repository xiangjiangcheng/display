package com.display.maven.display.domain;

import java.util.Date;

public class MenuConfig {
    private String id;

    private String pid;

    private String title;

    private Integer ishide;

    private String url;

    private String backgroundid;

    private String iconid;

    private String groupid;

    private Integer level;

    private Integer orderby;

    private Integer size;

    private Integer type;

    private Integer dlt;

    private String remark;

    private Date createtime;

    private Date updatetime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid == null ? null : pid.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public Integer getIshide() {
        return ishide;
    }

    public void setIshide(Integer ishide) {
        this.ishide = ishide;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public String getBackgroundid() {
        return backgroundid;
    }

    public void setBackgroundid(String backgroundid) {
        this.backgroundid = backgroundid == null ? null : backgroundid.trim();
    }

    public String getIconid() {
        return iconid;
    }

    public void setIconid(String iconid) {
        this.iconid = iconid == null ? null : iconid.trim();
    }

    public String getGroupid() {
        return groupid;
    }

    public void setGroupid(String groupid) {
        this.groupid = groupid == null ? null : groupid.trim();
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Integer getOrderby() {
        return orderby;
    }

    public void setOrderby(Integer orderby) {
        this.orderby = orderby;
    }

    public Integer getSize() {
        return size;
    }

    public void setSize(Integer size) {
        this.size = size;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getDlt() {
        return dlt;
    }

    public void setDlt(Integer dlt) {
        this.dlt = dlt;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }
}