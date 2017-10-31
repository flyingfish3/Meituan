package com.bdqn.meituan.dao;

import org.apache.ibatis.annotations.Select;

import com.bdqn.meituan.vo.Userinfo;

public interface IUserinfoDAO {
	//根据电话号码，查询用户密码,userid
	@Select("select password from userinfos where tel=#{tel}")
	public String getPwdByTel(String tel);
	@Select("select userid from userinfos where tel=#{tel}")
	public int getUseridByTel(String tel);
	//根据邮箱，查询用户密码,userid
	@Select("select password from userinfos where email=#{email}")
	public String getPwdByEmail(String email);
	@Select("select userid from userinfos where email=#{email}")
	public int getUseridByEmail(String email);
	//根据用户名，查询用户密码,userid
	@Select("select password from userinfos where nickname=#{nickname}")
	public String getPwdByNickname(String nickname);
	@Select("select userid from userinfos where nickname=#{nickname}")
	public int getUseridByNickname(String nickname);
	
	//根据Userid查询用户所有信息
	@Select("select * from userinfos where userid=#{userid}")
	public Userinfo getUserinfoByUserid(int userid);
}
