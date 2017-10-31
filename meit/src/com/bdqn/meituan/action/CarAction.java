package com.bdqn.meituan.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bdqn.meituan.componets.TempCar;
import com.bdqn.meituan.service.CarService;
import com.bdqn.meituan.vo.CarVO;
import com.bdqn.meituan.vo.Goods;

@Controller
public class CarAction {
	@Autowired
	private CarService cs;
	// 单个商品点击加入购物车，购物车数量发生变化
	@ResponseBody
	@RequestMapping("/car.do")
	public String getCar_GoodsNum(HttpSession session, int goodsid, int buynum) {
		/* 通过ajax把要添加到购物车的goodsid和buynum传递过来，存入到购物车中;并存到session里面 */
		// 先看有没有购物车，如果没有购物车就创建购物车；如果有就从session中获取购物车信息
		TempCar tc = null;
		if (session.getAttribute("basket") == null) {
			tc = new TempCar();
		} else {
			tc = (TempCar) session.getAttribute("basket");
		}
		// 把从页面获取过来的数据放入到tc，并存入到session中
		tc.addGoods(goodsid, buynum);
		session.setAttribute("basket", tc);
		//一旦basket更改，cgoodsVO也需要更改
		//新建一个carvo供存储
		List<CarVO> cgoodsVO=new ArrayList<CarVO>(0);
		//遍历tc，把他们转为carvo，供页面使用
		for(Integer key:tc.getBasket().keySet()){
			CarVO cvo=new CarVO();
			cvo.setGoodsid(key);
			//根据goodsid查询商品信息
			Goods g=cs.getGoodsByGoodsid(key);
			cvo.setDefaultpic(g.getDefaultpic());
			cvo.setGoodsadv(g.getGoodsadv());
			cvo.setGroprice(g.getGroprice());
			cvo.setBuynum(tc.getBasket().get(key));
			cgoodsVO.add(cvo);
		}
		//存入session
		session.setAttribute("cgoodsVO",cgoodsVO);
		
		int num = tc.getSize();// 购物车数量
		String n = ((Integer) num).toString();
		return n;
	}
	//???失败
	@RequestMapping("/delsinglegac.do")
	public String delSingleGac(HttpSession session,int goodsid){
		//清除session集合中的某个特定goodsid
		TempCar tc=(TempCar)session.getAttribute("basket");
		System.out.println("11:"+tc.getSize());
		System.out.println("gid:"+goodsid);
		tc.getBasket().remove(goodsid);
		System.out.println("12:"+tc.getSize());
		session.setAttribute("basket",tc);
		return "shoppingcar";
	}
}
