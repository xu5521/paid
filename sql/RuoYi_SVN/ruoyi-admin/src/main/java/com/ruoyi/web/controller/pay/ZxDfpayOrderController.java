package com.ruoyi.web.controller.pay;
import java.util.List;
import com.ruoyi.system.domain.FaUserUsdtTransfer;
import com.ruoyi.system.domain.ZxDfpayInfo;
import com.ruoyi.system.domain.ZxDfpayOrder;
import com.ruoyi.system.service.IFaUserUsdtTransferService;
import com.ruoyi.system.service.IZxDfpayInfoService;
import com.ruoyi.system.service.IZxDfpayOrderService;
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
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 代付订单Controller
 * 
 * @author ruoyi
 * @date 2021-12-03
 */
@Controller
@RequestMapping("/us/order")
public class ZxDfpayOrderController extends BaseController
{
    private String prefix = "order";

    @Autowired
    private IZxDfpayOrderService zxDfpayOrderService;
    @Autowired
    private IZxDfpayInfoService zxDfpayInfoService;
    @Autowired
    private IFaUserUsdtTransferService faUserUsdtTransferService;

    @RequiresPermissions("us:order:view")
    @GetMapping()
    public String order()
    {
        return prefix + "/order";
    }

    /**
     * 查询代付订单列表
     */
    @RequiresPermissions("us:order:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(ZxDfpayOrder zxDfpayOrder)
    {
        startPage();
        List<ZxDfpayOrder> list = zxDfpayOrderService.selectZxDfpayOrderList(zxDfpayOrder);
        return getDataTable(list);
    }

    /**
     * 导出代付订单列表
     */
    @RequiresPermissions("us:order:export")
    @Log(title = "代付订单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(ZxDfpayOrder zxDfpayOrder)
    {
        List<ZxDfpayOrder> list = zxDfpayOrderService.selectZxDfpayOrderList(zxDfpayOrder);
        ExcelUtil<ZxDfpayOrder> util = new ExcelUtil<ZxDfpayOrder>(ZxDfpayOrder.class);
        return util.exportExcel(list, "order");
    }

    /**
     * 新增代付订单
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存代付订单
     */
    @RequiresPermissions("us:order:add")
    @Log(title = "代付订单", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(ZxDfpayOrder zxDfpayOrder)
    {
        zxDfpayOrder.setIsNotify(0);
        ZxDfpayInfo zxDfpayInfo = zxDfpayInfoService.selectZxDfpayInfoById(zxDfpayOrder.getDfpayId());
        if (zxDfpayInfo==null){
            return  AjaxResult.error("代入通道信息错误!");
        }
        zxDfpayOrder.setDfpayName(zxDfpayInfo.getMchName());
        zxDfpayOrder.setIsSend(0);
        int insertCnt = zxDfpayOrderService.insertZxDfpayOrder(zxDfpayOrder);
        //TODO 调用四方支付通道 下单
        String orderNo = zxDfpayOrder.getOrderNo();

        return toAjax(insertCnt);
    }

    /**
     * 修改代付订单
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        ZxDfpayOrder zxDfpayOrder = zxDfpayOrderService.selectZxDfpayOrderById(id);
        //TODO 调用四方支付通道 查询
        zxDfpayOrder.setPayResult("");
        List<FaUserUsdtTransfer> list = faUserUsdtTransferService.selectFaUserUsdtTransferList(new FaUserUsdtTransfer());
        mmap.put("zxDfpayOrder", zxDfpayOrder);
        return prefix + "/edit";
    }

    /**
     * 修改保存代付订单
     */
    @RequiresPermissions("us:order:edit")
    @Log(title = "代付订单", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(ZxDfpayOrder zxDfpayOrder)
    {
        //TODO 发送代付
        ZxDfpayInfo zxDfpayInfo = zxDfpayInfoService.selectZxDfpayInfoById(zxDfpayOrder.getDfpayId());
        if (zxDfpayInfo==null){
            return  AjaxResult.error("代入通道信息错误!");
        }
        zxDfpayOrder.setDfpayName(zxDfpayInfo.getMchName());
        zxDfpayOrder.setIsSend(1);
        return toAjax(zxDfpayOrderService.updateZxDfpayOrder(zxDfpayOrder));
    }

    /**
     * 删除代付订单
     */
    @RequiresPermissions("us:order:remove")
    @Log(title = "代付订单", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(zxDfpayOrderService.deleteZxDfpayOrderByIds(ids));
    }
}
