package com.dkt.service.impl;

import com.dkt.entity.LogVO;
import com.dkt.mapper.LogMapper;
import com.dkt.mapper.LogVOMapper;
import com.dkt.result.ResponseBean;
import com.dkt.service.LogVOService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 窦康泰
 * @date 2020/11/22
 */
@Service
public class LogVOServiceImpl implements LogVOService {

    @Autowired
    LogVOMapper logVOMapper;
    @Autowired
    LogMapper logMapper;

    @Override
    public List<LogVO> selectByPage(Integer startIndex, Integer len) {
        return logVOMapper.selectByPage(startIndex, len);
    }

    @Override
    public Integer selectTotalCount() {
        return logVOMapper.selectTotalCount();
    }

    @Override
    public Integer selectCountCustomerByPhone(String phone) {
        return logVOMapper.selectCountCustomerByPhone(phone);
    }

    @Override
    public List<LogVO> selectByPageCustomerPhone(String phone, Integer startIndex, Integer len) {
        return logVOMapper.selectByPageCustomerPhone(phone, startIndex, len);
    }

    @Override
    public Integer selectCountEmployeeByPhone(String phone) {
        return logVOMapper.selectCountEmployeeByPhone(phone);
    }

    @Override
    public List<LogVO> selectByPageEmployeePhone(String phone, Integer startIndex, Integer len) {
        return logVOMapper.selectByPageEmployeePhone(phone, startIndex, len);
    }

    @Override
    public Integer selectCountCEByPhone(String cphone, String ephone) {
        return logVOMapper.selectCountCEByPhone(cphone, ephone);
    }

    @Override
    public List<LogVO> selectByPageCEPhone(String cphone, String ephone, Integer startIndex, Integer len) {
        return logVOMapper.selectByPageCEPhone(cphone, ephone, startIndex, len);
    }

    @Override
    public ResponseBean revokeLog(Integer lid) {
        Double revokeMoney = logMapper.selectRevokeMoney(lid);
        int updateCustomerMoneyByLid = logMapper.updateCustomerMoneyByLid(lid, revokeMoney);
        int deleteByPrimaryKey = logMapper.deleteByPrimaryKey(lid);
        if (updateCustomerMoneyByLid >= 1 && deleteByPrimaryKey >= 1) {
            return new ResponseBean("success", "订单撤回成功");
        }
        return new ResponseBean("error", "未知错误导致订单撤回失败");
    }

    @Override
    public ResponseBean deleteByLid(Integer lid) {
        int deleteByPrimaryKey = logMapper.deleteByPrimaryKey(lid);
        if (deleteByPrimaryKey >= 1) {
            return new ResponseBean("success", "订单删除成功");
        }
        return new ResponseBean("error", "订单删除失败");
    }
}
