package com.bdqn.meituan.vo;

public class Userinfo {
	private int userid;
	private String tel;
	private String nickname;
	private String email;
	private String password;
	
	private int levelid;
	private int areaid;
	private String potrait;
	private double balance;
	private int scores;
	private int vouchers;
	private int power;
	
	private String loginname;//页面的登录名。但是可能对应数据库中三个属性之一
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getLevelid() {
		return levelid;
	}
	public void setLevelid(int levelid) {
		this.levelid = levelid;
	}
	public int getAreaid() {
		return areaid;
	}
	public void setAreaid(int areaid) {
		this.areaid = areaid;
	}
	public String getPotrait() {
		return potrait;
	}
	public void setPotrait(String potrait) {
		this.potrait = potrait;
	}
	public double getBalance() {
		return balance;
	}
	public void setBalance(double balance) {
		this.balance = balance;
	}
	public int getScores() {
		return scores;
	}
	public void setScores(int scores) {
		this.scores = scores;
	}
	public int getVouchers() {
		return vouchers;
	}
	public void setVouchers(int vouchers) {
		this.vouchers = vouchers;
	}
	public int getPower() {
		return power;
	}
	public void setPower(int power) {
		this.power = power;
	}
	public String getLoginname() {
		return loginname;
	}
	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}
}
