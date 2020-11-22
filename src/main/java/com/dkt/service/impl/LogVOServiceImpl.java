package com.dkt.service.impl;

import com.dkt.entity.LogVO;
import com.dkt.mapper.LogVOMapper;
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
}
