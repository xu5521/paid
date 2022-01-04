package com.ruoyi.system.service;

import com.ruoyi.system.domain.ZxDfpayOrder;

import java.util.List;
/**
 * 代付订单Service接口
 * 
 * @author ruoyi
 * @date 2021-12-03
 */
public interface IZxDfpayOrderService 
{
    /**
     * 查询代付订单
     * 
     * @param id 代付订单ID
     * @return 代付订单
     */
    public ZxDfpayOrder selectZxDfpayOrderById(Long id);

    /**
     * 查询代付订单列表
     * 
     * @param zxDfpayOrder 代付订单
     * @return 代付订单集合
     */
    public List<ZxDfpayOrder> selectZxDfpayOrderList(ZxDfpayOrder zxDfpayOrder);

    /**
     * 新增代付订单
     * 
     * @param zxDfpayOrder 代付订单
     * @return 结果
     */
    public int insertZxDfpayOrder(ZxDfpayOrder zxDfpayOrder);

    /**
     * 修改代付订单
     * 
     * @param zxDfpayOrder 代付订单
     * @return 结果
     */
    public int updateZxDfpayOrder(ZxDfpayOrder zxDfpayOrder);

    /**
     * 批量删除代付订单
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteZxDfpayOrderByIds(String ids);

    /**
     * 删除代付订单信息
     * 
     * @param id 代付订单ID
     * @return 结果
     */
    public int deleteZxDfpayOrderById(Long id);
}
