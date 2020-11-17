package com.dkt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @author 窦康泰
 * @date 2020/11/17
 */
@Controller
public class CommonController {

    @GetMapping("/admin/loginPage")
    public String adminLogin() {
        return "admin/login";
    }

    @GetMapping("/employee/loginPage")
    public String employeeLogin() {
        return "employee/login";
    }

    @GetMapping("/customer/loginPage")
    public String customerLogin() {
        return "customer/login";
    }

}
