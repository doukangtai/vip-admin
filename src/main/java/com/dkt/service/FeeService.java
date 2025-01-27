package com.dkt.service;

import com.dkt.entity.Fee;
import com.dkt.result.ResponseBean;

import java.util.List;

/**
 * @author 窦康泰
 * @date 2020/11/21
 */
public interface FeeService {

    List<Fee> selectAll();

    Fee selectByPrimaryKey(Integer fid);

    ResponseBean insert(Fee record);

    ResponseBean updateByPrimaryKeySelective(Fee record);

    ResponseBean deleteByPrimaryKey(Integer fid);

}
