package com.display.maven.display.domain;

import java.util.Date;

public class SmallInnovate {
    private String id;

    private String groupid;

    private String menuid;

    private String title;

    private String achievementname;

    private String mainpersons;

    private String achievementcost;

    private String pictureids;

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

    public String getGroupid() {
        return groupid;
    }

    public void setGroupid(String groupid) {
        this.groupid = groupid == null ? null : groupid.trim();
    }

    public String getMenuid() {
        return menuid;
    }

    public void setMenuid(String menuid) {
        this.menuid = menuid == null ? null : menuid.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getAchievementname() {
        return achievementname;
    }

    public void setAchievementname(String achievementname) {
        this.achievementname = achievementname == null ? null : achievementname.trim();
    }

    public String getMainpersons() {
        return mainpersons;
    }

    public void setMainpersons(String mainpersons) {
        this.mainpersons = mainpersons == null ? null : mainpersons.trim();
    }

    public String getAchievementcost() {
        return achievementcost;
    }

    public void setAchievementcost(String achievementcost) {
        this.achievementcost = achievementcost == null ? null : achievementcost.trim();
    }

    public String getPictureids() {
        return pictureids;
    }

    public void setPictureids(String pictureids) {
        this.pictureids = pictureids == null ? null : pictureids.trim();
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