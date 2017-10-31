package com.bdqn.meituan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bdqn.meituan.dao.ICategoryDAO;
import com.bdqn.meituan.vo.GoodsPacks;
import com.bdqn.meituan.vo.GoodsPageVO;
import com.bdqn.meituan.vo.GoodsTypes;
import com.bdqn.meituan.vo.Position;

@Service
@Transactional
public class CategoryService {
	@Autowired
	private ICategoryDAO icdao;
	
	/*分页查询
	 * 也要考虑三种情况
	 * */
	public GoodsPageVO fillData(GoodsPageVO gpvo){
		List<GoodsTypes> fts=icdao.findFirTypes();
		List<GoodsTypes> sts=icdao.findSecTypes();
		List<GoodsTypes> tts=icdao.findThirTypes();
		int typeid=gpvo.getTypeid();
		for(GoodsTypes ft:fts){
			if(typeid==ft.getTypeid()){
				//System.out.println("service中typeid:"+gpvo.getTypeid()+"---------service中areaid"+gpvo.getAreaid());
				//System.out.println(icdao.findFirst_TypeGoods(gpvo)+";"+icdao.findFirst_CountPage(gpvo));
				gpvo.setGvo(icdao.findFirst_TypeGoods(gpvo));
				gpvo.setCountPage(icdao.findFirst_CountPage(gpvo));
				break;
			}
		}
		for(GoodsTypes st:sts){
			if(typeid==st.getTypeid()){
				gpvo.setGvo(icdao.findSecond_TypeGoods(gpvo));
				gpvo.setCountPage(icdao.findSecond_CountPage(gpvo));
				break;
			}
		}
		for(GoodsTypes tt:tts){
			if(typeid==tt.getTypeid()){
				gpvo.setGvo(icdao.findThird_TypeGoods(gpvo));
				gpvo.setCountPage(icdao.findThird_CountPage(gpvo));
				break;
			}
		}
		return gpvo;
	}
	/*三级地区查询
	先查询出所有的一级 二级 三级typeid
	判断传入的typeid是属于哪个级别
	对不同的级别进行不同的逻辑操作，如下：
		如果首页传来的是一级typeid，则查询该一级下所有的三级typeid和 该一级typeid对应的typename;
		如果首页传来的是二级typeid，则查询该二级下所有的三级typeid和 该二级typeid对应的一级typename以及自己的typename
		如果首页传来的是三级typeid，则查询该三级对应的二级和一级的typename
	*/
	public GoodsTypes findThirdTypes(int typeid){
		List<GoodsTypes> fts=icdao.findFirTypes();
		List<GoodsTypes> sts=icdao.findSecTypes();
		List<GoodsTypes> tts=icdao.findThirTypes();
		GoodsTypes typesVO=null;
		for(GoodsTypes ft:fts){
			if(typeid==ft.getTypeid()){
				typesVO=icdao.findFirst_ThridTypes(typeid);
				break;
			}
		}
		for(GoodsTypes st:sts){
			if(typeid==st.getTypeid()){
				typesVO=icdao.findSec_ThirdTypes(typeid);
				break;
			}
		}
		for(GoodsTypes tt:tts){
			if(typeid==tt.getTypeid()){
				typesVO=icdao.findThir_SuperTypes(typeid);
				break;
			}
		}
		return typesVO;
	}
	
	public List<Position> findSec_ThirdAreas(int areaid){
		return icdao.findSec_ThirdAreas(areaid);
	}
	
	public List<GoodsPacks> findPacks(){
		return icdao.findPacks();
	}
	
	public String getTypename(int typeid){
		return icdao.getTypename(typeid);
	}
	
	public String getAreaname(int areaid){
		return icdao.getAreaname(areaid);
	}
}
