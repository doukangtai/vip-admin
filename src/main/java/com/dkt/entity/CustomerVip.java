package com.dkt.entity;

/**
*@author 窦康泰
*@date 2020/11/19
*/
public class CustomerVip {
    private Integer cid;

    private Vip vip;

    private String name;

    private String phone;

    private String password;

    private Double money;

    private String isLogoutVip;

    @Override
    public String toString() {
        return "CustomerVip{" +
                "cid=" + cid +
                ", vip=" + vip +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", password='" + password + '\'' +
                ", money=" + money +
                ", isLogoutVip='" + isLogoutVip + '\'' +
                '}';
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Vip getVip() {
        return vip;
    }

    public void setVip(Vip vip) {
        this.vip = vip;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public String getIsLogoutVip() {
        return isLogoutVip;
    }

    public void setIsLogoutVip(String isLogoutVip) {
        this.isLogoutVip = isLogoutVip;
    }
}