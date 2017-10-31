package com.bdqn.meituan.action;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bdqn.meituan.componets.TempCar;
import com.bdqn.meituan.service.CarService;
import com.bdqn.meituan.vo.Userinfo;

@Controller
public class ExitAction {
	@RequestMapping("/exit.do")
	public String exit(HttpSession session){
		//把购物车存入数据库（双表插入）
		if(session.getAttribute("basket")!=null){
			//获取两个对象
			Userinfo us=(Userinfo)session.getAttribute("user");
			TempCar tcar=(TempCar)session.getAttribute("basket");
			//调用服务类，持久化数据
			CarService cs=new CarService();
			cs.saveBuyCar(tcar, us);
		}
		//删除用户信息
		session.removeAttribute("user");
		System.out.println("进入exit");
		return "index";
	}
}
