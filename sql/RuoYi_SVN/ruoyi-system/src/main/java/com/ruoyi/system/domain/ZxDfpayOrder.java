package com.ruoyi.system.domain;

import java.util.Date;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 代付订单对象 zx_dfpay_order
 * 
 * @author ruoyi
 * @date 2021-12-03
 */
public class ZxDfpayOrder extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 订单ID */
    private Long id;

    /** 通道ID */
    private Long dfpayId;

    /** 通道名称 */
    @Excel(name = "通道名称")
    private String dfpayName;

    /** 订单号 */
    @Excel(name = "订单号")
    private String orderNo;

    /** 代付金额 */
    @Excel(name = "代付金额")
    private Double money;

    /** 姓名 */
    @Excel(name = "姓名")
    private String relalName;

    /** 银行卡号 */
    @Excel(name = "银行卡号")
    private String bankCard;

    /** 银行名称 */
    @Excel(name = "银行名称")
    private String bank;

    /** 开户行 */
    @Excel(name = "开户行")
    private String openBank;

    /** 打款时间 */
    @Excel(name = "打款时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date payTime;

    /** 支付状态 */
    @Excel(name = "支付状态")
    private Integer payStatus;


    /** 四方支付状态 */
    @Excel(name = "四方支付状态")
    private String payResult;
    /** 通知状态 */
    @Excel(name = "通知状态")
    private Integer isNotify;

    /** 盘口名称 */
    @Excel(name = "盘口名称")
    private String panName;

    public Integer getPanStatus() {
        return panStatus;
    }

    public void setPanStatus(Integer panStatus) {
        this.panStatus = panStatus;
    }

    /** 盘口名称 */
    @Excel(name = "盘口订单状态")
    private Integer panStatus;

    /**
     * 是否发送代付
     */
    private Integer isSend;



    /**
     * 银行编码
     */
    private String bankCode;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setDfpayId(Long dfpayId) 
    {
        this.dfpayId = dfpayId;
    }

    public Long getDfpayId() 
    {
        return dfpayId;
    }
    public void setDfpayName(String dfpayName) 
    {
        this.dfpayName = dfpayName;
    }

    public String getDfpayName() 
    {
        return dfpayName;
    }
    public void setOrderNo(String orderNo) 
    {
        this.orderNo = orderNo;
    }

    public String getOrderNo() 
    {
        return orderNo;
    }
    public void setMoney(Double money)
    {
        this.money = money;
    }

    public Double getMoney()
    {
        return money;
    }
    public void setRelalName(String relalName) 
    {
        this.relalName = relalName;
    }

    public String getRelalName() 
    {
        return relalName;
    }
    public void setBankCard(String bankCard) 
    {
        this.bankCard = bankCard;
    }

    public String getBankCard() 
    {
        return bankCard;
    }
    public void setBank(String bank) 
    {
        this.bank = bank;
    }

    public String getBank() 
    {
        return bank;
    }
    public void setOpenBank(String openBank) 
    {
        this.openBank = openBank;
    }

    public String getOpenBank() 
    {
        return openBank;
    }
    public void setPayTime(Date payTime) 
    {
        this.payTime = payTime;
    }

    public Date getPayTime() 
    {
        return payTime;
    }
    public void setPayStatus(Integer payStatus) 
    {
        this.payStatus = payStatus;
    }

    public Integer getPayStatus() 
    {
        return payStatus;
    }
    public String getPayResult() {
        return payResult;
    }

    public void setPayResult(String payResult) {
        this.payResult = payResult;
    }

    public Integer getIsNotify() {
        return isNotify;
    }

    public void setIsNotify(Integer isNotify) {
        this.isNotify = isNotify;
    }

    public String getPanName() {
        return panName;
    }

    public void setPanName(String panName) {
        this.panName = panName;
    }
    public Integer getIsSend() {
        return isSend;
    }

    public void setIsSend(Integer isSend) {
        this.isSend = isSend;
    }
    public String getBankCode() {
        return bankCode;
    }

    public void setBankCode(String bankCode) {
        this.bankCode = bankCode;
    }
    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("dfpayId", getDfpayId())
            .append("dfpayName", getDfpayName())
            .append("orderNo", getOrderNo())
            .append("money", getMoney())
            .append("relalName", getRelalName())
            .append("bankCard", getBankCard())
            .append("bank", getBank())
            .append("openBank", getOpenBank())
            .append("payTime", getPayTime())
            .append("payStatus", getPayStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("payResult", getPayResult())
            .append("panName", getPanName())
            .append("isNotify", getIsNotify())
            .append("remark", getRemark())
            .append("panStatus",getPayStatus())
                .append("isSend",getIsSend())
                .append("bankCode",getBankCode())
            .toString();
    }
}
