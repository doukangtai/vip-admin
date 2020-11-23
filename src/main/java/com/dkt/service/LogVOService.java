package com.dkt.service;

import com.dkt.entity.LogVO;
import com.dkt.result.ResponseBean;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 窦康泰
 * @date 2020/11/22
 */
public interface LogVOService {

    List<LogVO> selectByPage(Integer startIndex, Integer len);

    Integer selectTotalCount();

    Integer selectCountCustomerByPhone(String phone);

    List<LogVO> selectByPageCustomerPhone(String phone, Integer startIndex, Integer len);

    Integer selectCountEmployeeByPhone(String phone);

    List<LogVO> selectByPageEmployeePhone(String phone, Integer startIndex, Integer len);

    Integer selectCountCEByPhone(String cphone, String ephone);

    List<LogVO> selectByPageCEPhone(String cphone, String ephone, Integer startIndex, Integer len);

    ResponseBean revokeLog(Integer lid);

    ResponseBean deleteByLid(Integer lid);
}
