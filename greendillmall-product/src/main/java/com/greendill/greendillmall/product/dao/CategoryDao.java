package com.greendill.greendillmall.product.dao;

import com.greendill.greendillmall.product.entity.CategoryEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 商品三级分类
 * 
 * @author Dennis Wang
 * @email Dennis.june@outlook.com
 * @date 2020-07-20 14:14:26
 */
@Mapper
public interface CategoryDao extends BaseMapper<CategoryEntity> {
	
}
