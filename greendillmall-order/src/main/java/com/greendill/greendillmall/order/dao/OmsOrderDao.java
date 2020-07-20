package com.greendill.greendillmall.order.dao;

import com.greendill.greendillmall.order.entity.OmsOrderEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 订单
 * 
 * @author Dennis Wang
 * @email Dennis.june@outlook.com
 * @date 2020-07-20 16:32:44
 */
@Mapper
public interface OmsOrderDao extends BaseMapper<OmsOrderEntity> {
	
}
