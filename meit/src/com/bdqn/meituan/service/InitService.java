package com.bdqn.meituan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bdqn.meituan.dao.IindexDAO;
import com.bdqn.meituan.vo.Goods;
import com.bdqn.meituan.vo.GoodsVO;

@Service
@Transactional
public class InitService {
	@Autowired
	private IindexDAO idao;
	//查询开通直通车的商品
	public List<Goods> findCarGoods(int areaid){
		return idao.findCarGoods(areaid);
	}
	//查询名店抢购商品
	public List<Goods> findSpecGoods(int areaid){
		return idao.findSpecGoods(areaid);
	}
	//查询所首页所有类型下的商品
	public List<GoodsVO> findIndexGoods(int areaid){
		return idao.findIndexGoods(areaid);
	}
	//根据areaid获取二级地区名称
	public String findAreaName(int areaid){
		return idao.findAreaName(areaid);
	}
}
