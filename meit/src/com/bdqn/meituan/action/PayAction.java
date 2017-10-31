package com.bdqn.meituan.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@Controller
@Scope("prototype")
public class PayAction {
	//提交订单
	public String pay(){
		
		return "pay";
	}
}
