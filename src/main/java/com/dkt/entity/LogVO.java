package com.dkt.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

/**
 * @author 窦康泰
 * @date 2020/11/22
 */
public class LogVO {
    private Integer lid;

    private String cname;

    private String cphone;

    private String ename;

    private String ephone;

    private String fname;

    private Double fprice;

    private String vname;

    private Double vdiscount;

    private Double money;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date time;

    @Override
    public String toString() {
        return "LogVO{" +
                "lid=" + lid +
                ", cname='" + cname + '\'' +
                ", cphone='" + cphone + '\'' +
                ", ename='" + ename + '\'' +
                ", ephone='" + ephone + '\'' +
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

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCphone() {
        return cphone;
    }

    public void setCphone(String cphone) {
        this.cphone = cphone;
    }

    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename;
    }

    public String getEphone() {
        return ephone;
    }

    public void setEphone(String ephone) {
        this.ephone = ephone;
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
