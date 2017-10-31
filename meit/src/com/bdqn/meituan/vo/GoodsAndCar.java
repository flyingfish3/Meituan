package com.bdqn.meituan.vo;
/**
 * 购物车和商品中间表，实现多对多的关系
 * 作用1
 * 在临时购物车TempCar被销毁前，如果用户登录了，则在插入数据库时，需要将TempCar类和Userinfo类转化为这个类
 * @author Grace
 */
public class GoodsAndCar {
	private int gacid;
	private int carid;
	private int goodsid;
	private int buynum;
	public int getGacid() {
		return gacid;
	}
	public void setGacid(int gacid) {
		this.gacid = gacid;
	}
	public int getCarid() {
		return carid;
	}
	public void setCarid(int carid) {
		this.carid = carid;
	}
	public int getGoodsid() {
		return goodsid;
	}
	public void setGoodsid(int goodsid) {
		this.goodsid = goodsid;
	}
	public int getBuynum() {
		return buynum;
	}
	public void setBuynum(int buynum) {
		this.buynum = buynum;
	}
}
