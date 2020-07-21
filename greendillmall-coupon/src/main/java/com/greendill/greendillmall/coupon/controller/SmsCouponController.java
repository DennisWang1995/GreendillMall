package com.greendill.greendillmall.coupon.controller;

import java.util.Arrays;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.greendill.greendillmall.coupon.entity.SmsCouponEntity;
import com.greendill.greendillmall.coupon.service.SmsCouponService;
import com.greendill.common.utils.PageUtils;
import com.greendill.common.utils.R;



/**
 * 优惠券信息
 *
 * @author Dennis Wang
 * @email Dennis.june@outlook.com
 * @date 2020-07-20 16:13:07
 */
@RefreshScope
@RestController
@RequestMapping("coupon/smscoupon")
public class SmsCouponController {
    @Autowired
    private SmsCouponService smsCouponService;

    @Value("${users.name}")
    private String name;
    @Value("${users.age}")
    private Integer age;

    @RequestMapping("/test")
    public R test(){
        return R.ok().put("name",name).put("age",age);
    }
    @RequestMapping("/member/list")
    public R Coupons(){
        SmsCouponEntity SmsCouponEntity = new SmsCouponEntity();
        SmsCouponEntity.setCouponName("满100减10");
        return R.ok().put("coupons",Arrays.asList(SmsCouponEntity));
    }
    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = smsCouponService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
		SmsCouponEntity smsCoupon = smsCouponService.getById(id);

        return R.ok().put("smsCoupon", smsCoupon);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody SmsCouponEntity smsCoupon){
		smsCouponService.save(smsCoupon);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody SmsCouponEntity smsCoupon){
		smsCouponService.updateById(smsCoupon);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
		smsCouponService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
