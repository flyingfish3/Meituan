package com.bdqn.meituan.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.bdqn.meituan.vo.Goods;
import com.bdqn.meituan.vo.GoodsPacks;
import com.bdqn.meituan.vo.GoodsPageVO;
import com.bdqn.meituan.vo.GoodsTypes;
import com.bdqn.meituan.vo.Position;

public interface ICategoryDAO {
	/*一级typeid下：根据typeid查询商品(基于areaid上)；查询总页数*/
	public List<Goods> findFirst_TypeGoods(GoodsPageVO gpvo);
	public int findFirst_CountPage(GoodsPageVO gpvo);
	/*二级typeid下：根据typeid查询商品(基于areaid上)；查询总页数*/
	public List<Goods> findSecond_TypeGoods(GoodsPageVO gpvo);
	public int findSecond_CountPage(GoodsPageVO gpvo);
	/*三级typeid下：根据typeid查询商品(基于areaid上)；查询总页数*/
	public List<Goods> findThird_TypeGoods(GoodsPageVO gpvo);
	public int findThird_CountPage(GoodsPageVO gpvo);
	
	// 查询所有的一级分类
	@Select("SELECT gt.typeid,gt.typename FROM goodstype gt WHERE gt.supertype=0")
	public List<GoodsTypes> findFirTypes();
	// 查询所有的二级分类
	@Select("SELECT gt.typeid,gt.typename FROM goodstype gt WHERE gt.supertype IN ( SELECT g.typeid FROM goodstype g WHERE g.supertype=0)")
	public List<GoodsTypes> findSecTypes();
	// 查询所有的三级分类
	@Select(" SELECT typeid,typename FROM goodstype WHERE supertype IN(SELECT gt.typeid FROM goodstype gt WHERE gt.supertype IN ( SELECT g.typeid FROM goodstype g WHERE g.supertype=0))")
	public List<GoodsTypes> findThirTypes();
	
	//根据一级typeid查询自己的相关信息以及其下三级分类的相关信息
	public GoodsTypes findFirst_ThridTypes(int typeid);
	//根据二级typeid查询自己的相关信息以及其下三级分类的相关信息及其父分类信息
	public GoodsTypes findSec_ThirdTypes(int typeid);
	//根据三级typeid查询自己的相关信息以及其父分类信息
	public GoodsTypes findThir_SuperTypes(int typeid);
	
	//根据areaid查询该二级地区下的所有三级地区
	public List<Position> findSec_ThirdAreas(int areaid);
	
	//查询所有套餐类型（去重）
	@Select("SELECT distinct(packname) FROM PACKAGE ")
	public List<GoodsPacks> findPacks();
	
	//根据typeid查询typename
	@Select("select typename from goodstype where typeid=#{typeid}")
	public String getTypename(int typeid);
	//根据areaid查询areaname
	@Select("select areaname from area where areaid=#{areaid}")
	public String getAreaname(int areaid);
}
