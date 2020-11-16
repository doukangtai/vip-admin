package com.dkt.mapper;

import com.dkt.entity.Employee;

import java.util.List;

/**
*@author 窦康泰
*@date 2020/11/16
*/
public interface EmployeeMapper {
    int deleteByPrimaryKey(Integer eid);

    int insert(Employee record);

    int insertSelective(Employee record);

    Employee selectByPrimaryKey(Integer eid);

    int updateByPrimaryKeySelective(Employee record);

    int updateByPrimaryKey(Employee record);

    List<Employee> selectAll();
}