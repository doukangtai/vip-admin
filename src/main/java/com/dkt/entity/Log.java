package com.dkt.entity;

import java.util.Date;

/**
*@author 窦康泰
*@date 2020/11/21
*/
public class Log {
    private Integer lid;

    private Integer eid;

    private Integer cid;

    private String fname;

    private Double fprice;

    private String vname;

    private Double vdiscount;

    private Double money;

    private Date time;

    @Override
    public String toString() {
        return "Log{" +
                "lid=" + lid +
                ", eid=" + eid +
                ", cid=" + cid +
                ", fname='" + fname + '\'' +
                ", fprice=" + fprice +
                ", vname='" + vname + '\'' +
                ", vdiscount=" + vdiscount +
                ", money=" + money +
                ", time=" + time +
                '}';
    }

    public Integer getLid() {
        return lid;
    }

    public void setLid(Integer lid) {
        this.lid = lid;
    }

    public Integer getEid() {
        return eid;
    }

    public void setEid(Integer eid) {
        this.eid = eid;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public Double getFprice() {
        return fprice;
    }

    public void setFprice(Double fprice) {
        this.fprice = fprice;
    }

    public String getVname() {
        return vname;
    }

    public void setVname(String vname) {
        this.vname = vname;
    }

    public Double getVdiscount() {
        return vdiscount;
    }

    public void setVdiscount(Double vdiscount) {
        this.vdiscount = vdiscount;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}