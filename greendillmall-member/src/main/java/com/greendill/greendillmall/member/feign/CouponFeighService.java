package com.greendill.greendillmall.member.feign;

import com.greendill.common.utils.R;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Arrays;

@FeignClient("greendillmall-coupon")
public interface CouponFeighService {
    @RequestMapping("/coupon/smscoupon/member/list")
    public R Coupons();
}
