package com.dkt.controller;

import com.dkt.entity.Employee;
import com.dkt.result.ResponseBean;
import com.dkt.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author 窦康泰
 * @date 2020/11/16
 */
@Controller
@RequestMapping("/admin")
public class AdminEmployeeController {

    @Autowired
    EmployeeService employeeService;

    @GetMapping("/employee/count")
    @ResponseBody
    public Integer getEmployeeTotalCount() {
        return employeeService.selectEmployeeTotalCount();
    }

    @GetMapping("/employee/count/fire")
    @ResponseBody
    public Integer getEmployeeTotalCountFire() {
        return employeeService.selectEmployeeTotalCountFire();
    }

    @GetMapping("/employee/count/notFire")
    @ResponseBody
    public Integer getEmployeeTotalCountNotFire() {
        return employeeService.selectEmployeeTotalCountNotFire();
    }

    @GetMapping("/employee/page")
    @ResponseBody
    public List<Employee> selectEmployeeByPage(@RequestParam(defaultValue = "0") Integer startIndex, @RequestParam(defaultValue = "5") Integer len) {
        return employeeService.selectByPage(startIndex, len);
    }

    @GetMapping("/employee/page/fire")
    @ResponseBody
    public List<Employee> selectEmployeeFireByPage(@RequestParam(defaultValue = "0") Integer startIndex, @RequestParam(defaultValue = "5") Integer len) {
        return employeeService.selectEmployeeFireByPage(startIndex, len);
    }

    @GetMapping("/employee/page/notFire")
    @ResponseBody
    public List<Employee> selectEmployeeNotFireByPage(@RequestParam(defaultValue = "0") Integer startIndex, @RequestParam(defaultValue = "5") Integer len) {
        return employeeService.selectEmployeeNotFireByPage(startIndex, len);
    }

    @PostMapping("/employee/add")
    @ResponseBody
    public ResponseBean addEmployee(@RequestBody Employee employee) {
        return employeeService.addEmployee(employee);
    }

    @GetMapping("/employee/selectByPrimaryKey")
    @ResponseBody
    public Employee selectByPrimaryKey(@RequestParam("eid") Integer eid) {
        return employeeService.selectByPrimaryKey(eid);
    }

    @PostMapping("/employee/updateByPrimaryKey")
    @ResponseBody
    public ResponseBean updateByPrimaryKey(@RequestBody Employee employee) {
        return employeeService.updateByPrimaryKeySelective(employee);
    }

    @GetMapping("/page/employee/all")
    public String selectAllEmployee() {
        return "admin/employee";
    }

    @GetMapping("/page/employee/fire")
    public String selectEmployeeFire() {
        return "admin/employee_fire";
    }

    @GetMapping("/page/employee/notFire")
    public String selectEmployeeNotFire() {
        return "admin/employee_not_fire";
    }

    @GetMapping("/page/employee/{phone}")
    public ModelAndView selectEmployeePageByPhone(@PathVariable("phone") String phone) {
        ModelAndView modelAndView = new ModelAndView("admin/employee_select");
        Employee employee = employeeService.selectByPhone(phone);
        modelAndView.addObject("employee", employee);
        return modelAndView;
    }

    @GetMapping("/page/employee/add")
    public String addEmployeePage() {
        return "admin/employee_add";
    }
}
