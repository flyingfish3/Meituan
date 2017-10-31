package com.bdqn.meituan.vo;

import java.util.List;

public class Store {
	private String toparea;
	private String secarea;
	private String thirdarea;
	private String storeadd;
	private int storeid;
	private String storename;
	private int evalnums;
	private double evalscores;
	private String subwayadd;
	private String tel;
	private String storectx;
	private List<StorePics> stpics;//一个商铺多个商铺展示图片
	private List<Goods> stgoods;//一个商铺多个商品
	public String getToparea() {
		return toparea;
	}
	public void setToparea(String toparea) {
		this.toparea = toparea;
	}
	public String getSecarea() {
		return secarea;
	}
	public void setSecarea(String secarea) {
		this.secarea = secarea;
	}
	public String getThirdarea() {
		return thirdarea;
	}
	public void setThirdarea(String thirdarea) {
		this.thirdarea = thirdarea;
	}
	public String getStoreadd() {
		return storeadd;
	}
	public void setStoreadd(String storeadd) {
		this.storeadd = storeadd;
	}
	public int getStoreid() {
		return storeid;
	}
	public void setStoreid(int storeid) {
		this.storeid = storeid;
	}
	public String getStorename() {
		return storename;
	}
	public void setStorename(String storename) {
		this.storename = storename;
	}
	public int getEvalnums() {
		return evalnums;
	}
	public void setEvalnums(int evalnums) {
		this.evalnums = evalnums;
	}
	public double getEvalscores() {
		return evalscores;
	}
	public void setEvalscores(double evalscores) {
		this.evalscores = evalscores;
	}
	public String getSubwayadd() {
		return subwayadd;
	}
	public void setSubwayadd(String subwayadd) {
		this.subwayadd = subwayadd;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getStorectx() {
		return storectx;
	}
	public void setStorectx(String storectx) {
		this.storectx = storectx;
	}
	public List<StorePics> getStpics() {
		return stpics;
	}
	public void setStpics(List<StorePics> stpics) {
		this.stpics = stpics;
	}
	public List<Goods> getStgoods() {
		return stgoods;
	}
	public void setStgoods(List<Goods> stgoods) {
		this.stgoods = stgoods;
	}
}
