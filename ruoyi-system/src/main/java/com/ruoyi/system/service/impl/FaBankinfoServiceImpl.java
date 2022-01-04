package com.ruoyi.us.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.us.mapper.FaBankinfoMapper;
import com.ruoyi.us.domain.FaBankinfo;
import com.ruoyi.us.service.IFaBankinfoService;
import com.ruoyi.common.core.text.Convert;

/**
 * 银行管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2021-12-09
 */
@Service
public class FaBankinfoServiceImpl implements IFaBankinfoService 
{
    @Autowired
    private FaBankinfoMapper faBankinfoMapper;

    /**
     * 查询银行管理
     * 
     * @param id 银行管理ID
     * @return 银行管理
     */
    @Override
    public FaBankinfo selectFaBankinfoById(Long id)
    {
        return faBankinfoMapper.selectFaBankinfoById(id);
    }

    /**
     * 查询银行管理列表
     * 
     * @param faBankinfo 银行管理
     * @return 银行管理
     */
    @Override
    public List<FaBankinfo> selectFaBankinfoList(FaBankinfo faBankinfo)
    {
        return faBankinfoMapper.selectFaBankinfoList(faBankinfo);
    }

    /**
     * 新增银行管理
     * 
     * @param faBankinfo 银行管理
     * @return 结果
     */
    @Override
    public int insertFaBankinfo(FaBankinfo faBankinfo)
    {
        return faBankinfoMapper.insertFaBankinfo(faBankinfo);
    }

    /**
     * 修改银行管理
     * 
     * @param faBankinfo 银行管理
     * @return 结果
     */
    @Override
    public int updateFaBankinfo(FaBankinfo faBankinfo)
    {
        return faBankinfoMapper.updateFaBankinfo(faBankinfo);
    }

    /**
     * 删除银行管理对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteFaBankinfoByIds(String ids)
    {
        return faBankinfoMapper.deleteFaBankinfoByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除银行管理信息
     * 
     * @param id 银行管理ID
     * @return 结果
     */
    @Override
    public int deleteFaBankinfoById(Long id)
    {
        return faBankinfoMapper.deleteFaBankinfoById(id);
    }
}
