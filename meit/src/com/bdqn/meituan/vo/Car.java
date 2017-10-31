package com.bdqn.meituan.vo;

import java.util.Date;
import java.util.List;
/**
 * 购物车类。
 * 作用1
 * 在临时购物车TempCar被销毁前，如果用户登录了，则在插入数据库时，需要把TempCar转化为此类，然后插入数据库
 * @author Grace
 */
public class Car {
	private int carid;
	private int userid;
	private Date adddate;
	public int getCarid() {
		return carid;
	}
	public void setCarid(int carid) {
		this.carid = carid;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public Date getAdddate() {
		return adddate;
	}
	public void setAdddate(Date adddate) {
		this.adddate = adddate;
	}
}
