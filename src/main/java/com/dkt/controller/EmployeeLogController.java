package com.dkt.controller;

import com.dkt.entity.LogVO;
import com.dkt.result.ResponseBean;
import com.dkt.service.LogVOService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author 窦康泰
 * @date 2020/11/27
 */
@Controller
@RequestMapping("/employee")
public class EmployeeLogController {

    @Autowired
    LogVOService logVOService;

    @GetMapping("/log/delete")
    @ResponseBody
    public ResponseBean deleteByLid(@RequestParam("lid") Integer lid) {
        return logVOService.deleteByLid(lid);
    }

    @GetMapping("/log/revoke")
    @ResponseBody
    public ResponseBean revoke(@RequestParam("lid") Integer lid) {
        return logVOService.revokeLog(lid);
    }

    @GetMapping("/log/page/ce")
    @ResponseBody
    public List<LogVO> selectByPageCEPhone(@RequestParam("cphone") String cphone, @RequestParam("ephone") String ephone, @RequestParam("startIndex") Integer startIndex, @RequestParam("len") Integer len) {
        return logVOService.selectByPageCEPhone(cphone, ephone, startIndex, len);
    }

    @GetMapping("/log/count/ce")
    @ResponseBody
    public Integer selectCountCEByPhone(@RequestParam("cphone") String cphone, @RequestParam("ephone") String ephone) {
        return logVOService.selectCountCEByPhone(cphone, ephone);
    }

    @GetMapping("/log/page/employee")
    @ResponseBody
    public List<LogVO> selectByPageEmployeePhone(@RequestParam("phone") String phone, @RequestParam("startIndex") Integer startIndex, @RequestParam("len") Integer len) {
        return logVOService.selectByPageEmployeePhone(phone, startIndex, len);
    }

    @GetMapping("/log/count/employee")
    @ResponseBody
    public Integer selectCountEmployeeByPhone(@RequestParam("phone") String phone) {
        return logVOService.selectCountEmployeeByPhone(phone);
    }

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
        return "employee/log";
    }

}
