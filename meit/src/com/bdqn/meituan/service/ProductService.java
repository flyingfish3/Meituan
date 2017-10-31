package com.bdqn.meituan.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bdqn.meituan.dao.IProductDAO;
import com.bdqn.meituan.vo.Goods;
import com.bdqn.meituan.vo.Store;

@Service
@Transactional
public class ProductService {
	@Autowired
	private IProductDAO ipdao;
	//查询某个商品的详细信息
	public Goods findSingle(int goodsid){
		return ipdao.findSingle(goodsid);
	}
	//查询某个商品隶属的商铺的相关信息
	public Store findStore(int goodsid){
		return ipdao.findStore(goodsid);
	}
}
