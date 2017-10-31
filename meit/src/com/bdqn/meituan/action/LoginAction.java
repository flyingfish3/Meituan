package com.bdqn.meituan.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bdqn.meituan.componets.TempCar;
import com.bdqn.meituan.service.CarService;
import com.bdqn.meituan.service.UserinfoService;
import com.bdqn.meituan.vo.CarVO;
import com.bdqn.meituan.vo.Goods;
import com.bdqn.meituan.vo.GoodsAndCar;
import com.bdqn.meituan.vo.Userinfo;

@Controller
@Scope("prototype")
public class LoginAction {
	@Autowired
	private UserinfoService uService;
	@Autowired
	private CarService cs;

	@RequestMapping("/login.do")
	public String login(HttpServletRequest req, Userinfo us, String beforeurl) {
		/*
		 * 用户可以利用手机号、用户名或者邮箱登录。所以要进行三次判断；
		 * 获取前台出来的表单里的相关信息，查询数据库中相关信息，对比，相同则登录，返回前一页；否则留在本页面
		 */
		String loginname = us.getLoginname().trim();
		String password = us.getPassword().trim();
		Userinfo realUs = uService.getUsinfo(loginname);
		String realpwd = realUs.getPassword();
		int userid = realUs.getUserid();
		String tourl = null;
		if (password.equals(realpwd)) {
			// 登录通过，返回前一页
			tourl = beforeurl;
			HttpSession session = req.getSession();
			// 把用户信息存到session里面
			session.setAttribute("user", uService.getUserinfoByUserid(userid));

			/*
			 * 获取购物车思路： 如果数据库里没有购物车，则新建
			 * 如果数据看里有购物车，把购物车取出来，如页面临时购物车合并，生成新的临时购物车放入session里
			 */
			// 根据Userid,查询用户的(car和)goodsandcar,存到session之后
			List<GoodsAndCar> gacs = cs.getGacsByUserid(userid);
			// 从session里面获取临时购物车basket,与数据库中取出来的进行对比。跟新goodsandcar表中的adddate和buynum
			TempCar tc = (TempCar) session.getAttribute("basket");
			if(tc!=null){
				Map<Integer, Integer> alltempgoods = tc.getBasket();
				TempCar dif = new TempCar();
				if(gacs!=null){
					for (GoodsAndCar gac : gacs) {
						for (Integer key : alltempgoods.keySet()) {
							if (key != gac.getGoodsid()) {
								// 把所有不同的加入临时购物车
								dif.addGoods(gac.getGoodsid(), gac.getBuynum());
							}
						}
					}
					Map<Integer, Integer> alldifgoods = tc.getBasket();
					for (Integer key : alldifgoods.keySet()) {
						tc.addGoods(key, alldifgoods.get(key));
					}
				}
			}
			// 新的临时购物车存入到session里
			session.setAttribute("basket", tc);

			/*
			 * 获取页面所需购物车思路： 根据session里面的user和basket把用户的购物车信息获取存到cgoods里。
			 * tc中的map里，存放了一系列goodsid和buynum 遍历tc
			 */
			// 新建一个carvo供存储
			List<CarVO> cgoodsVO = new ArrayList<CarVO>(0);
			// 遍历tc，把他们转为carvo，供页面使用
			if(tc!=null){
				for (Integer key : tc.getBasket().keySet()) {
					CarVO cvo = new CarVO();
					cvo.setGoodsid(key);
					// 根据goodsid查询商品信息
					Goods g = cs.getGoodsByGoodsid(key);
					cvo.setDefaultpic(g.getDefaultpic());
					cvo.setGoodsadv(g.getGoodsadv());
					cvo.setGroprice(g.getGroprice());
					cvo.setBuynum(tc.getBasket().get(key));
					cgoodsVO.add(cvo);
				}
			}
			// 存入session
			session.setAttribute("cgoodsVO", cgoodsVO);

			// 把数据库中这两个记录删除(级联删除)
			cs.delCar(userid);
		} else {
			// 登录不通过，留在登录页面
			tourl = req.getHeader("referer");
		}
		return "redirect:" + tourl;
	}
}
