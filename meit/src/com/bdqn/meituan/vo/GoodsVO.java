package com.bdqn.meituan.vo;

import java.util.ArrayList;
import java.util.List;
/**
 * 
 * @author Grace
 * 用于首页展示的商品vo类
 *typeid一级类型id
 *typename一级类型名称
 *goodslis该大类型下的前12个商品
 */
public class GoodsVO {
	private int typeid;
	private String typename;
	private String nickname;
	private String sign;
	private int areaid;
	private String areaname;
	private int superid;
	private List<Goods> goodslist=new ArrayList<Goods>(0);//所有商品（不按地区分类）
	private List<GoodsTypes> typelist=new ArrayList<GoodsTypes>(0);//商品主体展示部分所需的三级分类前五个
	private List<GoodsTypes> secTypes=new ArrayList<GoodsTypes>(0);//二级分类
	public int getTypeid() {
		return typeid;
	}
	public void setTypeid(int typeid) {
		this.typeid = typeid;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public List<Goods> getGoodslist() {
		return goodslist;
	}
	public void setGoodslist(List<Goods> goodslist) {
		this.goodslist = goodslist;
	}
	public List<GoodsTypes> getTypelist() {
		return typelist;
	}
	public void setTypelist(List<GoodsTypes> typelist) {
		this.typelist = typelist;
	}
	public String getSign() {
		return sign;
	}
	public void setSign(String sign) {
		this.sign = sign;
	}
	public List<GoodsTypes> getSecTypes() {
		return secTypes;
	}
	public void setSecTypes(List<GoodsTypes> secTypes) {
		this.secTypes = secTypes;
	}
	public int getAreaid() {
		return areaid;
	}
	public void setAreaid(int areaid) {
		this.areaid = areaid;
	}
	public String getAreaname() {
		return areaname;
	}
	public void setAreaname(String areaname) {
		this.areaname = areaname;
	}
	public int getSuperid() {
		return superid;
	}
	public void setSuperid(int superid) {
		this.superid = superid;
	}
}
