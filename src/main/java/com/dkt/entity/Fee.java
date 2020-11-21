package com.dkt.entity;

/**
*@author 窦康泰
*@date 2020/11/21
*/
public class Fee {
    private Integer fid;

    private String name;

    private Double price;

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }
}