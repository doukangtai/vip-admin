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
        Employee selectByPrimaryKey = employeeMapper.selectByPrimaryKey(record.getEid());
        Employee selectByPhone = employeeMapper.selectByPhone(record.getPhone());
        if (selectByPhone != null && !selectByPhone.getPhone().equals(selectByPrimaryKey.getPhone())) {
            return new ResponseBean("error", "员工存在，修改失败");
        }
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

    @Override
    public Integer selectEmployeeTotalCountFire() {
        return employeeMapper.selectEmployeeTotalCountFire();
    }

    @Override
    public List<Employee> selectEmployeeFireByPage(Integer startIndex, Integer len) {
        return employeeMapper.selectEmployeeFireByPage(startIndex, len);
    }

    @Override
    public Integer selectEmployeeTotalCountNotFire() {
        return employeeMapper.selectEmployeeTotalCountNotFire();
    }

    @Override
    public List<Employee> selectEmployeeNotFireByPage(Integer startIndex, Integer len) {
        return employeeMapper.selectEmployeeNotFireByPage(startIndex, len);
    }
}
