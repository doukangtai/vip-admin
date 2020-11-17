package com.dkt.controller;

import com.dkt.entity.Employee;
import com.dkt.result.ResponseBean;
import com.dkt.service.AdminService;
import com.dkt.service.impl.AdminServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

/**
 * @author 窦康泰
 * @date 2020/11/17
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    AdminService adminService;

    @PostMapping("/login")
    @ResponseBody
    public ResponseBean login(@RequestBody Employee employee, HttpSession session) {
        Employee loginEmployee = adminService.login(employee);
        if (loginEmployee != null) {
            session.setAttribute("admin", loginEmployee);
            return new ResponseBean("success", "登录成功");
        } else {
            return new ResponseBean("error", "手机号或密码错误");
        }
    }

    @GetMapping("/index")
    public String index() {
        return "admin/index";
    }

}
