package com.greendill.greendillmall.ware;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@EnableDiscoveryClient
@SpringBootApplication
public class GreendillmallWareApplication {

    public static void main(String[] args) {
        SpringApplication.run(GreendillmallWareApplication.class, args);
    }

}
