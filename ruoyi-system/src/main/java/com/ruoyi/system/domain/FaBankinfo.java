package com.ruoyi.us.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 银行管理对象 fa_bankinfo
 * 
 * @author ruoyi
 * @date 2021-12-09
 */
public class FaBankinfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 银行编码 */
    @Excel(name = "银行编码")
    private String bankcode;

    /** 银行名称 */
    @Excel(name = "银行名称")
    private String bankname;

    /** GP代付编码 */
    @Excel(name = "GP代付编码")
    private String bankcode1;

    /** 代付编码2 */
    @Excel(name = "代付编码2")
    private String bankcode2;

    /** 代付编码3 */
    @Excel(name = "代付编码3")
    private Long bankcode3;

    /** 代付编码4 */
    @Excel(name = "代付编码4")
    private String bankcode4;

    /** 代付编码5 */
    @Excel(name = "代付编码5")
    private String bankcode5;

    /** 代付编码6 */
    @Excel(name = "代付编码6")
    private String bankcode6;

    /** 代付编码7 */
    @Excel(name = "代付编码7")
    private String bankcode7;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setBankcode(String bankcode) 
    {
        this.bankcode = bankcode;
    }

    public String getBankcode() 
    {
        return bankcode;
    }
    public void setBankname(String bankname) 
    {
        this.bankname = bankname;
    }

    public String getBankname() 
    {
        return bankname;
    }
    public void setBankcode1(String bankcode1) 
    {
        this.bankcode1 = bankcode1;
    }

    public String getBankcode1() 
    {
        return bankcode1;
    }
    public void setBankcode2(String bankcode2) 
    {
        this.bankcode2 = bankcode2;
    }

    public String getBankcode2() 
    {
        return bankcode2;
    }
    public void setBankcode3(Long bankcode3) 
    {
        this.bankcode3 = bankcode3;
    }

    public Long getBankcode3() 
    {
        return bankcode3;
    }
    public void setBankcode4(String bankcode4) 
    {
        this.bankcode4 = bankcode4;
    }

    public String getBankcode4() 
    {
        return bankcode4;
    }
    public void setBankcode5(String bankcode5) 
    {
        this.bankcode5 = bankcode5;
    }

    public String getBankcode5() 
    {
        return bankcode5;
    }
    public void setBankcode6(String bankcode6) 
    {
        this.bankcode6 = bankcode6;
    }

    public String getBankcode6() 
    {
        return bankcode6;
    }
    public void setBankcode7(String bankcode7) 
    {
        this.bankcode7 = bankcode7;
    }

    public String getBankcode7() 
    {
        return bankcode7;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("bankcode", getBankcode())
            .append("bankname", getBankname())
            .append("bankcode1", getBankcode1())
            .append("bankcode2", getBankcode2())
            .append("bankcode3", getBankcode3())
            .append("bankcode4", getBankcode4())
            .append("bankcode5", getBankcode5())
            .append("bankcode6", getBankcode6())
            .append("bankcode7", getBankcode7())
            .toString();
    }
}
