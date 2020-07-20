package com.greendill.greendillmall.member;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@EnableDiscoveryClient
@SpringBootApplication
public class GreendillmallMemberApplication {

    public static void main(String[] args) {
        SpringApplication.run(GreendillmallMemberApplication.class, args);
    }

}
