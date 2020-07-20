package com.greendill.greendillmall.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.greendill.common.utils.PageUtils;
import com.greendill.greendillmall.product.entity.CommentReplayEntity;

import java.util.Map;

/**
 * 商品评价回复关系
 *
 * @author Dennis Wang
 * @email Dennis.june@outlook.com
 * @date 2020-07-20 14:20:54
 */
public interface CommentReplayService extends IService<CommentReplayEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

