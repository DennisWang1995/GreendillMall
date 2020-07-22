package com.greendill.greendillmall.gateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;


@EnableDiscoveryClient //开启网关的注册与发现功能
@SpringBootApplication
public class GreendillmallGateApplication {

    public static void main(String[] args) {
        SpringApplication.run(GreendillmallGateApplication.class, args);
    }

}
