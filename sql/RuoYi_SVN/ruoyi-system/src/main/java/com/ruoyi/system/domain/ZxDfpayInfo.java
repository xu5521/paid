package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 代付通道信息对象 zx_dfpay_info
 * 
 * @author ruoyi
 * @date 2021-12-03
 */
public class ZxDfpayInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /**  */
    private Long id;

    /** 商户号 */
    @Excel(name = "商户号")
    private String mchId;

    /** 代付平台名称 */
    @Excel(name = "代付平台名称")
    private String mchName;


    /** 商户编号2 */
    @Excel(name = "商户编号2")
    private String mchId2;

    /** 接口地址 */
    private String apiUrl;

    /** 商户KEY */
    @Excel(name = "商户KEY")
    private String mchKey;

    /** 商户秘钥 */
    @Excel(name = "商户秘钥")
    private String secret;

    /** 异步回调地址 */
    private String notifyUrl;

    /** 是否启用 */
    @Excel(name = "是否启用")
    private Integer isUse;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setMchId(String mchId) 
    {
        this.mchId = mchId;
    }

    public String getMchId() 
    {
        return mchId;
    }
    public void setMchName(String mchName) 
    {
        this.mchName = mchName;
    }

    public String getMchName() 
    {
        return mchName;
    }
    public void setMchId2(String mchId2) 
    {
        this.mchId2 = mchId2;
    }

    public String getMchId2() 
    {
        return mchId2;
    }
    public void setApiUrl(String apiUrl) 
    {
        this.apiUrl = apiUrl;
    }

    public String getApiUrl() 
    {
        return apiUrl;
    }
    public void setSecret(String secret) 
    {
        this.secret = secret;
    }

    public String getSecret() 
    {
        return secret;
    }
    public void setNotifyUrl(String notifyUrl) 
    {
        this.notifyUrl = notifyUrl;
    }

    public String getNotifyUrl() 
    {
        return notifyUrl;
    }
    public void setIsUse(Integer isUse)
    {
        this.isUse = isUse;
    }

    public Integer getIsUse()
    {
        return isUse;
    }
    public String getMchKey() {
        return mchKey;
    }

    public void setMchKey(String mchKey) {
        this.mchKey = mchKey;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("mchId", getMchId())
            .append("mchName", getMchName())
            .append("mchId2", getMchId2())
            .append("apiUrl", getApiUrl())
            .append("mchKey", getMchKey())
            .append("secret", getSecret())
            .append("notifyUrl", getNotifyUrl())
            .append("isUse", getIsUse())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
