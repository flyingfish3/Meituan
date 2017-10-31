package com.bdqn.meituan.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bdqn.meituan.componets.TempCar;
import com.bdqn.meituan.dao.ICarDAO;
import com.bdqn.meituan.vo.Car;
import com.bdqn.meituan.vo.CarVO;
import com.bdqn.meituan.vo.Goods;
import com.bdqn.meituan.vo.GoodsAndCar;
import com.bdqn.meituan.vo.Userinfo;

@Service
@Transactional
public class CarService {
	@Autowired
	private ICarDAO icdao;

	// 将临时购物车信息存入到数据库
	public void saveBuyCar(TempCar tcar, Userinfo us) {
		/*******************双表插入 ******************/
		// 创建用于存入car表的对象Car，把TempCar转化为Car，调用dao类insertCar，存入数据库
		Car car = new Car();
		car.setUserid(us.getUserid());// 获取传入进来的用户（即正在登陆的用户的）userid
		icdao.insertCar(car);// 调用数据操作层，把car存入数据库

		// 创建用于存入goodsandcar表的对象GoodsAndCar，把TempCar中的Map转化为该对象的属性，调用dao类insertGoodsAndCar，存入数据库
		List<GoodsAndCar> gacs = new ArrayList<GoodsAndCar>(0);
		Map<Integer, Integer> allgoods = tcar.getBasket();// 获取临时购物车里面的所有商品及其buynum
		// 遍历从临时购物车里获取过来的所有商品，存到goodsandcar对应的属性中
		for (Integer key : allgoods.keySet()) {// 遍历所有的键值对，键--goodsid,值--buynum
			GoodsAndCar gac = new GoodsAndCar();
			gac.setCarid(car.getCarid());// 取出购物车carid？？
			gac.setGoodsid(key);// key对应goodsid
			gac.setBuynum(allgoods.get(key));// 通过key获取对应的值--即buynum
			gacs.add(gac);// 依次把每个gac添加到gacs里面
		}
		icdao.insertGoodsAndCar(gacs);
	}

	//从数据库里查询goodsandcar
	public List<GoodsAndCar> getGacsByUserid(int userid){
		String carid=icdao.getCaridByUserid(userid);
		List<GoodsAndCar> gacs=null;
		if(carid!=null){
			gacs=icdao.getGacsByCarid(Integer.parseInt(carid));
		}
		return gacs;
	} 
	
	//删除数据库中的car和goodsandcar
	public void delCar(int userid){
		icdao.delCar(userid);
	}
	//根据Userid查询页面所需要的购物车信息
	/*public List<CarVO> getCarGoods(int userid){
		return icdao.getCarGoods(userid);
	}*/
	public Goods getGoodsByGoodsid(int goodsid){
		return icdao.getGoodsByGoodsid(goodsid);
	}
}
