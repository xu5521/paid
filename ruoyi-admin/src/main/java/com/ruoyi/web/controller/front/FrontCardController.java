package com.ruoyi.web.controller.front;

import com.ruoyi.common.core.controller.BaseController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 银行卡管理Controller
 * 
 * @author ruoyi
 * @date 2020-11-11
 */
@Controller
@RequestMapping("/front/frontCard")
public class BankCardController extends BaseController
{
    private String prefix = "frontCard";

    @RequiresPermissions("us:card:view")
    @GetMapping()
    public String frontCard()
    {
        return prefix + "/frontCard";
    }
}
