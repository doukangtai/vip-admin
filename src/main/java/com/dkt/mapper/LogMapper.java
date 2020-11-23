package com.dkt.mapper;

import com.dkt.entity.Log;
import org.apache.ibatis.annotations.Param;

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

    Double selectRevokeMoney(Integer lid);

    int updateCustomerMoneyByLid(@Param("lid") Integer lid, @Param("money") Double money);
}