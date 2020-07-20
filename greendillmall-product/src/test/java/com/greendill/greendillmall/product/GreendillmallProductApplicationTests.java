package com.greendill.greendillmall.product;

import com.greendill.greendillmall.product.entity.BrandEntity;
import com.greendill.greendillmall.product.service.BrandService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class GreendillmallProductApplicationTests {

    @Autowired
    BrandService BrandService;

    @Test
    void contextLoads() {
        BrandEntity BrandEntity = new BrandEntity();
        BrandEntity.setBrandId(1L);
        BrandEntity.setDescript("1231231 ");
        //////////保存
//        BrandEntity.setName("xiao mi");
        BrandService.updateById(BrandEntity);
        System.out.println("保存成功"+BrandEntity);
    }

}
