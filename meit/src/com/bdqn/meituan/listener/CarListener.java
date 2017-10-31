package com.bdqn.meituan.listener;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.bdqn.meituan.componets.TempCar;
import com.bdqn.meituan.service.CarService;
import com.bdqn.meituan.vo.Userinfo;

public class CarListener implements HttpSessionListener{

	public void sessionCreated(HttpSessionEvent arg0) {
	}

	public void sessionDestroyed(HttpSessionEvent event) {
		HttpSession session=event.getSession();
		/*当关闭浏览器的时候，或者会话过期，则要销毁session。在销毁session的时候，要做如下：
		 	若用户已登录，并且购物车中有商品，则双表插入存入数据库*/
		if(session.getAttribute("user")!=null&&session.getAttribute("basket")!=null){
			//获取两个对象
			Userinfo us=(Userinfo)session.getAttribute("user");
			TempCar tcar=(TempCar)session.getAttribute("basket");
			//调用服务类，持久化数据
			CarService cs=new CarService();
			cs.saveBuyCar(tcar, us);
		}
	}
	
}
