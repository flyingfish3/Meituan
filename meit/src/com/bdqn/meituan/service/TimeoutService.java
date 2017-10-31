package com.bdqn.meituan.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;


public class TimeoutService {
	public void removeTimeoutGoods(){
		System.out.println("sfsfds");
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session=request.getSession();
		if(session.getAttribute("specgoods")!=null){
			session.removeAttribute("specgoods");
		}
		System.out.println("嗯嗯嗯");
	}
}
