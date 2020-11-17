package com.dkt.service.impl;

import com.dkt.entity.Employee;
import com.dkt.mapper.EmployeeMapper;
import com.dkt.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author 窦康泰
 * @date 2020/11/17
 */
@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    EmployeeMapper employeeMapper;

    @Override
    public Employee login(Employee employee) {
        return employeeMapper.selectByPhonePasswordType(employee);
    }
}
