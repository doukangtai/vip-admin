package com.dkt.service.impl;

import com.dkt.entity.Customer;
import com.dkt.entity.Employee;
import com.dkt.mapper.CustomerMapper;
import com.dkt.mapper.EmployeeMapper;
import com.dkt.service.AdminService;
import com.dkt.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author 窦康泰
 * @date 2020/11/17
 */
@Service
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    CustomerMapper customerMapper;

    @Override
    public Customer login(Customer customer) {
        return customerMapper.selectByPhonePassword(customer);
    }
}
