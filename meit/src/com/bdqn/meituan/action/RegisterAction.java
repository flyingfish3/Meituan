package com.bdqn.meituan.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bdqn.meituan.service.RegisterService;

@Controller
@Scope("prototype")
public class RegisterAction {
	@Autowired
	private RegisterService rs;
	@ResponseBody
	@RequestMapping("getpro.do")
	public String getPros(){
		return rs.getProvs();
	}
}
