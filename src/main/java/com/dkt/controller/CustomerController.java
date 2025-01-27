package com.dkt.controller;

import com.dkt.entity.Customer;
import com.dkt.result.ResponseBean;
import com.dkt.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

/**
 * @author 窦康泰
 * @date 2020/11/17
 */
@Controller
@RequestMapping("/customer")
public class CustomerController {

    @Autowired
    CustomerService customerService;

    @PostMapping("/login")
    @ResponseBody
    public ResponseBean login(@RequestBody Customer customer, HttpSession session) {
        Customer loginCustomer = customerService.login(customer);
        if (loginCustomer != null) {
            session.setAttribute("customer", loginCustomer);
            session.setMaxInactiveInterval(30*60);
            return new ResponseBean("success", "登录成功");
        } else {
            return new ResponseBean("error", "手机号或密码错误或账号注销");
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("/page/index")
    public String index() {
        return "customer/index";
    }

}
