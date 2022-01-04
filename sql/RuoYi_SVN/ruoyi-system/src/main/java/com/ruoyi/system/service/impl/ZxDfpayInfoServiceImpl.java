package com.ruoyi.system.service.impl;
import com.ruoyi.common.core.domain.entity.SysDictData;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.system.domain.ZxDfpayInfo;
import com.ruoyi.system.mapper.SysDictDataMapper;
import com.ruoyi.system.mapper.ZxDfpayInfoMapper;
import com.ruoyi.system.service.IZxDfpayInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.common.core.text.Convert;

import java.util.List;

/**
 * 代付通道信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2021-12-03
 */
@Service
public class ZxDfpayInfoServiceImpl implements IZxDfpayInfoService
{
    @Autowired
    private ZxDfpayInfoMapper zxDfpayInfoMapper;
    @Autowired
    private SysDictDataMapper sysDictDataMapper;

    /**
     * 查询代付通道信息
     * 
     * @param id 代付通道信息ID
     * @return 代付通道信息
     */
    @Override
    public ZxDfpayInfo selectZxDfpayInfoById(Long id)
    {
        return zxDfpayInfoMapper.selectZxDfpayInfoById(id);
    }

    /**
     * 查询代付通道信息列表
     * 
     * @param zxDfpayInfo 代付通道信息
     * @return 代付通道信息
     */
    @Override
    public List<ZxDfpayInfo> selectZxDfpayInfoList(ZxDfpayInfo zxDfpayInfo)
    {
        return zxDfpayInfoMapper.selectZxDfpayInfoList(zxDfpayInfo);
    }

    /**
     * 新增代付通道信息
     * 
     * @param zxDfpayInfo 代付通道信息
     * @return 结果
     */
    @Override
    public int insertZxDfpayInfo(ZxDfpayInfo zxDfpayInfo)
    {
        zxDfpayInfo.setCreateTime(DateUtils.getNowDate());
        int insertCnt = zxDfpayInfoMapper.insertZxDfpayInfo(zxDfpayInfo);
        if (zxDfpayInfo.getIsUse()==0){
            SysDictData sysDictData = new SysDictData();
            sysDictData.setDictType("dfpay_name");
            sysDictData.setDictLabel(zxDfpayInfo.getMchName());
            sysDictData.setDictValue(zxDfpayInfo.getId().toString());
            sysDictData.setStatus("0");
            sysDictData.setIsDefault("N");
            sysDictDataMapper.insertDictData(sysDictData);
        }
        return insertCnt;
    }

    /**
     * 修改代付通道信息
     * 
     * @param zxDfpayInfo 代付通道信息
     * @return 结果
     */
    @Override
    public int updateZxDfpayInfo(ZxDfpayInfo zxDfpayInfo)
    {
        ZxDfpayInfo old = zxDfpayInfoMapper.selectZxDfpayInfoById(zxDfpayInfo.getId());
        if (old.getIsUse()!=zxDfpayInfo.getIsUse()){
            if (zxDfpayInfo.getIsUse()==0){
                SysDictData sysDictData = new SysDictData();
                sysDictData.setDictType("dfpay_name");
                sysDictData.setDictLabel(zxDfpayInfo.getMchName());
                sysDictData.setDictValue(zxDfpayInfo.getId().toString());
                sysDictData.setStatus("0");
                sysDictData.setIsDefault("N");
                sysDictDataMapper.insertDictData(sysDictData);
            }else {
                Long dicId = sysDictDataMapper.selectDictDataCode("dfpay_name",zxDfpayInfo.getId().toString());
                String[] ids = {dicId.toString()};
                sysDictDataMapper.deleteDictDataByIds(ids);
            }
        }
        zxDfpayInfo.setUpdateTime(DateUtils.getNowDate());
        int updateCnt = zxDfpayInfoMapper.updateZxDfpayInfo(zxDfpayInfo);

        return updateCnt;
    }

    /**
     * 删除代付通道信息对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteZxDfpayInfoByIds(String ids)
    {
        return zxDfpayInfoMapper.deleteZxDfpayInfoByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除代付通道信息信息
     * 
     * @param id 代付通道信息ID
     * @return 结果
     */
    @Override
    public int deleteZxDfpayInfoById(Long id)
    {
        return zxDfpayInfoMapper.deleteZxDfpayInfoById(id);
    }
}
