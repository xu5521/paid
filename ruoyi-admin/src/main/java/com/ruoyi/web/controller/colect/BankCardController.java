package com.ruoyi.us.controller;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.us.domain.BankCard;
import com.ruoyi.us.service.IBankCardService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 银行卡管理Controller
 * 
 * @author ruoyi
 * @date 2020-11-11
 */
@Controller
@RequestMapping("/us/card")
public class BankCardController extends BaseController
{
    private String prefix = "us/card";

    @Autowired
    private IBankCardService bankCardService;

    @RequiresPermissions("us:card:view")
    @GetMapping()
    public String card()
    {
        return prefix + "/card";
    }

    /**
     * 查询银行卡管理列表
     */
    @RequiresPermissions("us:card:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(BankCard bankCard)
    {
        startPage();
        List<BankCard> list = bankCardService.selectBankCardList(bankCard);
        return getDataTable(list);
    }

    /**
     * 导出银行卡管理列表
     */
    @RequiresPermissions("us:card:export")
    @Log(title = "银行卡管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(BankCard bankCard)
    {
        List<BankCard> list = bankCardService.selectBankCardList(bankCard);
        ExcelUtil<BankCard> util = new ExcelUtil<BankCard>(BankCard.class);
        return util.exportExcel(list, "card");
    }

    /**
     * 新增银行卡管理
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存银行卡管理
     */
    @RequiresPermissions("us:card:add")
    @Log(title = "银行卡管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(BankCard bankCard)
    {
        return toAjax(bankCardService.insertBankCard(bankCard));
    }

    /**
     * 修改银行卡管理
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        BankCard bankCard = bankCardService.selectBankCardById(id);
        mmap.put("bankCard", bankCard);
        return prefix + "/edit";
    }

    /**
     * 修改保存银行卡管理
     */
    @RequiresPermissions("us:card:edit")
    @Log(title = "银行卡管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(BankCard bankCard)
    {
        return toAjax(bankCardService.updateBankCard(bankCard));
    }

    /**
     * 删除银行卡管理
     */
    @RequiresPermissions("us:card:remove")
    @Log(title = "银行卡管理", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(bankCardService.deleteBankCardByIds(ids));
    }
}
