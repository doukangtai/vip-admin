package com.dkt.entity;

/**
*@author 窦康泰
*@date 2020/11/17
*/
public class Employee {
    private Integer eid;

    private String name;

    private String phone;

    private String password;

    private String address;

    private String type;

    private String isFire;

    @Override
    public String toString() {
        return "Employee{" +
                "eid=" + eid +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", password='" + password + '\'' +
                ", address='" + address + '\'' +
                ", type='" + type + '\'' +
                ", isFire='" + isFire + '\'' +
                '}';
    }

    public Integer getEid() {
        return eid;
    }

    public void setEid(Integer eid) {
        this.eid = eid;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getIsFire() {
        return isFire;
    }

    public void setIsFire(String isFire) {
        this.isFire = isFire;
    }
}