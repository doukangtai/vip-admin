package com.dkt.controller;

import com.dkt.entity.Employee;
import com.dkt.result.ResponseBean;
import com.dkt.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

/**
 * @author 窦康泰
 * @date 2020/11/17
 */
@Controller
@RequestMapping("/employee")
public class EmployeeController {

    @Autowired
    EmployeeService employeeService;

    @PostMapping("/login")
    @ResponseBody
    public ResponseBean login(@RequestBody Employee employee, HttpSession session) {
        Employee loginEmployee = employeeService.login(employee);
        if (loginEmployee != null) {
            session.setAttribute("employee", loginEmployee);
            session.setMaxInactiveInterval(30*60);
            return new ResponseBean("success", "登录成功");
        } else {
            return new ResponseBean("error", "手机号或密码错误或账号已注销");
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("/page/index")
    public String index() {
        return "employee/index";
    }

}
