package com.dkt.service;

import com.dkt.entity.Customer;
import com.dkt.entity.CustomerVip;
import com.dkt.entity.Employee;
import com.dkt.result.ResponseBean;
import org.apache.ibatis.annotations.Param;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author 窦康泰
 * @date 2020/11/17
 */
public interface CustomerService {

    Customer login(Customer customer);

    List<CustomerVip> selectByPage(@Param("startIndex") Integer startIndex, @Param("len") Integer len);

    Integer selectCustomerCount();

    int insert(Customer record);

    Customer selectByPhone(String phone);

    ResponseBean customerCharge(String phone, Double charge);

    ResponseBean customerCost(String phone, Integer fid, HttpSession session);

    CustomerVip selectCustomerVipByPhone(String phone);

    ResponseBean updateByPrimaryKeySelective(Customer customer);

    ResponseBean deleteCustomer(Integer cid);

    Integer selectCustomerCountDelete();

    List<CustomerVip> selectDeleteByPage(@Param("startIndex") Integer startIndex, @Param("len") Integer len);

    ResponseBean recycleCustomer(Integer cid);

    ResponseBean customerAdd(Customer customer);
}
