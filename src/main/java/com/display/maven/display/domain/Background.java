package com.display.maven.display.domain;

import java.util.Date;

public class Background {
    private String id;

    private String bgname;

    private Integer type;

    private Integer dlt;

    private Date createtime;

    private Date updatetime;

    private String remark;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getBgname() {
        return bgname;
    }

    public void setBgname(String bgname) {
        this.bgname = bgname == null ? null : bgname.trim();
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

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}