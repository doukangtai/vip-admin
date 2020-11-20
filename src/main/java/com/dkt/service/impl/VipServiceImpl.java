package com.dkt.service.impl;

import com.dkt.entity.Employee;
import com.dkt.entity.Vip;
import com.dkt.mapper.EmployeeMapper;
import com.dkt.mapper.VipMapper;
import com.dkt.service.EmployeeService;
import com.dkt.service.VipService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 窦康泰
 * @date 2020/11/17
 */
@Service
public class VipServiceImpl implements VipService {

    @Autowired
    VipMapper vipMapper;

    @Override
    public List<Vip> selectAll() {
        return vipMapper.selectAll();
    }
}
