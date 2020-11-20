package com.dkt.mapper;

import com.dkt.entity.Vip;

import java.util.List;

/**
*@author 窦康泰
*@date 2020/11/19
*/
public interface VipMapper {
    int deleteByPrimaryKey(Integer vid);

    int insert(Vip record);

    int insertSelective(Vip record);

    Vip selectByPrimaryKey(Integer vid);

    int updateByPrimaryKeySelective(Vip record);

    int updateByPrimaryKey(Vip record);

    List<Vip> selectAll();
}