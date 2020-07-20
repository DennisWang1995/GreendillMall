package com.greendill.greendillmall.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.greendill.common.utils.PageUtils;
import com.greendill.greendillmall.product.entity.SpuCommentEntity;

import java.util.Map;

/**
 * 商品评价
 *
 * @author Dennis Wang
 * @email Dennis.june@outlook.com
 * @date 2020-07-20 14:20:54
 */
public interface SpuCommentService extends IService<SpuCommentEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

