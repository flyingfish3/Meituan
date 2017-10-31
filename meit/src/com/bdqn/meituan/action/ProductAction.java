package com.bdqn.meituan.action;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bdqn.meituan.service.ProductService;

@Controller
public class ProductAction {
	@Autowired
	private ProductService ps;
	/*@InitBinder
	public void dateFormat(ServletRequestDataBinder binder){
		DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		df.setLenient(true);
		binder.registerCustomEditor(Date.class,new CustomDateEditor(df, true));
	}*/
	//查询所有的商品的类型//查询商品对应的商铺信息
	@RequestMapping("/single.do")
	public String findIndexGoods(HttpSession session,int goodsid){
		session.setAttribute("single",ps.findSingle(goodsid));
		session.setAttribute("store",ps.findStore(goodsid));
		return "productDetail";
	}
}
