package com.ruoyi.us.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.us.mapper.RyPayOrderMapper;
import com.ruoyi.us.domain.RyPayOrder;
import com.ruoyi.us.service.IRyPayOrderService;
import com.ruoyi.common.core.text.Convert;

/**
 * 入账单管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-11-11
 */
@Service
public class RyPayOrderServiceImpl implements IRyPayOrderService 
{
    @Autowired
    private RyPayOrderMapper ryPayOrderMapper;

    /**
     * 查询入账单管理
     * 
     * @param id 入账单管理ID
     * @return 入账单管理
     */
    @Override
    public RyPayOrder selectRyPayOrderById(Long id)
    {
        return ryPayOrderMapper.selectRyPayOrderById(id);
    }

    /**
     * 查询入账单管理列表
     * 
     * @param ryPayOrder 入账单管理
     * @return 入账单管理
     */
    @Override
    public List<RyPayOrder> selectRyPayOrderList(RyPayOrder ryPayOrder)
    {
        return ryPayOrderMapper.selectRyPayOrderList(ryPayOrder);
    }

    /**
     * 新增入账单管理
     * 
     * @param ryPayOrder 入账单管理
     * @return 结果
     */
    @Override
    public int insertRyPayOrder(RyPayOrder ryPayOrder)
    {
        ryPayOrder.setCreateTime(DateUtils.getNowDate());
        return ryPayOrderMapper.insertRyPayOrder(ryPayOrder);
    }

    /**
     * 修改入账单管理
     * 
     * @param ryPayOrder 入账单管理
     * @return 结果
     */
    @Override
    public int updateRyPayOrder(RyPayOrder ryPayOrder)
    {
        ryPayOrder.setUpdateTime(DateUtils.getNowDate());
        return ryPayOrderMapper.updateRyPayOrder(ryPayOrder);
    }

    /**
     * 删除入账单管理对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteRyPayOrderByIds(String ids)
    {
        return ryPayOrderMapper.deleteRyPayOrderByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除入账单管理信息
     * 
     * @param id 入账单管理ID
     * @return 结果
     */
    @Override
    public int deleteRyPayOrderById(Long id)
    {
        return ryPayOrderMapper.deleteRyPayOrderById(id);
    }
}
