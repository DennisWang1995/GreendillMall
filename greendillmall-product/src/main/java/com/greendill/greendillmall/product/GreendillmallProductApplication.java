package com.greendill.greendillmall.product;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@MapperScan("com.greendill.greendillmall.product.dao")
@EnableDiscoveryClient
@SpringBootApplication
public class GreendillmallProductApplication {

    public static void main(String[] args) {
        SpringApplication.run(GreendillmallProductApplication.class, args);
    }

}
