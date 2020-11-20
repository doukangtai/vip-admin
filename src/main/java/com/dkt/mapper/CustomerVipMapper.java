package com.dkt.mapper;

import com.dkt.entity.Customer;
import com.dkt.entity.CustomerVip;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
*@author 窦康泰
*@date 2020/11/19
*/
public interface CustomerVipMapper {

    List<CustomerVip> selectByPage(@Param("startIndex") Integer startIndex, @Param("len") Integer len);

    Integer selectCustomerCount();

    CustomerVip selectByPhone(String phone);

    Integer selectCustomerCountDelete();

    List<CustomerVip> selectDeleteByPage(@Param("startIndex") Integer startIndex, @Param("len") Integer len);
}