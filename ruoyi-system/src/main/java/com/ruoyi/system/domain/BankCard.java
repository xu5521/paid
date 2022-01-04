package com.ruoyi.system.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 银行卡管理对象 ry_bank_card
 * 
 * @author ruoyi
 * @date 2020-11-11
 */
public class BankCard extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /**  */
    private Long id;

    /** 银行名称 */
    @Excel(name = "银行名称")
    private String bankName;

    /** 银行卡号 */
    @Excel(name = "银行卡号")
    private String bankCardNo;

    /** 银行卡图片 */
    @Excel(name = "银行卡图片")
    private String bankCardImg;

    /** 持卡人姓名 */
    @Excel(name = "持卡人姓名")
    private String handUserName;

    /** 开户行地址 */
    @Excel(name = "开户行地址")
    private String openBankAddress;

    /** 今日已收款金额 */
    @Excel(name = "今日已收款金额")
    private BigDecimal todayCollectMoney;

    /** 每日最高收款金额 */
    @Excel(name = "每日最高收款金额")
    private Long taotalColletcQuato;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setBankName(String bankName) 
    {
        this.bankName = bankName;
    }

    public String getBankName() 
    {
        return bankName;
    }
    public void setBankCardNo(String bankCardNo) 
    {
        this.bankCardNo = bankCardNo;
    }

    public String getBankCardNo() 
    {
        return bankCardNo;
    }
    public void setBankCardImg(String bankCardImg) 
    {
        this.bankCardImg = bankCardImg;
    }

    public String getBankCardImg() 
    {
        return bankCardImg;
    }
    public void setHandUserName(String handUserName) 
    {
        this.handUserName = handUserName;
    }

    public String getHandUserName() 
    {
        return handUserName;
    }
    public void setOpenBankAddress(String openBankAddress) 
    {
        this.openBankAddress = openBankAddress;
    }

    public String getOpenBankAddress() 
    {
        return openBankAddress;
    }
    public void setTodayCollectMoney(BigDecimal todayCollectMoney) 
    {
        this.todayCollectMoney = todayCollectMoney;
    }

    public BigDecimal getTodayCollectMoney() 
    {
        return todayCollectMoney;
    }
    public void setTaotalColletcQuato(Long taotalColletcQuato) 
    {
        this.taotalColletcQuato = taotalColletcQuato;
    }

    public Long getTaotalColletcQuato() 
    {
        return taotalColletcQuato;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("bankName", getBankName())
            .append("bankCardNo", getBankCardNo())
            .append("bankCardImg", getBankCardImg())
            .append("handUserName", getHandUserName())
            .append("openBankAddress", getOpenBankAddress())
            .append("todayCollectMoney", getTodayCollectMoney())
            .append("taotalColletcQuato", getTaotalColletcQuato())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
