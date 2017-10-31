package com.bdqn.meituan.componets;

import java.util.HashMap;
import java.util.Map;
/**
 * 这个是临时购物车类。用于存放商品id和数量，便于页面显示
 * 用户不必登录
 * 如果用户登录了，则在会话结束之前将其存入到数据库中（双表插入购物车表和 商品和购物车表）
 * @author Grace
 */
public class TempCar {
	private Map<Integer,Integer> basket=new HashMap<Integer,Integer>();
	private int size=0;
	//添加购物车
	public void addGoods(int goodsid,int buynum){
		if(basket.containsKey("goodsid")){
			basket.put(goodsid, basket.get(goodsid)+buynum);
		}else{
			basket.put(goodsid,buynum);
		}
		size=basket.size();
	}
	//清理购物车
	public void clearShop(){
		basket.clear();
		size=0;
	}
	//查询所有的购物车商品
	public Map<Integer,Integer> findAll(){
		return basket;
	}
	//set和get方法
	public Map<Integer, Integer> getBasket() {
		return basket;
	}
	public void setBasket(Map<Integer, Integer> basket) {
		this.basket = basket;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	
	
	
	
	
	
	
}
