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

    @GetMapping("/page/employee/page")
    @ResponseBody
    public List<Employee> selectEmployeeByPage(@RequestParam(defaultValue = "0") Integer startIndex, @RequestParam(defaultValue = "5") Integer len) {
        return employeeService.selectByPage(startIndex, len);
    }

    @GetMapping("/page/employee/all")
    public String selectAllEmployee(Model model) {
        List<Employee> employees = employeeService.selectAllEmployee();
        model.addAttribute("employees", employees);
        return "admin/employee";
    }

    @GetMapping("/page/employee/add")
    public String addEmployeePage() {
        return "admin/employee_add";
    }

    @PostMapping("/employee/add")
    @ResponseBody
    public ResponseBean addEmployee(@RequestBody Employee employee) {
        Employee selectByPhone = employeeService.selectByPhone(employee.getPhone());
        if (selectByPhone != null) {
            return new ResponseBean("error", "员工存在添加失败");
        }
        int insert = employeeService.insert(employee);
        if (insert >= 1) {
            return new ResponseBean("success", "添加员工成功");
        }
        return new ResponseBean("error", "添加员工失败");
    }

    @GetMapping("/selectByPrimaryKey")
    @ResponseBody
    public Employee selectByPrimaryKey(@RequestParam("eid") Integer eid) {
        Employee employee = employeeService.selectByPrimaryKey(eid);
        return employee;
    }

    @PostMapping("/updateByPrimaryKey")
    @ResponseBody
    public ResponseBean updateByPrimaryKey(@RequestBody Employee employee) {
        return employeeService.updateByPrimaryKeySelective(employee);
    }

    @GetMapping("/test4")
    public ModelAndView testModelAndView() {
        ModelAndView mdv = new ModelAndView("customer/test");
        mdv.addObject("mdv", "ABCmdv");
        return mdv;
    }
}
