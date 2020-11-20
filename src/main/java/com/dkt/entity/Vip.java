package com.dkt.entity;

/**
*@author 窦康泰
*@date 2020/11/19
*/
public class Vip {
    private Integer vid;

    private String name;

    private Double discount;

    @Override
    public String toString() {
        return "Vip{" +
                "vid=" + vid +
                ", name='" + name + '\'' +
                ", discount=" + discount +
                '}';
    }

    public Integer getVid() {
        return vid;
    }

    public void setVid(Integer vid) {
        this.vid = vid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getDiscount() {
        return discount;
    }

    public void setDiscount(Double discount) {
        this.discount = discount;
    }
}