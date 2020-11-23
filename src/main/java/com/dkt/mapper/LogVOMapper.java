package com.dkt.mapper;

import com.dkt.entity.Customer;
import com.dkt.entity.LogVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 窦康泰
 * @date 2020/11/22
 */
public interface LogVOMapper {

    Integer selectTotalCount();

    List<LogVO> selectByPage(@Param("startIndex") Integer startIndex, @Param("len") Integer len);

    Integer selectCountCustomerByPhone(String phone);

    List<LogVO> selectByPageCustomerPhone(@Param("phone") String phone, @Param("startIndex") Integer startIndex, @Param("len") Integer len);

    Integer selectCountEmployeeByPhone(String phone);

    List<LogVO> selectByPageEmployeePhone(@Param("phone") String phone, @Param("startIndex") Integer startIndex, @Param("len") Integer len);

    Integer selectCountCEByPhone(@Param("cphone") String phone, @Param("ephone") String ephone);

    List<LogVO> selectByPageCEPhone(@Param("cphone") String cphone, @Param("ephone") String ephone, @Param("startIndex") Integer startIndex, @Param("len") Integer len);
}
