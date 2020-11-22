package com.dkt.controller;

import com.dkt.entity.Fee;
import com.dkt.entity.LogVO;
import com.dkt.service.LogVOService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author 窦康泰
 * @date 2020/11/22
 */
@Controller
@RequestMapping("/admin")
public class AdminLogController {

    @Autowired
    LogVOService logVOService;

    @GetMapping("/log/page/customer")
    @ResponseBody
    public List<LogVO> selectByPageCustomerPhone(@RequestParam("phone") String phone, @RequestParam("startIndex") Integer startIndex, @RequestParam("len") Integer len) {
        return logVOService.selectByPageCustomerPhone(phone, startIndex, len);
    }

    @GetMapping("/log/count/customer")
    @ResponseBody
    public Integer selectCountCustomerByPhone(@RequestParam("phone") String phone) {
        return logVOService.selectCountCustomerByPhone(phone);
    }

    @GetMapping("/log/count/total")
    @ResponseBody
    public Integer selectCountTotal() {
        return logVOService.selectTotalCount();
    }

    @GetMapping("/log/page")
    @ResponseBody
    public List<LogVO> selectAllLogVOByPage(@RequestParam("startIndex") Integer startIndex, @RequestParam("len") Integer len) {
        return logVOService.selectByPage(startIndex, len);
    }

    @GetMapping("/page/log")
    public String feePage() {
        return "admin/log";
    }

}
