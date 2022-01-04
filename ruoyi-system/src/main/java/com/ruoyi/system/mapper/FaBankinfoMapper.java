package com.ruoyi.us.mapper;

import java.util.List;
import com.ruoyi.us.domain.FaBankinfo;

/**
 * 银行管理Mapper接口
 * 
 * @author ruoyi
 * @date 2021-12-09
 */
public interface FaBankinfoMapper 
{
    /**
     * 查询银行管理
     * 
     * @param id 银行管理ID
     * @return 银行管理
     */
    public FaBankinfo selectFaBankinfoById(Long id);

    /**
     * 查询银行管理列表
     * 
     * @param faBankinfo 银行管理
     * @return 银行管理集合
     */
    public List<FaBankinfo> selectFaBankinfoList(FaBankinfo faBankinfo);

    /**
     * 新增银行管理
     * 
     * @param faBankinfo 银行管理
     * @return 结果
     */
    public int insertFaBankinfo(FaBankinfo faBankinfo);

    /**
     * 修改银行管理
     * 
     * @param faBankinfo 银行管理
     * @return 结果
     */
    public int updateFaBankinfo(FaBankinfo faBankinfo);

    /**
     * 删除银行管理
     * 
     * @param id 银行管理ID
     * @return 结果
     */
    public int deleteFaBankinfoById(Long id);

    /**
     * 批量删除银行管理
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteFaBankinfoByIds(String[] ids);
}
