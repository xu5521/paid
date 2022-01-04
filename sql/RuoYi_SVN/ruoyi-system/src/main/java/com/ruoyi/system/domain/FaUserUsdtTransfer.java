package com.ruoyi.system.domain;

import java.math.BigDecimal;
import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * USDT提币对象 fa_user_usdt_transfer
 * 
 * @author ruoyi
 * @date 2021-12-06
 */
public class FaUserUsdtTransfer extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /**  */
    private Long id;

    /**  */
    @Excel(name = "")
    private Long userId;

    /**  */
    @Excel(name = "")
    private BigDecimal num;

    /** 提现手续费 */
    @Excel(name = "提现手续费")
    private BigDecimal fee;

    /** 地址 */
    @Excel(name = "地址")
    private String address;

    /** 驳回原因 */
    @Excel(name = "驳回原因")
    private String reason;

    /** 审核状态:0=审核中,-1=驳回,1=等待确认数,2=已完成 3 线下支付 4 代付成功不出款 */
    @Excel(name = "审核状态:0=审核中,-1=驳回,1=等待确认数,2=已完成 3 线下支付 4 代付成功不出款")
    private Integer status;

    /**  */
    @Excel(name = "")
    private String orderId;

    /**  */
    @Excel(name = "")
    private Long dfpayid;

    /**  */
    @Excel(name = "")
    private String outOrderId;

    /**  */
    @Excel(name = "")
    private String name;

    /**  */
    @Excel(name = "")
    private String account;

    /**  */
    @Excel(name = "")
    private String bankname;

    /**  */
    @Excel(name = "")
    private String bankarea;

    /**  */
    @Excel(name = "")
    private String tradeNo;

    /**  */
    @Excel(name = "")
    private String bankCode;

    /**  */
    @Excel(name = "")
    private String bankSf;

    /**  */
    @Excel(name = "")
    private String bankS;

    /**  */
    @Excel(name = "")
    private Long dftime;

    /**  */
    @Excel(name = "")
    private Integer istip;

    /** 0正常用户 1 内部 */
    @Excel(name = "0正常用户 1 内部")
    private Integer tryint;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setNum(BigDecimal num) 
    {
        this.num = num;
    }

    public BigDecimal getNum() 
    {
        return num;
    }
    public void setFee(BigDecimal fee) 
    {
        this.fee = fee;
    }

    public BigDecimal getFee() 
    {
        return fee;
    }
    public void setAddress(String address) 
    {
        this.address = address;
    }

    public String getAddress() 
    {
        return address;
    }
    public void setReason(String reason) 
    {
        this.reason = reason;
    }

    public String getReason() 
    {
        return reason;
    }
    public void setStatus(Integer status) 
    {
        this.status = status;
    }

    public Integer getStatus() 
    {
        return status;
    }
    public void setOrderId(String orderId) 
    {
        this.orderId = orderId;
    }

    public String getOrderId() 
    {
        return orderId;
    }
    public void setDfpayid(Long dfpayid) 
    {
        this.dfpayid = dfpayid;
    }

    public Long getDfpayid() 
    {
        return dfpayid;
    }
    public void setOutOrderId(String outOrderId) 
    {
        this.outOrderId = outOrderId;
    }

    public String getOutOrderId() 
    {
        return outOrderId;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setAccount(String account) 
    {
        this.account = account;
    }

    public String getAccount() 
    {
        return account;
    }
    public void setBankname(String bankname) 
    {
        this.bankname = bankname;
    }

    public String getBankname() 
    {
        return bankname;
    }
    public void setBankarea(String bankarea) 
    {
        this.bankarea = bankarea;
    }

    public String getBankarea() 
    {
        return bankarea;
    }
    public void setTradeNo(String tradeNo) 
    {
        this.tradeNo = tradeNo;
    }

    public String getTradeNo() 
    {
        return tradeNo;
    }
    public void setBankCode(String bankCode) 
    {
        this.bankCode = bankCode;
    }

    public String getBankCode() 
    {
        return bankCode;
    }
    public void setBankSf(String bankSf) 
    {
        this.bankSf = bankSf;
    }

    public String getBankSf() 
    {
        return bankSf;
    }
    public void setBankS(String bankS) 
    {
        this.bankS = bankS;
    }

    public String getBankS() 
    {
        return bankS;
    }
    public void setDftime(Long dftime) 
    {
        this.dftime = dftime;
    }

    public Long getDftime() 
    {
        return dftime;
    }
    public void setIstip(Integer istip) 
    {
        this.istip = istip;
    }

    public Integer getIstip() 
    {
        return istip;
    }
    public void setTryint(Integer tryint) 
    {
        this.tryint = tryint;
    }

    public Integer getTryint() 
    {
        return tryint;
    }
    private Date createtime;

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    private Date updatetime;
    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("num", getNum())
            .append("fee", getFee())
            .append("address", getAddress())
            .append("reason", getReason())
            .append("status", getStatus())
            .append("createtime",getCreatetime() )
            .append("updatetime", getUpdatetime())
            .append("orderId", getOrderId())
            .append("dfpayid", getDfpayid())
            .append("outOrderId", getOutOrderId())
            .append("name", getName())
            .append("account", getAccount())
            .append("bankname", getBankname())
            .append("bankarea", getBankarea())
            .append("tradeNo", getTradeNo())
            .append("bankCode", getBankCode())
            .append("bankSf", getBankSf())
            .append("bankS", getBankS())
            .append("dftime", getDftime())
            .append("istip", getIstip())
            .append("tryint", getTryint())
            .toString();
    }
}
