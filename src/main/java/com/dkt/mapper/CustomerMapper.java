package com.dkt.mapper;

import com.dkt.entity.Customer;

/**
*@author 窦康泰
*@date 2020/11/17
*/
public interface CustomerMapper {
    int deleteByPrimaryKey(Integer cid);

    int insert(Customer record);

    int insertSelective(Customer record);

    Customer selectByPrimaryKey(Integer cid);

    int updateByPrimaryKeySelective(Customer record);

    int updateByPrimaryKey(Customer record);

    Customer selectByPhonePassword(Customer customer);
}