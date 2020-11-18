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

    @GetMapping("/employee")
    public String selectAllEmployee(Model model) {
        List<Employee> employees = employeeService.selectAllEmployee();
        model.addAttribute("employees", employees);
        return "admin/employee";
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
        int update = employeeService.updateByPrimaryKeySelective(employee);
        if (update >= 1) {
            return new ResponseBean("success", "修改员工信息成功");
        }
        return new ResponseBean("error", "修改员工信息失败");
    }

    @GetMapping("/test4")
    public ModelAndView testModelAndView() {
        ModelAndView mdv = new ModelAndView("customer/test");
        mdv.addObject("mdv", "ABCmdv");
        return mdv;
    }
}
