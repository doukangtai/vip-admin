package com.dkt.mapper;

import com.dkt.entity.Fee;

import java.util.List;

/**
*@author 窦康泰
*@date 2020/11/21
*/
public interface FeeMapper {
    int deleteByPrimaryKey(Integer fid);

    int insert(Fee record);

    int insertSelective(Fee record);

    Fee selectByPrimaryKey(Integer fid);

    int updateByPrimaryKeySelective(Fee record);

    int updateByPrimaryKey(Fee record);

    List<Fee> selectAll();
}