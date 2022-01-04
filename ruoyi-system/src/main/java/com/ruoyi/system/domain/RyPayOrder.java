package com.ruoyi.us.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 入账单管理对象 ry_pay_order
 * 
 * @author ruoyi
 * @date 2020-11-11
 */
public class RyPayOrder extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 银行卡ID */
    private String bankId;

    /** 收款单号 */
    @Excel(name = "收款单号")
    private String orderNo;

    /** 转账凭证 */
    @Excel(name = "转账凭证")
    private String transferVouchUrl;

    /** 转账金额 */
    @Excel(name = "转账金额")
    private String money;

    /** 平台会员账号 */
    @Excel(name = "平台会员账号")
    private String plaftUserName;

    /** 平台会员昵称 */
    @Excel(name = "平台会员昵称")
    private String plaftNickName;

    /** 到账状态 0--待确认 1--已入账 */
    @Excel(name = "到账状态 0--待确认 1--已入账")
    private String state;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setBankId(String bankId) 
    {
        this.bankId = bankId;
    }

    public String getBankId() 
    {
        return bankId;
    }
    public void setOrderNo(String orderNo) 
    {
        this.orderNo = orderNo;
    }

    public String getOrderNo() 
    {
        return orderNo;
    }
    public void setTransferVouchUrl(String transferVouchUrl) 
    {
        this.transferVouchUrl = transferVouchUrl;
    }

    public String getTransferVouchUrl() 
    {
        return transferVouchUrl;
    }
    public void setMoney(String money) 
    {
        this.money = money;
    }

    public String getMoney() 
    {
        return money;
    }
    public void setPlaftUserName(String plaftUserName) 
    {
        this.plaftUserName = plaftUserName;
    }

    public String getPlaftUserName() 
    {
        return plaftUserName;
    }
    public void setPlaftNickName(String plaftNickName) 
    {
        this.plaftNickName = plaftNickName;
    }

    public String getPlaftNickName() 
    {
        return plaftNickName;
    }
    public void setState(String state) 
    {
        this.state = state;
    }

    public String getState() 
    {
        return state;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("bankId", getBankId())
            .append("orderNo", getOrderNo())
            .append("transferVouchUrl", getTransferVouchUrl())
            .append("money", getMoney())
            .append("plaftUserName", getPlaftUserName())
            .append("plaftNickName", getPlaftNickName())
            .append("state", getState())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
