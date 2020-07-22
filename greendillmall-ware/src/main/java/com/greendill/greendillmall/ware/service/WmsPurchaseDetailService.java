package com.greendill.greendillmall.ware.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.greendill.common.utils.PageUtils;
import com.greendill.greendillmall.ware.entity.WmsPurchaseDetailEntity;

import java.util.Map;

/**
 * @author Dennis Wang
 * @email Dennis.june@outlook.com
 * @date 2020-07-20 16:38:49
 */
public interface WmsPurchaseDetailService extends IService<WmsPurchaseDetailEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

