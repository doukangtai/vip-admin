package com.dkt.mapper;

import com.dkt.entity.Employee;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
*@author 窦康泰
*@date 2020/11/17
*/
public interface EmployeeMapper {
    int deleteByPrimaryKey(Integer eid);

    int insert(Employee record);

    int insertSelective(Employee record);

    Employee selectByPrimaryKey(Integer eid);

    int updateByPrimaryKeySelective(Employee record);

    int updateByPrimaryKey(Employee record);

    List<Employee> selectAllEmployee();

    Employee selectByPhonePasswordType(Employee employee);

    List<Employee> selectByPage(@Param("startIndex") Integer startIndex, @Param("len") Integer len);

    Employee selectByPhone(String phone);

    Integer selectEmployeeTotalCount();
}