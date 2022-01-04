package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.FaUserUsdtTransfer;

import java.util.List;
/**
 * USDT提币Mapper接口
 * 
 * @author ruoyi
 * @date 2021-12-06
 */
public interface FaUserUsdtTransferMapper 
{
    /**
     * 查询USDT提币
     * 
     * @param id USDT提币ID
     * @return USDT提币
     */
    public FaUserUsdtTransfer selectFaUserUsdtTransferById(Long id);

    /**
     * 查询USDT提币列表
     * 
     * @param faUserUsdtTransfer USDT提币
     * @return USDT提币集合
     */
    public List<FaUserUsdtTransfer> selectFaUserUsdtTransferList(FaUserUsdtTransfer faUserUsdtTransfer);

    /**
     * 新增USDT提币
     * 
     * @param faUserUsdtTransfer USDT提币
     * @return 结果
     */
    public int insertFaUserUsdtTransfer(FaUserUsdtTransfer faUserUsdtTransfer);

    /**
     * 修改USDT提币
     * 
     * @param faUserUsdtTransfer USDT提币
     * @return 结果
     */
    public int updateFaUserUsdtTransfer(FaUserUsdtTransfer faUserUsdtTransfer);

    /**
     * 删除USDT提币
     * 
     * @param id USDT提币ID
     * @return 结果
     */
    public int deleteFaUserUsdtTransferById(Long id);

    /**
     * 批量删除USDT提币
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteFaUserUsdtTransferByIds(String[] ids);
}
