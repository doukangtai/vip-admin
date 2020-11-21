package com.dkt.controller;

import com.dkt.entity.Vip;
import com.dkt.result.ResponseBean;
import com.dkt.service.VipService;
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
public class AdminVipController {

    @Autowired
    VipService vipService;

    @PostMapping("/vip/save")
    @ResponseBody
    public ResponseBean saveVip(@RequestBody Vip vip) {
        return vipService.updateByPrimaryKeySelective(vip);
    }

    @GetMapping("/vip/select")
    @ResponseBody
    public Vip selectByPrimary(@RequestParam("vid") Integer vid) {
        return vipService.selectByPrimaryKey(vid);
    }

    @GetMapping("/page/vip")
    public String vipPage(Model model) {
        List<Vip> vips = vipService.selectAll();
        model.addAttribute("vips", vips);
        return "admin/vip";
    }

}
