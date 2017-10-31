package com.bdqn.meituan.demo;


import java.awt.Color;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.util.HashMap;
import java.util.Map;

import javax.jms.Session;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.bdqn.meituan.componets.TempCar;
import com.bdqn.meituan.dao.ICarDAO;
import com.bdqn.meituan.dao.ICategoryDAO;
import com.bdqn.meituan.dao.IPositionDAO;
import com.bdqn.meituan.dao.IProductDAO;
import com.bdqn.meituan.dao.IindexDAO;
import com.bdqn.meituan.service.CarService;
import com.bdqn.meituan.service.CategoryService;
import com.bdqn.meituan.service.InitService;
import com.bdqn.meituan.service.PositionService;
import com.bdqn.meituan.vo.Goods;
import com.bdqn.meituan.vo.GoodsPageVO;
import com.bdqn.meituan.vo.GoodsTypes;
import com.bdqn.meituan.vo.Userinfo;

public class Demo {
	public static void main(String[] args) {
		/*BufferedImage image=new BufferedImage(80, 30,BufferedImage.TYPE_INT_RGB);
		Graphics g=image.getGraphics();
		g.setColor(new Color(255,255,255));
		g.fillRect(0, 0,80,30);
		g.setColor(new Color(255,0,0));*/
		//String randomStr=randStr();
		
		ApplicationContext ac=new FileSystemXmlApplicationContext("/WebRoot/WEB-INF/spring-servlet.xml");
		//PositionService ps=ac.getBean(PositionService.class);
		//System.out.println(ps.findAllProvinces());
		//System.out.println("demo---------------"+ps.findSpecCitys(23));
		/*IPositionDao idao=ac.getBean(IPositionDao.class);
		System.out.println(idao.findSpecCitys(10));*/
		/*IindexDao id=ac.getBean(IindexDao.class);
		System.out.println(id.findAreaName(109));*/
		/*InitService is=ac.getBean(InitService.class);*/
		/*首页主体部分商品查询测试
		List<GoodsTypes> ls=id.findIndexGoods().get(5).getTypelist();
		for(GoodsTypes t:ls){
			System.out.println(t.getTypename());
		}*/
		/*查询抢购商品*/
		/*System.out.println(id.findSpecGoods());*/
		//测试查询单个商品信息
		//IProductDAO ipd=ac.getBean(IProductDAO.class);
		
		//if(ipd.findSingle(80).getGpacks().size()==0){System.out.println("sd");}
		//System.out.println(ipd.findStore(123));
		
		/*IindexDao idao=ac.getBean(IindexDao.class);
		System.out.println(idao.findSecTypes(1).get(0).getThirdTypes().size());*/
		
		/*IPositionDAO ipdao=ac.getBean(IPositionDAO.class);
		System.out.println(ipdao.findLetter_Areas().size());*/
		/*CategoryService cs=ac.getBean(CategoryService.class);
		ICategoryDAO icdao=ac.getBean(ICategoryDAO.class);
		GoodsPageVO gpvo=new GoodsPageVO();
		gpvo.setTypeid(1);
		gpvo.setAreaid(108);
		//gpvo.setPageSize(30);
		System.out.println(cs.fillData(gpvo).getGvo().size());*/
		/*CategoryService cs=ac.getBean(CategoryService.class);
		System.out.println(cs.findThirdTyped(1).size());*/
		/*ICategoryDAO icdao=ac.getBean(ICategoryDAO.class);
		System.out.println(icdao.findFirTypes());*/
		/*CategoryService cs=ac.getBean(CategoryService.class);*/
		/*GoodsPageVO gpvo=new GoodsPageVO();
		gpvo.setTypeid(15);
		gpvo.setAreaid(108);
		System.out.println(cs.fillData(gpvo));*/
		/*if(cs.findThirdTypes(15).getThirdTypes().isEmpty()){
			System.out.println(1);
		}else{
			System.out.println(0);
		}*/
		
		/*双表插入，购物车存入数据库测试
		CarService cs=ac.getBean(CarService.class);
		//获取两个对象
		Userinfo us=new Userinfo();
		us.setUserid(5000);
		TempCar tcar=new TempCar();
		Map<Integer,Integer> m=new HashMap<Integer,Integer>(0);
		m.put(156,2);
		tcar.setBasket(m);
		//调用服务类，持久化数据
		cs.saveBuyCar(tcar, us);*/
		
		/*ICarDAO icdao=ac.getBean(ICarDAO.class);
		String carid=icdao.findCar(10000);
		if(carid==null){System.out.println(123);}*/
	}
}
