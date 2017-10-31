package com.bdqn.meituan.dao;


import com.bdqn.meituan.vo.Goods;
import com.bdqn.meituan.vo.Store;

public interface IProductDAO {
	//查询某个商品的详细信息
	public Goods findSingle(int goodsid);
	//查询某个商品隶属的商铺的相关信息
	public Store findStore(int goodsid);
}
