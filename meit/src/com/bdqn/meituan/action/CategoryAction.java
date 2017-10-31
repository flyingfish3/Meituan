package com.bdqn.meituan.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bdqn.meituan.service.CategoryService;
import com.bdqn.meituan.vo.GoodsPageVO;

@Controller
public class CategoryAction {
	@Autowired
	private CategoryService cs;

	@RequestMapping("/category.do")
	public String findTypeGoods(HttpSession session, GoodsPageVO gpvo) {
		/*
		 * 1从首页跳转过来， 
		 * 第一次获取times为null，则
		 * a获取session中的areaid，以及超链接传过来的typeid,将他们塞入session中：firstTypeid和firstAreaid 
		 * b然后查询页面所需要的 
		 * 2经过筛选过滤后
		 * 
		 * 第二次获取times不为null，则
		 * a根据从category.jsp页面传过来的form表单，对应的gpvo实体类中的值设置相关属性，
		 * b执行查询
		 * c如果表单里传递过来的typeid=0,则将firsttypeid设置到filter里面；
		 *  如果表单里传递过来的areaid=0,则将firstareaid设置到filter里面 
		 *  不需要考虑packname是否为空
		 */
		if (session.getAttribute("times") == null) {
			int areaid = (Integer) session.getAttribute("areaid");
			int typeid = gpvo.getTypeid();// a标签，不知道能不能获取。先试试
			// 第一次从首页进入分类页面
			session.setAttribute("times", 1);
			session.setAttribute("firstTypeid", typeid);
			session.setAttribute("firstAreaid", areaid);

			/* 从首页跳转到分类页面思路：从首页调到分类页面需要的数据 */
			// 所有对应的三级类型(a标签传递过来的typeid)
			session.setAttribute("typesVO", cs.findThirdTypes(typeid));
			// 所有的第二类型的地区对应的第三类型地区(session里获取的areaid)
			session.setAttribute("thirdAreas", cs.findSec_ThirdAreas(areaid));
			// 所有的套餐
			session.setAttribute("packs", cs.findPacks());
			// 页面的商品数据
			gpvo.setAreaid(areaid);
			gpvo.setTypeid(typeid);
			session.setAttribute("gp", cs.fillData(gpvo));
		} else if (session.getAttribute("times") != null) {
			//如果是第一次则filter需要new出来，不是第一次就要从session里面获取
			GoodsPageVO filters=null;
			if(session.getAttribute("filters")==null){
				filters=new GoodsPageVO();
			}else{
				filters = (GoodsPageVO)session.getAttribute("filters");//用于让过滤条显示
			}
			
			GoodsPageVO forsearch=new GoodsPageVO();//用于查询
			if (gpvo.getTypeid() == 0) {// 过滤条件未设置typeid
				forsearch.setTypeid((Integer) session.getAttribute("firstTypeid"));
				forsearch.setTypename(cs.getTypename((Integer) session.getAttribute("firstTypeid")));
				//进入此选项的有两种情况：1从首页进入到分类，为选择；2从分类筛选后进入分类，但未选择此条件（此时要把filters中该条件删掉）
				filters.setTypeid(gpvo.getTypeid());
				filters.setTypename(cs.getTypename(gpvo.getTypeid()));
			} else {
				forsearch.setTypeid(gpvo.getTypeid());
				forsearch.setTypename(cs.getTypename(gpvo.getTypeid()));
				//用户勾选了该过滤type条件的话，就把该过滤条件对应的session属性删掉
				session.removeAttribute("typesVO");
				//如果用户勾选了过滤条件，那就把这个条件记录到session里面，待会儿返回页面时再次显示
				filters.setTypeid(gpvo.getTypeid());
				filters.setTypename(cs.getTypename(gpvo.getTypeid()));
			}
			if (gpvo.getAreaid() == 0) {// 过滤条件未设置areaid
				forsearch.setAreaid((Integer) session.getAttribute("firstAreaid"));
				forsearch.setAreaname(cs.getAreaname((Integer) session.getAttribute("firstAreaid")));
			} else {
				forsearch.setAreaid(gpvo.getAreaid());
				forsearch.setAreaname(cs.getAreaname(gpvo.getAreaid()));
				//用户勾选了该过滤area条件的话，就把该过滤条件对应的session属性删掉
				session.removeAttribute("thirdAreas");
				//如果用户勾选了过滤条件，那就把这个条件记录到session里面，待会儿返回页面时再次显示
				filters.setAreaid(gpvo.getAreaid());
				filters.setAreaname(cs.getAreaname(gpvo.getAreaid()));
			}
			if (gpvo.getPackname() != null) {
				forsearch.setPackname(gpvo.getPackname());
				//用户勾选了该过滤pack条件的话，就把该过滤条件对应的session属性删掉
				session.removeAttribute("packs");
				//如果用户勾选了过滤条件，那就把这个条件记录到session里面，待会儿返回页面时再次显示
				filters.setPackname(gpvo.getPackname());
			}
			//把filter存入session里面。页面上面获取的时候，依次遍历filter中的相关属性，有则在页面显示
			session.setAttribute("filters", filters);
			session.setAttribute("gp", cs.fillData(forsearch));
		}
		return "category";
	}
}
