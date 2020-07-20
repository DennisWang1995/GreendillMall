package com.greendill.greendillmall.coupon;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

//开启注册服务与发现功能
@EnableDiscoveryClient
@SpringBootApplication
public class GreendillmallCouponApplication {

    public static void main(String[] args) {
        SpringApplication.run(GreendillmallCouponApplication.class, args);
    }

}
