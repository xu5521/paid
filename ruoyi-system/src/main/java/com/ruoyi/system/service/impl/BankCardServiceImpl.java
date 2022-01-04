package com.ruoyi.us.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.us.mapper.BankCardMapper;
import com.ruoyi.us.domain.BankCard;
import com.ruoyi.us.service.IBankCardService;
import com.ruoyi.common.core.text.Convert;

/**
 * 银行卡管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-11-11
 */
@Service
public class BankCardServiceImpl implements IBankCardService 
{
    @Autowired
    private BankCardMapper bankCardMapper;

    /**
     * 查询银行卡管理
     * 
     * @param id 银行卡管理ID
     * @return 银行卡管理
     */
    @Override
    public BankCard selectBankCardById(Long id)
    {
        return bankCardMapper.selectBankCardById(id);
    }

    /**
     * 查询银行卡管理列表
     * 
     * @param bankCard 银行卡管理
     * @return 银行卡管理
     */
    @Override
    public List<BankCard> selectBankCardList(BankCard bankCard)
    {
        return bankCardMapper.selectBankCardList(bankCard);
    }

    /**
     * 新增银行卡管理
     * 
     * @param bankCard 银行卡管理
     * @return 结果
     */
    @Override
    public int insertBankCard(BankCard bankCard)
    {
        bankCard.setCreateTime(DateUtils.getNowDate());
        return bankCardMapper.insertBankCard(bankCard);
    }

    /**
     * 修改银行卡管理
     * 
     * @param bankCard 银行卡管理
     * @return 结果
     */
    @Override
    public int updateBankCard(BankCard bankCard)
    {
        bankCard.setUpdateTime(DateUtils.getNowDate());
        return bankCardMapper.updateBankCard(bankCard);
    }

    /**
     * 删除银行卡管理对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteBankCardByIds(String ids)
    {
        return bankCardMapper.deleteBankCardByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除银行卡管理信息
     * 
     * @param id 银行卡管理ID
     * @return 结果
     */
    @Override
    public int deleteBankCardById(Long id)
    {
        return bankCardMapper.deleteBankCardById(id);
    }
}
