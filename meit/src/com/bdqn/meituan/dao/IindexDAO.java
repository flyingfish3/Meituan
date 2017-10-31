package com.bdqn.meituan.dao;

import java.util.List;

import com.bdqn.meituan.vo.Goods;
import com.bdqn.meituan.vo.GoodsVO;

public interface IindexDAO {
	//查询开通了直通车的商品
	public List<Goods> findCarGoods(int areaid);
	//查询名店抢购的商品
	public List<Goods> findSpecGoods(int areaid);
	//查询出首页主体部分展示所需要的商品
	public List<GoodsVO> findIndexGoods(int areaid);
	
	//根据areaid获取二级地区名称
	public String findAreaName(int areaid);
}
