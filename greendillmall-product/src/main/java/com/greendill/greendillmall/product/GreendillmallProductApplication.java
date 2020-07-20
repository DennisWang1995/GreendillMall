package com.greendill.greendillmall.product;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan("com.greendill.greendillmall.product.dao")
@SpringBootApplication
public class GreendillmallProductApplication {

    public static void main(String[] args) {
        SpringApplication.run(GreendillmallProductApplication.class, args);
    }

}
