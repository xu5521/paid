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
import com.ruoyi.us.domain.FaBankinfo;
import com.ruoyi.us.service.IFaBankinfoService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 银行管理Controller
 * 
 * @author ruoyi
 * @date 2021-12-09
 */
@Controller
@RequestMapping("/us/bankinfo")
public class FaBankinfoController extends BaseController
{
    private String prefix = "us/bankinfo";

    @Autowired
    private IFaBankinfoService faBankinfoService;

    @RequiresPermissions("us:bankinfo:view")
    @GetMapping()
    public String bankinfo()
    {
        return prefix + "/bankinfo";
    }

    /**
     * 查询银行管理列表
     */
    @RequiresPermissions("us:bankinfo:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(FaBankinfo faBankinfo)
    {
        startPage();
        List<FaBankinfo> list = faBankinfoService.selectFaBankinfoList(faBankinfo);
        return getDataTable(list);
    }

    /**
     * 导出银行管理列表
     */
    @RequiresPermissions("us:bankinfo:export")
    @Log(title = "银行管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(FaBankinfo faBankinfo)
    {
        List<FaBankinfo> list = faBankinfoService.selectFaBankinfoList(faBankinfo);
        ExcelUtil<FaBankinfo> util = new ExcelUtil<FaBankinfo>(FaBankinfo.class);
        return util.exportExcel(list, "bankinfo");
    }

    /**
     * 新增银行管理
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存银行管理
     */
    @RequiresPermissions("us:bankinfo:add")
    @Log(title = "银行管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(FaBankinfo faBankinfo)
    {
        return toAjax(faBankinfoService.insertFaBankinfo(faBankinfo));
    }

    /**
     * 修改银行管理
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        FaBankinfo faBankinfo = faBankinfoService.selectFaBankinfoById(id);
        mmap.put("faBankinfo", faBankinfo);
        return prefix + "/edit";
    }

    /**
     * 修改保存银行管理
     */
    @RequiresPermissions("us:bankinfo:edit")
    @Log(title = "银行管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(FaBankinfo faBankinfo)
    {
        return toAjax(faBankinfoService.updateFaBankinfo(faBankinfo));
    }

    /**
     * 删除银行管理
     */
    @RequiresPermissions("us:bankinfo:remove")
    @Log(title = "银行管理", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(faBankinfoService.deleteFaBankinfoByIds(ids));
    }
}
