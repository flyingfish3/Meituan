package com.bdqn.meituan.vo;

import java.util.ArrayList;
import java.util.List;
/**
 * 
 * @author Grace
 *分类查询时，商品pageVO类
 *
 */
public class GoodsPageVO {
	private int currentPage=1;//当前页
	private int pageSize=20;//每页显示的商品的数量
	private List<Goods> gvo=new ArrayList<Goods>(0);//每页显示的商品集合
	private int countPage;
	//查询条件
	private int typeid;
	private String typename;
	private int areaid;
	private String areaname;
	private String packname;
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getCountPage() {
		return countPage;
	}
	public void setCountPage(int countPage) {
		this.countPage = countPage;
	}
	public int getAreaid() {
		return areaid;
	}
	public void setAreaid(int areaid) {
		this.areaid = areaid;
	}
	public List<Goods> getGvo() {
		return gvo;
	}
	public void setGvo(List<Goods> gvo) {
		this.gvo = gvo;
	}
	public int getTypeid() {
		return typeid;
	}
	public void setTypeid(int typeid) {
		this.typeid = typeid;
	}
	public String getPackname() {
		return packname;
	}
	public void setPackname(String packname) {
		this.packname = packname;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	public String getAreaname() {
		return areaname;
	}
	public void setAreaname(String areaname) {
		this.areaname = areaname;
	}
	
}
