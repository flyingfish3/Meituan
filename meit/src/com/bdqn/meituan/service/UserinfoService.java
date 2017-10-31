package com.bdqn.meituan.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bdqn.meituan.dao.IUserinfoDAO;
import com.bdqn.meituan.vo.Userinfo;

@Service
@Transactional
public class UserinfoService {
	@Autowired
	private IUserinfoDAO iudao;
	public Userinfo getUsinfo(String loginname){
		String telReg="^[1][34578][0-9]{9}$";
		String nicknameReg="^[a-zA-Z0-9_]{3,16}$";
		String emailReg="^[a-zA-Z0-9]+@[a-zA-A0-9_]+\\.com$";
		Userinfo us=new Userinfo();
		String password=null;
		int userid=0;
		if(loginname.matches(telReg)){//使用手机号码登录
			//根据手机号码，查询用户密码
			password=iudao.getPwdByTel(loginname.trim());
			userid=iudao.getUseridByTel(loginname.trim());
			us.setPassword(password);
			us.setUserid(userid);
		}
		if(loginname.matches(nicknameReg)){
			password=iudao.getPwdByNickname(loginname.trim());
			userid=iudao.getUseridByNickname(loginname.trim());
			us.setPassword(password);
			us.setUserid(userid);
		}
		if(loginname.matches(emailReg)){
			password=iudao.getPwdByEmail(loginname.trim());
			userid=iudao.getUseridByEmail(loginname.trim());
			us.setPassword(password);
			us.setUserid(userid);
		}
		return us;
	}
	
	//根据Userid查询用户所有信息
	public Userinfo getUserinfoByUserid(int userid){
		return iudao.getUserinfoByUserid(userid);
	}
}
