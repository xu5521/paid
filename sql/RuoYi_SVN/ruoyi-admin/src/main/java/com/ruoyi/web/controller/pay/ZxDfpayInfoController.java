package com.ruoyi.web.controller.pay;

import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.domain.ZxDfpayInfo;
import com.ruoyi.system.service.IZxDfpayInfoService;
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
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;

import java.io.File;
import java.util.List;

/**
 * 代付通道信息Controller
 * 
 * @author ruoyi
 * @date 2021-12-03
 */
@Controller
@RequestMapping("/us/info")
public class ZxDfpayInfoController extends BaseController
{
    private String prefix = "info";

    @Autowired
    private IZxDfpayInfoService zxDfpayInfoService;

    @RequiresPermissions("us:info:view")
    @GetMapping()
    public String info()
    {
        return prefix + "/info";
    }

    /**
     * 查询代付通道信息列表
     */
    @RequiresPermissions("us:info:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(ZxDfpayInfo zxDfpayInfo)
    {
        startPage();
        List<ZxDfpayInfo> list = zxDfpayInfoService.selectZxDfpayInfoList(zxDfpayInfo);
        return getDataTable(list);
    }

    /**
     * 导出代付通道信息列表
     */
    @RequiresPermissions("us:info:export")
    @Log(title = "代付通道信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(ZxDfpayInfo zxDfpayInfo)
    {
        List<ZxDfpayInfo> list = zxDfpayInfoService.selectZxDfpayInfoList(zxDfpayInfo);
        ExcelUtil<ZxDfpayInfo> util = new ExcelUtil<ZxDfpayInfo>(ZxDfpayInfo.class);
        return util.exportExcel(list, "info");
    }

    /**
     * 新增代付通道信息
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存代付通道信息
     */
    @RequiresPermissions("us:info:add")
    @Log(title = "代付通道信息", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(ZxDfpayInfo zxDfpayInfo)
    {
        return toAjax(zxDfpayInfoService.insertZxDfpayInfo(zxDfpayInfo));
    }

    /**
     * 修改代付通道信息
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        ZxDfpayInfo zxDfpayInfo = zxDfpayInfoService.selectZxDfpayInfoById(id);
        mmap.put("zxDfpayInfo", zxDfpayInfo);
        return prefix + "/edit";
    }

    /**
     * 修改保存代付通道信息
     */
    @RequiresPermissions("us:info:edit")
    @Log(title = "代付通道信息", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(ZxDfpayInfo zxDfpayInfo)
    {
        return toAjax(zxDfpayInfoService.updateZxDfpayInfo(zxDfpayInfo));
    }

    /**
     * 删除代付通道信息
     */
    @RequiresPermissions("us:info:remove")
    @Log(title = "代付通道信息", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(zxDfpayInfoService.deleteZxDfpayInfoByIds(ids));
    }
}
