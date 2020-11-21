package com.dkt.service.impl;

import com.dkt.entity.Fee;
import com.dkt.mapper.FeeMapper;
import com.dkt.service.FeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 窦康泰
 * @date 2020/11/21
 */
@Service
public class FeeServiceImpl implements FeeService {

    @Autowired
    FeeMapper feeMapper;

    @Override
    public List<Fee> selectAll() {
        return feeMapper.selectAll();
    }
}
