package com.greendill.greendillmall.coupon.controller;

import java.util.Arrays;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.greendill.greendillmall.coupon.entity.SmsCategoryBoundsEntity;
import com.greendill.greendillmall.coupon.service.SmsCategoryBoundsService;
import com.greendill.common.utils.PageUtils;
import com.greendill.common.utils.R;


/**
 * 商品分类积分设置
 *
 * @author Dennis Wang
 * @email Dennis.june@outlook.com
 * @date 2020-07-20 16:13:07
 */
@RestController
@RequestMapping("coupon/smscategorybounds")
public class SmsCategoryBoundsController {
    @Autowired
    private SmsCategoryBoundsService smsCategoryBoundsService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = smsCategoryBoundsService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id) {
        SmsCategoryBoundsEntity smsCategoryBounds = smsCategoryBoundsService.getById(id);

        return R.ok().put("smsCategoryBounds", smsCategoryBounds);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody SmsCategoryBoundsEntity smsCategoryBounds) {
        smsCategoryBoundsService.save(smsCategoryBounds);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody SmsCategoryBoundsEntity smsCategoryBounds) {
        smsCategoryBoundsService.updateById(smsCategoryBounds);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids) {
        smsCategoryBoundsService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
