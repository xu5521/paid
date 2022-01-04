package com.ruoyi.us.service;

import java.util.List;
import com.ruoyi.us.domain.BankCard;

/**
 * 银行卡管理Service接口
 * 
 * @author ruoyi
 * @date 2020-11-11
 */
public interface IBankCardService 
{
    /**
     * 查询银行卡管理
     * 
     * @param id 银行卡管理ID
     * @return 银行卡管理
     */
    public BankCard selectBankCardById(Long id);

    /**
     * 查询银行卡管理列表
     * 
     * @param bankCard 银行卡管理
     * @return 银行卡管理集合
     */
    public List<BankCard> selectBankCardList(BankCard bankCard);

    /**
     * 新增银行卡管理
     * 
     * @param bankCard 银行卡管理
     * @return 结果
     */
    public int insertBankCard(BankCard bankCard);

    /**
     * 修改银行卡管理
     * 
     * @param bankCard 银行卡管理
     * @return 结果
     */
    public int updateBankCard(BankCard bankCard);

    /**
     * 批量删除银行卡管理
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteBankCardByIds(String ids);

    /**
     * 删除银行卡管理信息
     * 
     * @param id 银行卡管理ID
     * @return 结果
     */
    public int deleteBankCardById(Long id);
}
