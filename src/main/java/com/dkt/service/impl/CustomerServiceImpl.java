package com.dkt.service.impl;

import com.dkt.entity.*;
import com.dkt.mapper.*;
import com.dkt.result.ResponseBean;
import com.dkt.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

/**
 * @author 窦康泰
 * @date 2020/11/17
 */
@Service
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    CustomerMapper customerMapper;
    @Autowired
    CustomerVipMapper customerVipMapper;
    @Autowired
    VipMapper vipMapper;
    @Autowired
    FeeMapper feeMapper;
    @Autowired
    LogMapper logMapper;

    @Override
    public Customer login(Customer customer) {
        return customerMapper.selectByPhonePassword(customer);
    }

    @Override
    public List<CustomerVip> selectByPage(Integer startIndex, Integer len) {
        return customerVipMapper.selectByPage(startIndex, len);
    }

    @Override
    public Integer selectCustomerCount() {
        return customerVipMapper.selectCustomerCount();
    }

    @Override
    public int insert(Customer record) {
        return customerMapper.insert(record);
    }

    @Override
    public Customer selectByPhone(String phone) {
        return customerMapper.selectByPhone(phone);
    }

    @Override
    public ResponseBean customerCharge(String phone, Double charge) {
        Customer customer = customerMapper.selectByPhone(phone);
        customer.setMoney(customer.getMoney() + charge);
        int saveMoneyByPhone = customerMapper.saveMoneyByPhone(customer.getPhone(), customer.getMoney());
        if (saveMoneyByPhone >= 1) {
            return new ResponseBean("success", "充值成功");
        }
        return new ResponseBean("error", "充值失败");
    }

    @Override
    public ResponseBean customerCost(String phone, Integer fid, HttpSession session) {
        Enumeration<String> attributeNames = session.getAttributeNames();
        Employee employeeSession = null;
        while (attributeNames.hasMoreElements()) {
            String nextElementName = attributeNames.nextElement();
            employeeSession = (Employee) session.getAttribute(nextElementName);
        }
        CustomerVip customerVip = customerVipMapper.selectByPhone(phone);
        if ("1".equals(customerVip.getIsLogoutVip())) {
            return new ResponseBean("error", "此会员卡已失效，收款失败");
        }
        Fee fee = feeMapper.selectByPrimaryKey(fid);
        Log log = new Log();
        log.setEid(employeeSession.getEid());
        log.setCid(customerVip.getCid());
        log.setFname(fee.getName());
        log.setFprice(fee.getPrice());
        log.setVname(customerVip.getVip().getName());
        log.setVdiscount(customerVip.getVip().getDiscount());
        Double money = log.getFprice() * log.getVdiscount();
        log.setMoney(money);
        log.setTime(new Date());
        if (customerVip.getMoney() - log.getMoney() < 0) {
            return new ResponseBean("error", "余额不足，收费失败");
        }
        int insertLog = logMapper.insert(log);
        int saveMoneyByPhone = customerMapper.saveMoneyByPhone(customerVip.getPhone(), customerVip.getMoney() - log.getMoney());
        if (saveMoneyByPhone >= 1 && insertLog >= 1) {
            return new ResponseBean("success", "收费成功");
        }
        return new ResponseBean("error", "收费失败");
    }

    @Override
    public CustomerVip selectCustomerVipByPhone(String phone) {
        return customerVipMapper.selectByPhone(phone);
    }

    @Override
    public ResponseBean updateByPrimaryKeySelective(Customer customer) {
        Customer selectByPhone = customerMapper.selectByPhone(customer.getPhone());
        Customer selectByPrimaryKey = customerMapper.selectByPrimaryKey(customer.getCid());
        if (selectByPhone != null && !selectByPhone.getPhone().equals(selectByPrimaryKey.getPhone())) {
            return new ResponseBean("error", "顾客存在，修改失败");
        }
        int updateByPrimaryKeySelective = customerMapper.updateByPrimaryKeySelective(customer);
        if (updateByPrimaryKeySelective >= 1) {
            return new ResponseBean("success", "修改顾客信息成功");
        }
        return new ResponseBean("error", "修改顾客信息失败");
    }

    @Override
    public ResponseBean deleteCustomer(Integer cid) {
        int updateIsLogoutVipToOne = customerMapper.updateIsLogoutVipToOne(cid);
        Customer customer = customerMapper.selectByPrimaryKey(cid);
        int saveMoneyByPhone = customerMapper.saveMoneyByPhone(customer.getPhone(), 0D);
        if (updateIsLogoutVipToOne >= 1 && saveMoneyByPhone >= 1) {
            return new ResponseBean("success", "删除成功");
        }
        return new ResponseBean("error", "删除失败");
    }

    @Override
    public Integer selectCustomerCountDelete() {
        return customerVipMapper.selectCustomerCountDelete();
    }

    @Override
    public List<CustomerVip> selectDeleteByPage(Integer startIndex, Integer len) {
        return customerVipMapper.selectDeleteByPage(startIndex, len);
    }

    @Override
    public ResponseBean recycleCustomer(Integer cid) {
        int updateIsDeleteToZero = customerMapper.updateIsLogoutVipToZero(cid);
        if (updateIsDeleteToZero >= 1) {
            return new ResponseBean("success", "还原成功");
        }
        return new ResponseBean("error", "还原失败");
    }

    @Override
    public ResponseBean customerAdd(Customer customer) {
        Customer selectByPhone = selectByPhone(customer.getPhone());
        if (selectByPhone != null) {
            return new ResponseBean("error", "顾客存在添加失败");
        }
        int insert = insert(customer);
        if (insert >= 1) {
            return new ResponseBean("success", "添加顾客成功");
        }
        return new ResponseBean("error", "添加顾客失败");
    }
}
