package com.ruoyi.system.service.impl;

import java.util.List;

import com.ruoyi.common.annotation.DataSource;
import com.ruoyi.common.enums.DataSourceType;
import com.ruoyi.system.domain.FaUserUsdtTransfer;
import com.ruoyi.system.mapper.FaUserUsdtTransferMapper;
import com.ruoyi.system.service.IFaUserUsdtTransferService;
import org.apache.poi.ss.usermodel.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.common.core.text.Convert;

/**
 * USDT提币Service业务层处理
 * 
 * @author ruoyi
 * @date 2021-12-06
 */
@Service
@DataSource(value = DataSourceType.SLAVE)
public class FaUserUsdtTransferServiceImpl implements IFaUserUsdtTransferService
{
    @Autowired
    private FaUserUsdtTransferMapper faUserUsdtTransferMapper;

    /**
     * 查询USDT提币
     * 
     * @param id USDT提币ID
     * @return USDT提币
     */
    @Override
    public FaUserUsdtTransfer selectFaUserUsdtTransferById(Long id)
    {
        return faUserUsdtTransferMapper.selectFaUserUsdtTransferById(id);
    }

    /**
     * 查询USDT提币列表
     * 
     * @param faUserUsdtTransfer USDT提币
     * @return USDT提币
     */
    @Override
    public List<FaUserUsdtTransfer> selectFaUserUsdtTransferList(FaUserUsdtTransfer faUserUsdtTransfer)
    {

        return faUserUsdtTransferMapper.selectFaUserUsdtTransferList(faUserUsdtTransfer);
    }

    /**
     * 新增USDT提币
     * 
     * @param faUserUsdtTransfer USDT提币
     * @return 结果
     */
    @Override
    public int insertFaUserUsdtTransfer(FaUserUsdtTransfer faUserUsdtTransfer)
    {
        return faUserUsdtTransferMapper.insertFaUserUsdtTransfer(faUserUsdtTransfer);
    }

    /**
     * 修改USDT提币
     * 
     * @param faUserUsdtTransfer USDT提币
     * @return 结果
     */
    @Override
    public int updateFaUserUsdtTransfer(FaUserUsdtTransfer faUserUsdtTransfer)
    {
        return faUserUsdtTransferMapper.updateFaUserUsdtTransfer(faUserUsdtTransfer);
    }

    /**
     * 删除USDT提币对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteFaUserUsdtTransferByIds(String ids)
    {
        return faUserUsdtTransferMapper.deleteFaUserUsdtTransferByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除USDT提币信息
     * 
     * @param id USDT提币ID
     * @return 结果
     */
    @Override
    public int deleteFaUserUsdtTransferById(Long id)
    {
        return faUserUsdtTransferMapper.deleteFaUserUsdtTransferById(id);
    }
}
