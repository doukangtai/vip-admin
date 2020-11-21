package com.dkt.service;

import com.dkt.entity.Employee;
import com.dkt.entity.Vip;
import com.dkt.result.ResponseBean;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 窦康泰
 * @date 2020/11/17
 */
public interface VipService {

    List<Vip> selectAll();

    Vip selectByPrimaryKey(Integer vid);

    ResponseBean updateByPrimaryKeySelective(Vip record);

}
