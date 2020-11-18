package com.dkt.service;

import com.dkt.entity.Employee;

import java.util.List;

/**
 * @author 窦康泰
 * @date 2020/11/17
 */
public interface EmployeeService {

    Employee login(Employee employee);

    List<Employee> selectAllEmployee();

    Employee selectByPrimaryKey(Integer eid);

    int updateByPrimaryKeySelective(Employee record);

}
