package com.greendill.greendillmall.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.greendill.common.utils.PageUtils;
import com.greendill.greendillmall.product.entity.CategoryEntity;

import java.util.Map;

/**
 * 商品三级分类
 *
 * @author Dennis Wang
 * @email Dennis.june@outlook.com
 * @date 2020-07-20 14:14:26
 */
public interface CategoryService extends IService<CategoryEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

