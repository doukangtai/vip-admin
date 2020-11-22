package com.dkt.service;

import com.dkt.entity.LogVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 窦康泰
 * @date 2020/11/22
 */
public interface LogVOService {

    List<LogVO> selectByPage(@Param("startIndex") Integer startIndex, @Param("len") Integer len);

    Integer selectTotalCount();

    Integer selectCountCustomerByPhone(String phone);

    List<LogVO> selectByPageCustomerPhone(@Param("phone") String phone, @Param("startIndex") Integer startIndex, @Param("len") Integer len);
}
