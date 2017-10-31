package com.bdqn.meituan.dao;

public interface TimeoutDAO {
	//团购抢购部分，到时间就给下架
	public void removeTimeoutGoods();
}
