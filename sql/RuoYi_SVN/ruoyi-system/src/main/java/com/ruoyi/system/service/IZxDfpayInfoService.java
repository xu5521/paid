package com.ruoyi.system.service;

import com.ruoyi.system.domain.ZxDfpayInfo;

import java.util.List;
/**
 * 代付通道信息Service接口
 * 
 * @author ruoyi
 * @date 2021-12-03
 */
public interface IZxDfpayInfoService 
{
    /**
     * 查询代付通道信息
     * 
     * @param id 代付通道信息ID
     * @return 代付通道信息
     */
    public ZxDfpayInfo selectZxDfpayInfoById(Long id);

    /**
     * 查询代付通道信息列表
     * 
     * @param zxDfpayInfo 代付通道信息
     * @return 代付通道信息集合
     */
    public List<ZxDfpayInfo> selectZxDfpayInfoList(ZxDfpayInfo zxDfpayInfo);

    /**
     * 新增代付通道信息
     * 
     * @param zxDfpayInfo 代付通道信息
     * @return 结果
     */
    public int insertZxDfpayInfo(ZxDfpayInfo zxDfpayInfo);

    /**
     * 修改代付通道信息
     * 
     * @param zxDfpayInfo 代付通道信息
     * @return 结果
     */
    public int updateZxDfpayInfo(ZxDfpayInfo zxDfpayInfo);

    /**
     * 批量删除代付通道信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteZxDfpayInfoByIds(String ids);

    /**
     * 删除代付通道信息信息
     * 
     * @param id 代付通道信息ID
     * @return 结果
     */
    public int deleteZxDfpayInfoById(Long id);
}
