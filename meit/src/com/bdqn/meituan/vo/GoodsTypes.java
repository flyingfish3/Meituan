package com.bdqn.meituan.vo;

import java.util.ArrayList;
import java.util.List;


public class GoodsTypes {
	private int typeid;
	private String typename;
	private int rownum;
	private List<GoodsTypes> thirdTypes=new ArrayList<GoodsTypes>(0);//三级分类
	private List<GoodsTypes> superTypes=new ArrayList<GoodsTypes>(0);//该级别分类对应的父类型
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
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public List<GoodsTypes> getThirdTypes() {
		return thirdTypes;
	}
	public void setThirdTypes(List<GoodsTypes> thirdTypes) {
		this.thirdTypes = thirdTypes;
	}
	public List<GoodsTypes> getSuperTypes() {
		return superTypes;
	}
	public void setSuperTypes(List<GoodsTypes> superTypes) {
		this.superTypes = superTypes;
	}
}
