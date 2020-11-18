package com.dkt.service.impl;

import com.dkt.entity.Employee;
import com.dkt.mapper.EmployeeMapper;
import com.dkt.service.AdminService;
import com.dkt.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 窦康泰
 * @date 2020/11/17
 */
@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    EmployeeMapper employeeMapper;

    @Override
    public Employee login(Employee employee) {
        return employeeMapper.selectByPhonePasswordType(employee);
    }

    @Override
    public List<Employee> selectAllEmployee() {
        return employeeMapper.selectAllEmployee();
    }

    @Override
    public Employee selectByPrimaryKey(Integer eid) {
        return employeeMapper.selectByPrimaryKey(eid);
    }

    @Override
    public int updateByPrimaryKeySelective(Employee record) {
        return employeeMapper.updateByPrimaryKeySelective(record);
    }
}
