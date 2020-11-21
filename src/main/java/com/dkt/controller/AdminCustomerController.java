package com.dkt.controller;

import com.dkt.entity.*;
import com.dkt.result.ResponseBean;
import com.dkt.service.CustomerService;
import com.dkt.service.EmployeeService;
import com.dkt.service.FeeService;
import com.dkt.service.VipService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.Enumeration;
import java.util.List;

/**
 * @author 窦康泰
 * @date 2020/11/16
 */
@Controller
@RequestMapping("/admin")
public class AdminCustomerController {

    @Autowired
    CustomerService customerService;
    @Autowired
    VipService vipService;
    @Autowired
    FeeService feeService;

    @GetMapping("/show/session")
    public void showSession(HttpSession session) {
        Enumeration<String> attributeNames = session.getAttributeNames();
        while (attributeNames.hasMoreElements()) {
            String sessionName = attributeNames.nextElement();
            System.out.println(sessionName);
            System.out.println(session.getAttribute(sessionName));
        }
    }

    @GetMapping("/customer/{phone}")
    @ResponseBody
    public Customer selectCustomerByPhone(@PathVariable("phone") String phone) {
        return customerService.selectByPhone(phone);
    }

    @PostMapping("/customer/update")
    @ResponseBody
    public ResponseBean updateCustomerByCid(@RequestBody Customer customer) {
        return customerService.updateByPrimaryKeySelective(customer);
    }

    @GetMapping("/customerVip/{phone}")
    @ResponseBody
    public CustomerVip selectCustomerVipByPhone(@PathVariable("phone") String phone) {
        return customerService.selectCustomerVipByPhone(phone);
    }

    @GetMapping("/customer/{phone}/{charge:.*}")
    @ResponseBody
    public ResponseBean customerCharge(@PathVariable("phone") String phone, @PathVariable("charge") Double charge) {
        return customerService.customerCharge(phone, charge);
    }

    @GetMapping("/customer/cost/{phone}/{fid}")
    @ResponseBody
    public ResponseBean customerCost(@PathVariable("phone") String phone, @PathVariable("fid") Integer fid, HttpSession session) {
        return customerService.customerCost(phone, fid, session);
    }

    @GetMapping("/allVip")
    @ResponseBody
    public List<Vip> selectAllVip() {
        return vipService.selectAll();
    }

    @GetMapping("/allFee")
    @ResponseBody
    public List<Fee> selectAllFee() {
        return feeService.selectAll();
    }

    @PostMapping("/customer/add")
    @ResponseBody
    public ResponseBean customerAdd(@RequestBody Customer customer) {
        return customerService.customerAdd(customer);
    }

    @GetMapping("/customer/page")
    @ResponseBody
    public List<CustomerVip> selectCustomerByPage2(@RequestParam(defaultValue = "0") Integer startIndex, @RequestParam(defaultValue = "5") Integer len) {
        return customerService.selectByPage(startIndex, len);
    }

    @GetMapping("/customer/page/delete")
    @ResponseBody
    public List<CustomerVip> selectDeleteCustomerByPage(@RequestParam(defaultValue = "0") Integer startIndex, @RequestParam(defaultValue = "5") Integer len) {
        return customerService.selectDeleteByPage(startIndex, len);
    }

    @GetMapping("/customer/count")
    @ResponseBody
    public Integer getCustomerCount() {
        return customerService.selectCustomerCount();
    }

    @GetMapping("/customer/count/delete")
    @ResponseBody
    public Integer getCustomerCountDelete() {
        return customerService.selectCustomerCountDelete();
    }

    @GetMapping("/customer/delete")
    @ResponseBody
    public ResponseBean deleteCustomerByCid(@RequestParam Integer cid) {
        return customerService.deleteCustomer(cid);
    }

    @GetMapping("/customer/recycle")
    @ResponseBody
    public ResponseBean recycleCustomerByCid(@RequestParam Integer cid) {
        return customerService.recycleCustomer(cid);
    }

    @GetMapping("/page/customer")
    public String selectCustomerByPage() {
        return "admin/customer";
    }

    @GetMapping("/page/customer/recycle")
    public String customerRecyclePage() {
        return "admin/customer_recycle";
    }

    @GetMapping("/page/customer/update")
    public String customerUpdatePage() {
        return "admin/customer_update";
    }

    @GetMapping("/page/customer/add")
    public String customerAddPage(Model model) {
        model.addAttribute("vips", vipService.selectAll());
        return "admin/customer_add";
    }

    @GetMapping("/page/customer/charge")
    public String customerChargePage() {
        return "admin/customer_charge";
    }
}
