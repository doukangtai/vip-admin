package com.dkt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

/**
 * @author 窦康泰
 * @date 2020/11/16
 */
@Controller
public class TestController {
    @ResponseBody
    @GetMapping("/test")
    public List<String> getList() {
        List<String> list = new ArrayList<>();
        list.add("AAA");
        list.add("BBB");
        list.add("CCC");
        return list;
    }

    @GetMapping("/test2")
    public String test2() {
        return "admin/index";
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
