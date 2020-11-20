package com.dkt.mapper;

import com.dkt.entity.Customer;
import com.dkt.entity.Employee;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
*@author 窦康泰
*@date 2020/11/19
*/
public interface CustomerMapper {
    int deleteByPrimaryKey(Integer cid);

    int insert(Customer record);

    int insertSelective(Customer record);

    Customer selectByPrimaryKey(Integer cid);

    int updateByPrimaryKeySelective(Customer record);

    int updateByPrimaryKey(Customer record);

    Customer selectByPhonePassword(Customer customer);

    List<Customer> selectByPage(@Param("startIndex") Integer startIndex, @Param("len") Integer len);

    Customer selectByPhone(String phone);

    int saveMoneyByPhone(@Param("phone") String phone, @Param("money") Double money);

    int updateIsLogoutVipToOne(Integer cid);

    int updateIsLogoutVipToZero(Integer cid);
}