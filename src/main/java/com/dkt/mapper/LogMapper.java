package com.dkt.mapper;

import com.dkt.entity.Log;

/**
*@author 窦康泰
*@date 2020/11/21
*/
public interface LogMapper {
    int deleteByPrimaryKey(Integer lid);

    int insert(Log record);

    int insertSelective(Log record);

    Log selectByPrimaryKey(Integer lid);

    int updateByPrimaryKeySelective(Log record);

    int updateByPrimaryKey(Log record);
}