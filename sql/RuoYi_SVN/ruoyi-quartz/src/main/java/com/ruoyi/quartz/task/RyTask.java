package com.ruoyi.quartz.task;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.system.domain.FaUserUsdtTransfer;
import com.ruoyi.system.domain.ZxDfpayOrder;
import com.ruoyi.system.service.IFaUserUsdtTransferService;
import com.ruoyi.system.service.IZxDfpayOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Component;
import com.ruoyi.common.utils.StringUtils;

import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * 定时任务调度测试
 * 
 * @author ruoyi
 */
@Component("ryTask")
public class RyTask
{
    @Autowired
    private IZxDfpayOrderService zxDfpayOrderService;
    @Autowired
    private IFaUserUsdtTransferService faUserUsdtTransferService;

    public void ryMultipleParams(String s, Boolean b, Long l, Double d, Integer i)
    {
        System.out.println(StringUtils.format("执行多参方法： 字符串类型{}，布尔类型{}，长整型{}，浮点型{}，整形{}", s, b, l, d, i));
    }

    public void ryParams(String params)
    {
        System.out.println("执行有参方法：" + params);
    }

    public void ryNoParams()
    {
        System.out.println("执行无参方法");
    }

    public void test(){

    }
    public void rySynchronizedData()
    {
        System.out.println("同步数据开始:"+ DateUtils.dateTimeNow(DateUtils.YYYY_MM_DD_HH_MM_SS));
        List<FaUserUsdtTransfer> list = faUserUsdtTransferService.selectFaUserUsdtTransferList(new FaUserUsdtTransfer());
        AtomicInteger totalSyn = new AtomicInteger(0);
        list.stream().forEach(trans->{
            try {
                ZxDfpayOrder zxDfpayOrder;
                zxDfpayOrder = new ZxDfpayOrder();
                zxDfpayOrder.setIsNotify(0);
                zxDfpayOrder.setIsNotify(0);
                zxDfpayOrder.setDfpayName("");
                zxDfpayOrder.setDfpayId(0l);
                zxDfpayOrder.setPayResult("");
                zxDfpayOrder.setCreateTime(trans.getCreatetime());
                zxDfpayOrder.setBank(trans.getBankname());
                zxDfpayOrder.setMoney(trans.getNum().doubleValue());
                zxDfpayOrder.setBankCard(trans.getAccount());
                zxDfpayOrder.setOpenBank(trans.getBankarea());
                zxDfpayOrder.setRelalName(trans.getName());
                zxDfpayOrder.setOrderNo(trans.getOrderId());
                zxDfpayOrder.setPayStatus(0);
                zxDfpayOrder.setPanStatus(trans.getStatus());
                zxDfpayOrder.setIsSend(0);
                zxDfpayOrder.setBankCode(trans.getBankCode());
                int cnt = zxDfpayOrderService.insertZxDfpayOrder(zxDfpayOrder);
                if (cnt>0)
                    totalSyn.addAndGet(1);
            }catch (DuplicateKeyException e){
                e.printStackTrace();
            }
        });
        System.out.println("同步数据结束:成功"+totalSyn.intValue()+"条");
    }
}
