package com.bdqn.meituan.vo;

import java.util.Date;
import java.util.List;
/**
 * 
 * @author Grace
 *与数据库表对应的实体类
 *
 */
public class Goods {
	private int goodsid;
	private int typeid;
	private String defaultpic;
	private String goodsname;
	private String goodsadv;
	private double proprice;//促销价，为0时在页面不显示
	private double groprice;
	private double storeprice;
	private int evaluation;//计算评价
	private int sales;//销量
	private int evalnums;//评价人数
	private double cut;//手机买立减
	private int rownum;//用于名店商品查询时数量
	private Date expire;//有限期
	private int toptype;//隶属的最大类型id
	private String toptypename;//隶属的最大类型的名称
	private int sectype;//隶属的第二类型id
	private String sectypename;//隶属的第二类型的名称
	private String typename;//第三级别的类型Id
	private List<GoodsPacks> gpacks;//一个商品有多个套餐
	private List<GoodsPics> gpics;//一个商品有多个图片
	public int getGoodsid() {
		return goodsid;
	}
	public void setGoodsid(int goodsid) {
		this.goodsid = goodsid;
	}
	public int getTypeid() {
		return typeid;
	}
	public void setTypeid(int typeid) {
		this.typeid = typeid;
	}
	public String getDefaultpic() {
		return defaultpic;
	}
	public void setDefaultpic(String defaultpic) {
		this.defaultpic = defaultpic;
	}
	public String getGoodsname() {
		return goodsname;
	}
	public void setGoodsname(String goodsname) {
		this.goodsname = goodsname;
	}
	public String getGoodsadv() {
		return goodsadv;
	}
	public double getGroprice() {
		return groprice;
	}
	public void setGroprice(double groprice) {
		this.groprice = groprice;
	}
	public void setGoodsadv(String goodsadv) {
		this.goodsadv = goodsadv;
	}
	public double getProprice() {
		return proprice;
	}
	public void setProprice(double proprice) {
		this.proprice = proprice;
	}
	public double getStoreprice() {
		return storeprice;
	}
	public void setStoreprice(double storeprice) {
		this.storeprice = storeprice;
	}
	public int getSales() {
		return sales;
	}
	public void setSales(int sales) {
		this.sales = sales;
	}
	public int getEvaluation() {
		return evaluation;
	}
	public void setEvaluation(int evaluation) {
		this.evaluation = evaluation;
	}
	public int getEvalnums() {
		return evalnums;
	}
	public void setEvalnums(int evalnums) {
		this.evalnums = evalnums;
	}
	public double getCut() {
		return cut;
	}
	public void setCut(double cut) {
		this.cut = cut;
	}
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public Date getExpire() {
		return expire;
	}
	public void setExpire(Date expire) {
		this.expire = expire;
	}
	public int getToptype() {
		return toptype;
	}
	public void setToptype(int toptype) {
		this.toptype = toptype;
	}
	public String getToptypename() {
		return toptypename;
	}
	public void setToptypename(String toptypename) {
		this.toptypename = toptypename;
	}
	public int getSectype() {
		return sectype;
	}
	public void setSectype(int sectype) {
		this.sectype = sectype;
	}
	public String getSectypename() {
		return sectypename;
	}
	public void setSectypename(String sectypename) {
		this.sectypename = sectypename;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	public List<GoodsPacks> getGpacks() {
		return gpacks;
	}
	public void setGpacks(List<GoodsPacks> gpacks) {
		this.gpacks = gpacks;
	}
	public List<GoodsPics> getGpics() {
		return gpics;
	}
	public void setGpics(List<GoodsPics> gpics) {
		this.gpics = gpics;
	}
	
}
