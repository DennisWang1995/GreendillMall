package com.greendill.greendillmall.member;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

@EnableFeignClients(basePackages = "com.greendill.greendillmall.member.feign")
@EnableDiscoveryClient
@SpringBootApplication
public class GreendillmallMemberApplication {

    public static void main(String[] args) {
        SpringApplication.run(GreendillmallMemberApplication.class, args);
    }

}
