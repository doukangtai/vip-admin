package com.dkt.service.impl;

import com.dkt.entity.Employee;
import com.dkt.mapper.EmployeeMapper;
import com.dkt.result.ResponseBean;
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
    public ResponseBean updateByPrimaryKeySelective(Employee record) {
        int updateByPrimaryKeySelective = employeeMapper.updateByPrimaryKeySelective(record);
        if (updateByPrimaryKeySelective >= 1) {
            return new ResponseBean("success", "修改员工信息成功");
        }
        return new ResponseBean("error", "修改员工信息失败");
    }

    @Override
    public int insert(Employee record) {
        return employeeMapper.insert(record);
    }

    @Override
    public List<Employee> selectByPage(Integer startIndex, Integer len) {
        return employeeMapper.selectByPage(startIndex, len);
    }

    @Override
    public Employee selectByPhone(String phone) {
        return employeeMapper.selectByPhone(phone);
    }

    @Override
    public Integer selectEmployeeTotalCount() {
        return employeeMapper.selectEmployeeTotalCount();
    }
}
