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
import com.ruoyi.us.domain.RyPayOrder;
import com.ruoyi.us.service.IRyPayOrderService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 入账单管理Controller
 * 
 * @author ruoyi
 * @date 2020-11-11
 */
@Controller
@RequestMapping("/us/order")
public class RyPayOrderController extends BaseController
{
    private String prefix = "us/order";

    @Autowired
    private IRyPayOrderService ryPayOrderService;

    @RequiresPermissions("us:order:view")
    @GetMapping()
    public String order()
    {
        return prefix + "/order";
    }

    /**
     * 查询入账单管理列表
     */
    @RequiresPermissions("us:order:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(RyPayOrder ryPayOrder)
    {
        startPage();
        List<RyPayOrder> list = ryPayOrderService.selectRyPayOrderList(ryPayOrder);
        return getDataTable(list);
    }

    /**
     * 导出入账单管理列表
     */
    @RequiresPermissions("us:order:export")
    @Log(title = "入账单管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(RyPayOrder ryPayOrder)
    {
        List<RyPayOrder> list = ryPayOrderService.selectRyPayOrderList(ryPayOrder);
        ExcelUtil<RyPayOrder> util = new ExcelUtil<RyPayOrder>(RyPayOrder.class);
        return util.exportExcel(list, "order");
    }

    /**
     * 新增入账单管理
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存入账单管理
     */
    @RequiresPermissions("us:order:add")
    @Log(title = "入账单管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(RyPayOrder ryPayOrder)
    {
        return toAjax(ryPayOrderService.insertRyPayOrder(ryPayOrder));
    }

    /**
     * 修改入账单管理
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        RyPayOrder ryPayOrder = ryPayOrderService.selectRyPayOrderById(id);
        mmap.put("ryPayOrder", ryPayOrder);
        return prefix + "/edit";
    }

    /**
     * 修改保存入账单管理
     */
    @RequiresPermissions("us:order:edit")
    @Log(title = "入账单管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(RyPayOrder ryPayOrder)
    {
        return toAjax(ryPayOrderService.updateRyPayOrder(ryPayOrder));
    }

    /**
     * 删除入账单管理
     */
    @RequiresPermissions("us:order:remove")
    @Log(title = "入账单管理", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(ryPayOrderService.deleteRyPayOrderByIds(ids));
    }
}
