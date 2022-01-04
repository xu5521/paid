package com.ruoyi.us.mapper;

import java.util.List;
import com.ruoyi.us.domain.RyPayOrder;

/**
 * 入账单管理Mapper接口
 * 
 * @author ruoyi
 * @date 2020-11-11
 */
public interface RyPayOrderMapper 
{
    /**
     * 查询入账单管理
     * 
     * @param id 入账单管理ID
     * @return 入账单管理
     */
    public RyPayOrder selectRyPayOrderById(Long id);

    /**
     * 查询入账单管理列表
     * 
     * @param ryPayOrder 入账单管理
     * @return 入账单管理集合
     */
    public List<RyPayOrder> selectRyPayOrderList(RyPayOrder ryPayOrder);

    /**
     * 新增入账单管理
     * 
     * @param ryPayOrder 入账单管理
     * @return 结果
     */
    public int insertRyPayOrder(RyPayOrder ryPayOrder);

    /**
     * 修改入账单管理
     * 
     * @param ryPayOrder 入账单管理
     * @return 结果
     */
    public int updateRyPayOrder(RyPayOrder ryPayOrder);

    /**
     * 删除入账单管理
     * 
     * @param id 入账单管理ID
     * @return 结果
     */
    public int deleteRyPayOrderById(Long id);

    /**
     * 批量删除入账单管理
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteRyPayOrderByIds(String[] ids);
}
