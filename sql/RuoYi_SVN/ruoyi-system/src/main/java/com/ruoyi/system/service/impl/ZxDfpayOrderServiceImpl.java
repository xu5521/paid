package com.ruoyi.system.service.impl;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.system.domain.ZxDfpayOrder;
import com.ruoyi.system.mapper.ZxDfpayOrderMapper;
import com.ruoyi.system.service.IZxDfpayOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.common.core.text.Convert;

import java.util.List;

/**
 * 代付订单Service业务层处理
 * 
 * @author ruoyi
 * @date 2021-12-03
 */
@Service
public class ZxDfpayOrderServiceImpl implements IZxDfpayOrderService
{
    @Autowired
    private ZxDfpayOrderMapper zxDfpayOrderMapper;

    /**
     * 查询代付订单
     * 
     * @param id 代付订单ID
     * @return 代付订单
     */
    @Override
    public ZxDfpayOrder selectZxDfpayOrderById(Long id)
    {
        return zxDfpayOrderMapper.selectZxDfpayOrderById(id);
    }

    /**
     * 查询代付订单列表
     * 
     * @param zxDfpayOrder 代付订单
     * @return 代付订单
     */
    @Override
    public List<ZxDfpayOrder> selectZxDfpayOrderList(ZxDfpayOrder zxDfpayOrder)
    {
        return zxDfpayOrderMapper.selectZxDfpayOrderList(zxDfpayOrder);
    }

    /**
     * 新增代付订单
     * 
     * @param zxDfpayOrder 代付订单
     * @return 结果
     */
    @Override
    public int insertZxDfpayOrder(ZxDfpayOrder zxDfpayOrder)
    {
        zxDfpayOrder.setCreateTime(DateUtils.getNowDate());
        return zxDfpayOrderMapper.insertZxDfpayOrder(zxDfpayOrder);
    }

    /**
     * 修改代付订单
     * 
     * @param zxDfpayOrder 代付订单
     * @return 结果
     */
    @Override
    public int updateZxDfpayOrder(ZxDfpayOrder zxDfpayOrder)
    {
        zxDfpayOrder.setUpdateTime(DateUtils.getNowDate());
        return zxDfpayOrderMapper.updateZxDfpayOrder(zxDfpayOrder);
    }

    /**
     * 删除代付订单对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteZxDfpayOrderByIds(String ids)
    {
        return zxDfpayOrderMapper.deleteZxDfpayOrderByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除代付订单信息
     * 
     * @param id 代付订单ID
     * @return 结果
     */
    @Override
    public int deleteZxDfpayOrderById(Long id)
    {
        return zxDfpayOrderMapper.deleteZxDfpayOrderById(id);
    }
}
