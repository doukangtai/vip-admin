package com.dkt.controller;

import com.dkt.entity.Employee;
import com.dkt.mapper.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
    EmployeeMapper employeeMapper;

//    @GetMapping("/admin/emp")
    @GetMapping("/employee")
    public String test3(Model model) {
        List<Employee> employees = employeeMapper.selectAll();
        model.addAttribute("employees", employees);
        return "admin/employee";
    }

    @GetMapping("/test3")
    public String testModel(Model model) {
        model.addAttribute("attr", "ABC");
        return "customer/test";
    }

    @GetMapping("/test4")
    public ModelAndView testModelAndView() {
        ModelAndView mdv = new ModelAndView("customer/test");
        mdv.addObject("mdv", "ABCmdv");
        return mdv;
    }
}
