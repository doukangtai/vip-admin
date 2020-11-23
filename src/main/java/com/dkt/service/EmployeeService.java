package com.dkt.service;

import com.dkt.entity.Employee;
import com.dkt.result.ResponseBean;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

/**
 * @author 窦康泰
 * @date 2020/11/17
 */
public interface EmployeeService {

    Employee login(Employee employee);

    List<Employee> selectAllEmployee();

    Employee selectByPrimaryKey(Integer eid);

    ResponseBean updateByPrimaryKeySelective(Employee record);

    int insert(Employee record);

    List<Employee> selectByPage(Integer startIndex, Integer len);

    Employee selectByPhone(String phone);

    Integer selectEmployeeTotalCount();

    Integer selectEmployeeTotalCountFire();

    List<Employee> selectEmployeeFireByPage(Integer startIndex, Integer len);

    Integer selectEmployeeTotalCountNotFire();

    List<Employee> selectEmployeeNotFireByPage(Integer startIndex, Integer len);

    ResponseBean addEmployee(Employee employee);
}
