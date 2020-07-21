package com.greendill.greendillmall.member.controller;

import java.util.Arrays;
import java.util.Map;

import com.greendill.greendillmall.member.feign.CouponFeighService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.greendill.greendillmall.member.entity.UmsMemberEntity;
import com.greendill.greendillmall.member.service.UmsMemberService;
import com.greendill.common.utils.PageUtils;
import com.greendill.common.utils.R;



/**
 * 会员
 *
 * @author Dennis Wang
 * @email Dennis.june@outlook.com
 * @date 2020-07-20 16:24:32
 */
@RestController
@RequestMapping("member/umsmember")
public class UmsMemberController {
    @Autowired
    private UmsMemberService umsMemberService;
    @Autowired
    CouponFeighService CouponFeighService;
    @RequestMapping("/coupons")
    public R MemberCoupons(){
        UmsMemberEntity UmsMemberEntity = new UmsMemberEntity();
        UmsMemberEntity.setUsername("zzzz");
        R coupons = CouponFeighService.Coupons();
        return R.ok().put("member",UmsMemberEntity).put("coupons",coupons.get("coupons"));
    }
    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = umsMemberService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
		UmsMemberEntity umsMember = umsMemberService.getById(id);

        return R.ok().put("umsMember", umsMember);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody UmsMemberEntity umsMember){
		umsMemberService.save(umsMember);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody UmsMemberEntity umsMember){
		umsMemberService.updateById(umsMember);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
		umsMemberService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
