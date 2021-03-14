package com.dkt.service.impl;

import com.dkt.entity.Fee;
import com.dkt.mapper.FeeMapper;
import com.dkt.result.ResponseBean;
import com.dkt.service.FeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 窦康泰
 * @date 2020/11/21
 */
@Service
public class FeeServiceImpl implements FeeService {

    @Autowired
    FeeMapper feeMapper;

    @Override
    public List<Fee> selectAll() {
        return feeMapper.selectAll();
    }

    @Override
    public Fee selectByPrimaryKey(Integer fid) {
        return feeMapper.selectByPrimaryKey(fid);
    }

    @Override
    public ResponseBean insert(Fee record) {
        int insert = feeMapper.insert(record);
        if (insert >= 1) {
            return new ResponseBean("success", "添加新服务项目成功");
        }
        return new ResponseBean("error", "添加新服务项目失败");
    }

    @Override
    public ResponseBean updateByPrimaryKeySelective(Fee record) {
        if ("".equals(record.getName()) || record.getPrice() == null || record.getPrice() < 0) {
            return new ResponseBean("null", "数据不能为空，或数据非法");
        }
        int updateByPrimaryKeySelective = feeMapper.updateByPrimaryKeySelective(record);
        if (updateByPrimaryKeySelective >= 1) {
            return new ResponseBean("success", "修改服务项目成功");
        }
        return new ResponseBean("error", "修改服务项目失败");
    }

    @Override
    public ResponseBean deleteByPrimaryKey(Integer fid) {
        int deleteByPrimaryKey = feeMapper.deleteByPrimaryKey(fid);
        if (deleteByPrimaryKey >= 1) {
            return new ResponseBean("success", "删除服务项目成功");
        }
        return new ResponseBean("error", "删除服务项目失败");
    }
}
