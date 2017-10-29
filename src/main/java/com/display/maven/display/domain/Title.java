package com.display.maven.display.domain;

import java.util.Date;

public class Title {
    private String id;

    private String groupid;

    private String title1;

    private String title2;

    private String groupStBgcolor;

    private Integer dlt;

    private String remark;

    private Date createtime;

    private Date updatetime;

    private String backgroundid;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getGroupid() {
        return groupid;
    }

    public void setGroupid(String groupid) {
        this.groupid = groupid == null ? null : groupid.trim();
    }

    public String getTitle1() {
        return title1;
    }

    public void setTitle1(String title1) {
        this.title1 = title1 == null ? null : title1.trim();
    }

    public String getTitle2() {
        return title2;
    }

    public void setTitle2(String title2) {
        this.title2 = title2 == null ? null : title2.trim();
    }

    public String getGroupStBgcolor() {
        return groupStBgcolor;
    }

    public void setGroupStBgcolor(String groupStBgcolor) {
        this.groupStBgcolor = groupStBgcolor == null ? null : groupStBgcolor.trim();
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

    public String getBackgroundid() {
        return backgroundid;
    }

    public void setBackgroundid(String backgroundid) {
        this.backgroundid = backgroundid == null ? null : backgroundid.trim();
    }
}