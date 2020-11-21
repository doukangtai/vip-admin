package com.dkt.controller;

import com.dkt.entity.Fee;
import com.dkt.entity.Vip;
import com.dkt.result.ResponseBean;
import com.dkt.service.FeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author 窦康泰
 * @date 2020/11/21
 */
@Controller
@RequestMapping("/admin")
public class AdminFeeController {

    @Autowired
    FeeService feeService;

    @GetMapping("/fee/delete")
    @ResponseBody
    public ResponseBean deleteByPrimary(@RequestParam("fid") Integer fid) {
        return feeService.deleteByPrimaryKey(fid);
    }

    @PostMapping("/fee/save")
    @ResponseBody
    public ResponseBean saveFee(@RequestBody Fee fee) {
        return feeService.updateByPrimaryKeySelective(fee);
    }

    @PostMapping("/fee/add")
    @ResponseBody
    public ResponseBean selectByPrimary(@RequestBody Fee fee) {
        return feeService.insert(fee);
    }

    @GetMapping("/fee/select")
    @ResponseBody
    public Fee selectByPrimary(@RequestParam("fid") Integer fid) {
        return feeService.selectByPrimaryKey(fid);
    }

    @GetMapping("/page/fee")
    public String feePage(Model model) {
        List<Fee> fees = feeService.selectAll();
        model.addAttribute("fees", fees);
        return "admin/fee";
    }

}
