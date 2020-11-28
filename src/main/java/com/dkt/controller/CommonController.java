package com.dkt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

/**
 * @author 窦康泰
 * @date 2020/11/17
 */
@Controller
public class CommonController {

    private HttpSession session;

    @GetMapping("/admin/loginPage")
    public String adminLogin(HttpSession session) {
        this.session = session;
        String judge = judge();
        if ("error".equals(judge)) {
            return "admin/login";
        } else {
            return judge;
        }
    }

    @GetMapping("/employee/loginPage")
    public String employeeLogin(HttpSession session) {
        this.session = session;
        String judge = judge();
        if ("error".equals(judge)) {
            return "employee/login";
        } else {
            return judge;
        }
    }

    @GetMapping("/customer/loginPage")
    public String customerLogin(HttpSession session) {
        this.session = session;
        String judge = judge();
        if ("error".equals(judge)) {
            return "customer/login";
        } else {
            return judge;
        }
    }

    @GetMapping("/")
    public String index(HttpSession session) {
        this.session = session;
        String judge = judge();
        if ("error".equals(judge)) {
            return "common/index";
        } else {
            return judge;
        }
    }

    public String judge() {
        Object admin = session.getAttribute("admin");
        if (admin != null) {
            return "redirect:/admin/page/index";
        }
        Object employee = session.getAttribute("employee");
        if (employee != null) {
            return "redirect:/employee/page/index";
        }
        Object customer = session.getAttribute("customer");
        if (customer != null) {
            return "redirect:/customer/page/index";
        }
        return "error";
    }
}
