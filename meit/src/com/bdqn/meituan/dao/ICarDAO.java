package com.bdqn.meituan.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.bdqn.meituan.vo.Car;
import com.bdqn.meituan.vo.CarVO;
import com.bdqn.meituan.vo.Goods;
import com.bdqn.meituan.vo.GoodsAndCar;

public interface ICarDAO {
	//双表插入：插入购物车表
	public void insertCar(Car car);
	//双表插入：插入商品和购物车中间表(因为一个购物车里面有多个商品，所以在插入一个购物车时，购物车和商品表会插入一个List)
	public void insertGoodsAndCar(List<GoodsAndCar> gac);
	
	//根据userid查询car和carandshop
	@Select("SELECT CARID FROM CAR WHERE USERID =#{userid}")
	public String getCaridByUserid(int userid);
	@Select("SELECT GAC.GACID, GAC.CARID, GAC.GOODSID, GAC.BUYNUM FROM GOODSANDCAR GAC WHERE GAC.CARID =#{carid}")
	public List<GoodsAndCar> getGacsByCarid(int carid);
	
	//根据Userid删除
	@Select("DELETE FROM CAR WHERE USERID =#{userid}")
	public void delCar(int userid);
	
	/*//根据Userid查询页面所需要的购物车信息
	public List<CarVO> getCarGoods(int userid);*/
	@Select("select * from goods where goodsid=#{goodsid}")
	public Goods getGoodsByGoodsid(int goodsid);
	
	/*//根据goodsid删除某个用户下购物车的商品
	public void delSinglegac(GoodsAndCar gac);*/
}
