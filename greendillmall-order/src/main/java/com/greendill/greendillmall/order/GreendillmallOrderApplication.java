package com.greendill.greendillmall.order;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@EnableDiscoveryClient
@SpringBootApplication
public class GreendillmallOrderApplication {

    public static void main(String[] args) {
        SpringApplication.run(GreendillmallOrderApplication.class, args);
    }

}
