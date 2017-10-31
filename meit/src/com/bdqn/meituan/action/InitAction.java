package com.bdqn.meituan.action;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bdqn.meituan.service.InitService;

@Controller
public class InitAction {
	@Autowired
	private InitService is;
	//查询所有的商品的类型
	@RequestMapping("/init.do")
	public String findIndexGoods(HttpSession session,@RequestParam(defaultValue="108",required=false) int areaid){
		session.setAttribute("cargoods",is.findCarGoods(areaid));
		session.setAttribute("specgoods",is.findSpecGoods(areaid));
		session.setAttribute("goodsVO",is.findIndexGoods(areaid));
		session.setAttribute("areaid",areaid);
		session.setAttribute("areaname",is.findAreaName(areaid));
		return "index";
	}
}
